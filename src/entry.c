#include "alloc.h"
#include "bc.h"
#include "state.h"
#include "vm.h"

#include <string.h>

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

/* The type value, its description and the member names share one block:
 * the description follows the value's slots, the names the member table. */
struct object *vm_type_alloc(const char *name, uint32_t namelen,
                             const struct member_desc *members,
                             uint32_t nfields, uint32_t nmethods,
                             uint32_t nfunctions,
                             struct thunk *const *thunks) {
  size_t nmembers = (size_t)nfields + nmethods + nfunctions;
  size_t nthunks = (size_t)nmethods + nfunctions;
  if ((namelen != 0 && name == nullptr) ||
      (nmembers != 0 && members == nullptr))
    return nullptr;

  size_t names = namelen + 1;
  for (size_t i = 0; i < nmembers; i++) {
    if (members[i].len != 0 && members[i].name == nullptr)
      return nullptr;
    names += members[i].len + 1;
  }

  size_t value_size = object_size(1 + nthunks);
  struct object *type = malloc(value_size + sizeof(struct type_desc) +
                               nmembers * sizeof(*members) + names);
  if (type == nullptr)
    return nullptr;

  struct type_desc *desc = (struct type_desc *)((char *)type + value_size);
  object_init(type, TAG_TYPE, 1 + nthunks);
  type->fields[0] = val_from_ptr(desc);
  for (size_t i = 0; i < nthunks; i++)
    type->fields[1 + i] = val_from_closure(thunks[i]);

  desc->nfields = nfields;
  desc->nmethods = nmethods;
  desc->nfunctions = nfunctions;
  char *text = (char *)&desc->members[nmembers];
  desc->name = text;
  desc->namelen = namelen;
  if (namelen != 0)
    memcpy(text, name, namelen);
  text[namelen] = '\0';
  text += namelen + 1;
  for (size_t i = 0; i < nmembers; i++) {
    desc->members[i] = members[i];
    desc->members[i].name = text;
    if (members[i].len != 0)
      memcpy(text, members[i].name, members[i].len);
    text[members[i].len] = '\0';
    text += members[i].len + 1;
  }
  return type;
}

void vm_type_free(struct object *type) { free(type); }

struct opaque *vm_opaque_alloc(struct fiber_segment *fiber, val_t *bp,
                               size_t n, finalize_fn *finalize) {
  size_t size = opaque_size(n, finalize);
  gc_poll(fiber, bp, size);
  struct opaque *o = alloc_object(size, fiber, bp);
  if (o == nullptr)
    return nullptr;
  opaque_init(o, n, finalize);
  gc_publish_new_object(fiber->state->heap, o);
  return o;
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
  str_init(s, len);
  if (len != 0)
    memcpy(s->bytes, data, len);
  gc_publish_new_object(heap, s);
  return s;
}

bool vm_const_from_str(const char *data, uint32_t len,
                       struct heap *restrict heap, val_t *out) {
  if (out == nullptr)
    return false;

  struct str *str = vm_alloc_str(data, len, heap);
  if (str == nullptr)
    return false;
  *out = val_from_str(str);
  return true;
}

size_t vm_object_size_for_fields(size_t nfields) {
  return object_size(nfields);
}

char *vm_format_result(val_t value) { return obj_format(value); }

void vm_result_free(char *text) { free(text); }

const char *vm_status_name(status_t status) {
  const char *name = status_str(status);
  return name ? name : "unknown";
}

status_t vm_exec_with(struct heap *heap, struct thunk *entry,
                      struct thunk **fns, struct object **types,
                      size_t numfn, size_t numtype, size_t stack_slots,
                      val_t *result, struct gc_stats *stats_out) {
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
