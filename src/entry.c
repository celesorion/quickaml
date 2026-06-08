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
  if (!capture_locs_valid(fvlocs, nfree))
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

struct thunk *vm_thunk_make_wrapper(size_t top_idx) {
  if (top_idx > UINT16_MAX)
    return nullptr;

  bc_t ops[] = {
      mk2(Call, 0, (uint16_t)top_idx),
      mk3(Trap, T_HALT, 0, 0),
  };
  return vm_thunk_alloc(ops, sizeof(ops) / sizeof(ops[0]), nullptr, 0, 0,
                        nullptr, 0);
}

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

struct str *vm_alloc_str(const char *data, uint32_t len) {
  struct str *s = aligned_alloc(8, str_size(len));
  if (s == nullptr)
    return nullptr;
  str_init(s, TAG_STR, len);
  memcpy(s->bytes, data, len);
  return s;
}

void vm_free_str(struct str *s) { free(s); }

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

status_t vm_exec_with_args(struct thunk *entry, struct thunk **fns,
                           size_t numfn, size_t numobject, size_t stack_slots,
                           val_t *result, struct runtime_args *rargs,
                           struct gc_stats *stats_out) {
  struct state st;
  if (stack_slots > UINT32_MAX ||
      stack_slots > (SIZE_MAX - sizeof(struct fiber_segment)) / sizeof(val_t))
    return S_LIMIT;

  struct fiber_segment *fiber =
      calloc(1, sizeof(*fiber) + stack_slots * sizeof(val_t));
  if (fiber == nullptr)
    return S_LIMIT;
  if (!heap_init(&global_heap, rargs)) {
    free(fiber);
    return S_HEAP_INIT_FAILED;
  }
  if (!state_init(&st, &global_heap, rargs)) {
    heap_deinit(&global_heap);
    free(fiber);
    return S_STATE_INIT_FAILED;
  }

  st.entry = entry;
  st.fns = fns;
  st.numfn = numfn;
  st.numobject = numobject;

  fiber->state = &st;
  fiber->parent = nullptr;
  fiber->ctbl = entry->ctbl;
  fiber->sync_addr = VAL_EMPTY;
  fiber->spawn_addr = VAL_EMPTY;
  fiber->effect_hnd = VAL_EMPTY;
  fiber->stklimit.active = fiber->stk + stack_slots;
  fiber->sc_jump = false;
  fiber->gc_poll_not_required = true;

  status_t status = vm_entry(fiber);
  if (result != nullptr) {
    val_t *bp = next_bp(fiber->stk, FRAME_HEADER_SIZE);
    *result = bp[0];
  }

  if (stats_out != nullptr)
    *stats_out = global_heap.stats;

  heap_deinit(&global_heap);
  free(fiber);
  return status;
}

status_t vm_exec(struct thunk *entry, struct thunk **fns, size_t numfn,
                 size_t numobject, size_t stack_slots, val_t *result) {
  struct runtime_args rargs = {.align = 8,
                               .base_size = 1024 * 1024,
                               .descspace_size = 4 * 4 * 4096,
                               .trace_level = TRACE_0};
  return vm_exec_with_args(entry, fns, numfn, numobject, stack_slots, result,
                           &rargs, nullptr);
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
