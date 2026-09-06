#include "alloc.h"
#include "bc.h"
#include "state.h"
#include "trace.h"
#include "trap.h"
#include "vm.h"

#include <inttypes.h>
#include <string.h>

status_t exec(struct state *state) {
  (void)state;
  return S_BAD_OP;
}

static bool capture_locs_valid(const struct capture_loc *fvlocs, size_t nfree) {
  if (nfree > UINT32_MAX)
    return false;
  if (nfree == 0)
    return true;
  if (fvlocs == nullptr)
    return false;
  for (size_t i = 0; i < nfree; i++)
    if (fvlocs[i].kind > CAPTURE_LOC_FREEVAR)
      return false;
  return true;
}

struct thunk *vm_thunk_alloc(const bc_t *ops, size_t nops, const val_t *ctbl,
                             size_t nconst, uint8_t nregs,
                             const struct capture_loc *fvlocs, size_t nfree) {
  if ((nops != 0 && ops == nullptr) || (nconst != 0 && ctbl == nullptr) ||
      !capture_locs_valid(fvlocs, nfree) ||
      nops > UINT32_MAX / sizeof(bc_t) ||
      nconst > UINT32_MAX / sizeof(val_t))
    return nullptr;

  size_t size = thunk_size(nops, nconst, nfree);
  if (size > UINT32_MAX)
    return nullptr;

  struct thunk *thunk = malloc(size);
  if (thunk == nullptr)
    return nullptr;

  thunk_init(thunk, nops, nconst, nregs, nfree);
  for (size_t i = 0; i < nfree; i++)
    thunk->freevars[i] = capture_loc_pack(fvlocs[i]);
  for (size_t i = 0; i < nops; i++)
    thunk->ops[i] = ops[i];
  for (size_t i = 0; i < nconst; i++)
    thunk->ctbl[i] = ctbl[i];
  return thunk;
}

void vm_thunk_free(struct thunk *thunk) { free(thunk); }

struct type_desc *vm_type_alloc(uint32_t nfields, uint32_t nslots,
                                const struct member_desc *members,
                                size_t nmembers) {
  if (nfields > nslots || (nmembers != 0 && members == nullptr) ||
      nmembers > UINT32_MAX)
    return nullptr;

  size_t names = 0;
  for (size_t i = 0; i < nmembers; i++) {
    if (members[i].slot >= nslots ||
        (members[i].len != 0 && members[i].name == nullptr))
      return nullptr;
    names += members[i].len + 1;
  }

  struct type_desc *desc = malloc(sizeof(*desc) +
                                  nmembers * sizeof(*members) + names);
  if (desc == nullptr)
    return nullptr;

  desc->nfields = nfields;
  desc->nslots = nslots;
  desc->nmembers = (uint32_t)nmembers;
  char *name = (char *)&desc->members[nmembers];
  for (size_t i = 0; i < nmembers; i++) {
    desc->members[i] = members[i];
    desc->members[i].name = name;
    if (members[i].len != 0)
      memcpy(name, members[i].name, members[i].len);
    name[members[i].len] = '\0';
    name += members[i].len + 1;
  }
  return desc;
}

void vm_type_free(struct type_desc *desc) { free(desc); }

bool vm_const_from_i64(int64_t value, val_t *out) {
  if (value < INT32_MIN || value > INT32_MAX || out == nullptr)
    return false;
  *out = val_from_i32((int32_t)value);
  return true;
}

bool vm_const_from_f64(double value, val_t *out) {
  if (out == nullptr)
    return false;
  *out = val_from_f64(value);
  return true;
}

struct heap *vm_heap_alloc(const struct runtime_args *rargs) {
  if (rargs == nullptr)
    return nullptr;

  struct heap *heap = malloc(sizeof(*heap));
  if (heap == nullptr)
    return nullptr;
  if (!heap_init(heap, rargs)) {
    free(heap);
    return nullptr;
  }
  return heap;
}

void vm_heap_free(struct heap *heap) {
  if (heap == nullptr)
    return;
  heap_deinit(heap);
  free(heap);
}

struct str *vm_alloc_str(const char *data, uint32_t len,
                         struct heap *restrict heap) {
  if ((len != 0 && data == nullptr) || heap == nullptr)
    return nullptr;

  struct str *s = heap_alloc_preload(heap, str_size(len));
  if (s == nullptr)
    return nullptr;
  str_init(s, TAG_STR, len);
  if (len != 0)
    memcpy(s->bytes, data, len);
  gc_publish_new_object(heap, s, OBJ_STRING);
  return s;
}

bool vm_const_from_str(const char *data, uint32_t len,
                       struct heap *restrict heap, val_t *out) {
  if (out == nullptr)
    return false;

  struct str *str = vm_alloc_str(data, len, heap);
  if (str == nullptr)
    return false;
  *out = val_from_ptr(str);
  return true;
}

size_t vm_object_size_for_fields(size_t nfields) {
  return object_size(nfields);
}

static bool result_put_escaped_byte(char *buf, size_t len, size_t *used,
                                    unsigned char byte) {
  char escaped = 0;

  switch (byte) {
  case '\n':
    escaped = 'n';
    break;
  case '\r':
    escaped = 'r';
    break;
  case '\t':
    escaped = 't';
    break;
  case '\\':
    escaped = '\\';
    break;
  case '"':
    escaped = '"';
    break;
  case '\'':
    escaped = '\'';
    break;
  default:
    break;
  }

  if (escaped) {
    if (*used + 2 >= len)
      return false;
    buf[(*used)++] = '\\';
    buf[(*used)++] = escaped;
    buf[*used] = '\0';
    return true;
  }

  if (byte < 0x20 || byte == 0x7f) {
    if (*used >= len)
      return false;
    int n = snprintf(buf + *used, len - *used, "\\x%02x", byte);
    if (n < 0 || (size_t)n >= len - *used)
      return false;
    *used += (size_t)n;
    return true;
  }

  if (*used + 1 >= len)
    return false;
  buf[(*used)++] = (char)byte;
  buf[*used] = '\0';
  return true;
}

static bool format_str_result(const struct str *s, char *buf, size_t len) {
  size_t used = 0;
  size_t slen = str_len(s);

  buf[0] = '\0';
  if (used + 1 >= len)
    return false;
  buf[used++] = '"';
  buf[used] = '\0';

  for (size_t i = 0; i < slen; i++) {
    if (!result_put_escaped_byte(buf, len, &used, (unsigned char)s->bytes[i]))
      return false;
  }

  if (used + 1 >= len)
    return false;
  buf[used++] = '"';
  buf[used] = '\0';
  return true;
}

bool vm_format_result(val_t value, char *buf, size_t len) {
  int n = 0;

  if (buf == nullptr || len == 0)
    return false;

  if (val_is_null(value))
    n = snprintf(buf, len, "()");
  else if (val_is_bool(value))
    n = snprintf(buf, len, "%s", val_as_bool(value) ? "true" : "false");
  else if (val_is_int(value))
    n = snprintf(buf, len, "%" PRId32, val_as_i32(value));
  else if (val_is_float(value))
    n = snprintf(buf, len, "%.17g", val_as_f64(value));
  else if (val_is_cell(value) && !val_is_empty(value)) {
    void *ref = val_as_ptr(value);
    if (obj_kind_of(ref) == OBJ_STRING) {
      struct str *s = ref;
      return format_str_result(s, buf, len);
    } else if (obj_kind_of(ref) == OBJ_WORDS) {
      struct object *obj = ref;
      size_t nfields = (obj_size(obj) - sizeof(*obj)) / sizeof(val_t);
      if (nfields != 0)
        return false;
      switch ((enum tag)obj_layout_tag(obj)) {
      case TAG_ARRAY:
        n = snprintf(buf, len, "[]");
        break;
      case TAG_MAP:
        n = snprintf(buf, len, "{}");
        break;
      default:
        return false;
      }
    } else
      return false;
  } else
    return false;

  return n >= 0 && (size_t)n < len;
}

const char *vm_status_name(status_t status) {
  const char *name = status_str(status);
  return name ? name : "unknown";
}

status_t vm_exec_with(struct heap *heap, struct thunk *entry,
                      struct thunk **fns, struct type_desc **types,
                      size_t numfn, size_t numobject, size_t numtype,
                      size_t stack_slots, val_t *result,
                      struct gc_stats *stats_out) {
  struct state st;
  if (heap == nullptr)
    return S_HEAP_INIT_FAILED;
  if (stack_slots > UINT32_MAX ||
      stack_slots > (SIZE_MAX - sizeof(struct fiber_segment)) / sizeof(val_t))
    return S_LIMIT;

  struct fiber_segment *fiber =
      calloc(1, sizeof(*fiber) + stack_slots * sizeof(val_t));
  if (fiber == nullptr)
    return S_LIMIT;
  if (!state_init(&st, heap, &heap->args)) {
    free(fiber);
    return S_STATE_INIT_FAILED;
  }

  st.entry = entry;
  st.fns = fns;
  st.types = types;
  st.numfn = numfn;
  st.numobject = numobject;
  st.numtype = numtype;

  fiber->state = &st;
  fiber->parent = nullptr;
  fiber->ctbl = entry->ctbl;
  fiber->sync_addr = VAL_EMPTY;
  fiber->spawn_addr = VAL_EMPTY;
  fiber->effect_hnd = VAL_EMPTY;
  fiber->stklimit.active = fiber->stk + stack_slots;
  fiber->sc_jump = false;
  fiber->gc_poll_not_required = heap_gc_poll_not_required(heap);

  status_t status = vm_entry(fiber);
  if (result != nullptr) {
    val_t *bp = next_bp(fiber->stk, FRAME_HEADER_SIZE);
    *result = bp[0];
  }

  if (stats_out != nullptr)
    *stats_out = heap->stats;

  free(fiber);
  return status;
}

status_t vm_exec_with_args(struct thunk *entry, struct thunk **fns,
                           struct type_desc **types, size_t numfn,
                           size_t numobject, size_t numtype,
                           size_t stack_slots, val_t *result,
                           struct runtime_args *rargs,
                           struct gc_stats *stats_out) {
  struct heap *heap = vm_heap_alloc(rargs);
  if (heap == nullptr)
    return S_HEAP_INIT_FAILED;
  status_t status = vm_exec_with(heap, entry, fns, types, numfn, numobject,
                                 numtype, stack_slots, result, stats_out);
  vm_heap_free(heap);
  return status;
}

status_t vm_exec(struct thunk *entry, struct thunk **fns,
                 struct type_desc **types, size_t numfn, size_t numobject,
                 size_t numtype, size_t stack_slots, val_t *result) {
  struct runtime_args rargs = {.align = 8,
                               .base_size = 1024 * 1024,
                               .descspace_size = 4 * 4 * 4096,
                               .trace_level = TRACE_0};
  return vm_exec_with_args(entry, fns, types, numfn, numobject, numtype,
                           stack_slots, result, &rargs, nullptr);
}

int main(int argc, const char *const argv[]) {
  (void)argv;
  if (argc <= 1)
    return exit_with_status(S_INSUFFICIENT_ARGS);

  char *tls = getenv("QUICKAML_TRACE_LEVEL");
  trace_level_t tl = tls ? strtoul(tls, nullptr, 10) : TRACE_ALL;

  struct runtime_args rargs = {.align = 8,
                               .base_size = 1024 * 1024,
                               .descspace_size = 4 * 4 * 4096,
                               .trace_level = tl};
  struct state st;

  trace(&st, TRACE_0, "trace level is set to %u", rargs.trace_level);

  if (!heap_init(&global_heap, &rargs))
    return S_HEAP_INIT_FAILED;
  if (!state_init(&st, &global_heap, &rargs))
    return S_STATE_INIT_FAILED;

  return exit_with_status(exec(&st));
}
