#include "vm.h"
#include "alloc.h"
#include "bc.h"
#include "def.h"
#include "native.h"
#include "object.h"
#include "state.h"

#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static opthread *const dispatch[];
static opthread *const dispatch_setc[];

INLINE double fast_fmod(double a, double b) {
  double q = a / b;
  return a - __builtin_floor(q) * b;
}

[[gnu::noinline]]
status_t vm_entry(struct fiber_segment *fiber) {
  struct state *state = fiber->state;
  bc_t *ip = state->entry->ops;
  val_t *bp = next_bp(fiber->stk, FRAME_HEADER_SIZE);
  frame_rv(bp) = val_from_closure(state->entry);
  frame_ra(bp) = 0;
  fiber->ctbl = state->entry->ctbl;
  struct thunk **fns = state->fns;

  [[maybe_unused]] uint8_t a3a, a3b, a3c;
  [[maybe_unused]] uint16_t a2b;
  uint64_t ft = VAL_FLOAT_TAG;

  NONTAILDISPATCH();
  return S_OK;
}

THREADED
void panic(PARAMS) {
  fprintf(stderr, "panic: %s\n", (const char *)(void *)fns);
  exit(255);
}

// Panic handlers no longer need fns as the function table, so reuse it for the
// message. Keep dispatch as the dispatch table; it is not recoverable from
// state.
THREADED
void stackoverflow(PARAMS) {
  fns = (struct thunk **)(void *)"stack overflow";
  MUSTTAIL return panic(ARGS);
}

THREADED
void unimplemented(PARAMS) {
  fns = (struct thunk **)(void *)"unimplemented";
  MUSTTAIL return panic(ARGS);
}

THREADED
void invalidlayout(PARAMS) {
  fns = (struct thunk **)(void *)"invalid layout";
  MUSTTAIL return panic(ARGS);
}

THREADED
void badop(PARAMS) {
  fns = (struct thunk **)(void *)"bad opcode";
  MUSTTAIL return panic(ARGS);
}

THREADED
void unusedexta(PARAMS) {
  fns = (struct thunk **)(void *)"unused extra arguments";
  MUSTTAIL return panic(ARGS);
}

THREADED
void outofmemory(PARAMS) {
  fns = (struct thunk **)(void *)"out of memory";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notanumber(PARAMS) {
  fns = (struct thunk **)(void *)"not a number";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notaoffset(PARAMS) {
  fns = (struct thunk **)(void *)"not a offset";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notafunction(PARAMS) {
  fns = (struct thunk **)(void *)"not a function";
  MUSTTAIL return panic(ARGS);
}

THREADED
void nomember(PARAMS) {
  fns = (struct thunk **)(void *)"no such member";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notafield(PARAMS) {
  fns = (struct thunk **)(void *)"not a field";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notaninstance(PARAMS) {
  fns = (struct thunk **)(void *)"not an instance";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notatype(PARAMS) {
  fns = (struct thunk **)(void *)"not a type";
  MUSTTAIL return panic(ARGS);
}

static char cannotview_msg[256];

THREADED
void cannotview(PARAMS) {
  fns = (struct thunk **)(void *)cannotview_msg;
  MUSTTAIL return panic(ARGS);
}

// The index of the member called `name` among `n` names, or `n`.
static uint32_t find_member_pos_by_name(const struct member_desc *names,
                                        uint32_t n, const char *name,
                                        size_t len) {
  for (uint32_t i = 0; i < n; i++) {
    if (names[i].len == len && memcmp(names[i].name, name, len) == 0)
      return i;
  }
  return n;
}

struct members {
  struct object *type;
  struct object *holder;
  const uint8_t *slots;
};

INLINE bool members_of(val_t recv, struct members *m) {
  if (unlikely(val_is_empty(recv) || !val_is_ptr(recv)))
    return false;
  struct object *obj = val_as_ptr(recv);
  switch (obj_tag_of(obj)) {
  case TAG_STRUCT:
    *m = (struct members){val_as_type(obj->fields[0]), obj, nullptr};
    return true;
  case TAG_VIEW: {
    struct view *v = (struct view *)obj;
    *m = (struct members){view_type(v), view_source(v), v->slots};
    return true;
  }
  case TAG_TYPE:
    *m = (struct members){obj, nullptr, nullptr};
    return true;
  default:
    return false;
  }
}

INLINE val_t *field_at_unchecked(const struct members *m, uint32_t i) {
  return &m->holder->fields[1 + (m->slots == nullptr ? i : m->slots[i])];
}

INLINE val_t *field_at(const struct members *m, uint32_t i) {
  if (m->holder == nullptr || i >= type_desc_of(m->type)->nfields)
    return nullptr;
  return field_at_unchecked(m, i);
}

INLINE val_t *find_member_by_name(const struct members *m, const char *name,
                                  size_t len, bool writing) {
  const struct type_desc *desc = type_desc_of(m->type);
  if (m->holder != nullptr) {
    uint32_t i =
        find_member_pos_by_name(desc->members, desc->nfields, name, len);
    if (i < desc->nfields)
      return field_at_unchecked(m, i);
  }
  if (writing)
    return nullptr;
  uint32_t n = desc->nmethods;
  if (m->holder == nullptr)
    n += desc->nfunctions;
  uint32_t i =
      find_member_pos_by_name(desc->members + desc->nfields, n, name, len);
  return i < n ? &m->type->fields[1 + i] : nullptr;
}

COLD_HELPER static val_t *find_member_by_selector(val_t recv, val_t selector) {
  struct members m;
  if (val_is_int(selector)) {
    uint32_t i = (uint32_t)val_as_i32(selector);
    if (!val_is_empty(recv) && val_is_ptr(recv) &&
        obj_tag_of(val_as_ptr(recv)) == TAG_TUPLE) {
      struct object *tuple = val_as_ptr(recv);
      return i < object_nfields(tuple) ? &tuple->fields[i] : nullptr;
    }
    return members_of(recv, &m) ? field_at(&m, i) : nullptr;
  }
  if (!members_of(recv, &m))
    return nullptr;
  const struct str *str = val_as_str(selector);
  return find_member_by_name(&m, str->bytes, str_len(str), false);
}

COLD_HELPER static val_t *find_field_by_selector(val_t recv, val_t selector,
                                                 struct object **holder) {
  struct members m;
  if (!members_of(recv, &m))
    return nullptr;
  *holder = m.holder;
  if (val_is_int(selector))
    return field_at(&m, (uint32_t)val_as_i32(selector));
  const struct str *str = val_as_str(selector);
  return find_member_by_name(&m, str->bytes, str_len(str), true);
}

COLD_HELPER static val_t *find_field_slow(struct fiber_segment *fiber,
                                                  val_t recv, uint32_t tid,
                                                  uint32_t k,
                                                  struct object **holder) {
  struct members m;
  if (!members_of(recv, &m))
    return nullptr;
  if (holder != nullptr)
    *holder = m.holder;
  const struct type_desc *desc = type_desc_of(fiber->types[tid]);
  if (unlikely(k >= desc->nfields))
    return nullptr;
  const struct member_desc *name = &desc->members[k];
  return find_member_by_name(&m, name->name, name->len, holder != nullptr);
}

[[gnu::cold]] COLD_HELPER static val_t *
find_field_slow_forward(struct fiber_segment *fiber, val_t recv,
                                uint32_t tid, uint32_t k) {
  return find_field_slow(fiber, recv, tid, k, nullptr);
}

INLINE val_t *find_field_by_type(struct fiber_segment *fiber, val_t recv,
                                 uint32_t tid, uint32_t k,
                                 struct object **holder) {
  val_t type = val_from_type(fiber->types[tid]);
  if (likely(!val_is_empty(recv) && val_is_ptr(recv))) {
    struct object *obj = val_as_ptr(recv);
    if (obj_tag_of(obj) == TAG_STRUCT && obj->fields[0] == type) {
      if (holder != nullptr)
        *holder = obj;
      return &obj->fields[1 + k];
    }
    if (obj_tag_of(obj) == TAG_VIEW && obj->fields[0] == type) {
      struct view *v = (struct view *)obj;
      struct object *source = view_source(v);
      if (holder != nullptr)
        *holder = source;
      return &source->fields[1 + v->slots[k]];
    }
  }
  if (holder == nullptr)
    return find_field_slow_forward(fiber, recv, tid, k);
  return find_field_slow(fiber, recv, tid, k, holder);
}

INLINE bool cmp_notf(val_t lhs, uint16_t flag) {
  return flag == UINT16_MAX ? val_is_falsy(lhs) : !val_is_falsy(lhs);
}

#define CMP_DI(op_, lhs_, imm_, badret_, on_true_, on_false_)                  \
  do {                                                                         \
    val_t _lhs = (lhs_);                                                       \
    int32_t _imm = (imm_);                                                     \
    if (val_is_int_macro(_lhs, ft)) {                                          \
      if (val_as_i32_macro(_lhs, ft) op_ _imm) {                               \
        on_true_;                                                              \
      } else {                                                                 \
        on_false_;                                                             \
      }                                                                        \
    } else if (val_is_number_macro(_lhs, ft)) {                                \
      if (val_as_f64_macro(_lhs, ft) op_(double) _imm) {                       \
        on_true_;                                                              \
      } else {                                                                 \
        on_false_;                                                             \
      }                                                                        \
    } else {                                                                   \
      MUSTTAIL return badret_;                                                 \
    }                                                                          \
  } while (0)

#define CMP_NUM(op_, lhs_, rhs_, badret_, on_true_, on_false_)                 \
  do {                                                                         \
    val_t _lhs = (lhs_);                                                       \
    val_t _rhs = (rhs_);                                                       \
    if (val_is_int_macro(_lhs, ft)) {                                          \
      if (val_is_int_macro(_rhs, ft)) {                                        \
        if (val_as_i32_macro(_lhs, ft) op_ val_as_i32_macro(_rhs, ft)) {       \
          on_true_;                                                            \
        } else {                                                               \
          on_false_;                                                           \
        }                                                                      \
      } else                                                                   \
        MUSTTAIL return badret_;                                               \
    } else if (val_is_number_macro(_lhs, ft)) {                                \
      if (val_is_float_macro(_rhs, ft)) {                                      \
        if (val_as_f64_macro(_lhs, ft) op_ val_as_f64_macro(_rhs, ft)) {       \
          on_true_;                                                            \
        } else {                                                               \
          on_false_;                                                           \
        }                                                                      \
      } else {                                                                 \
        MUSTTAIL return badret_;                                               \
      }                                                                        \
    } else {                                                                   \
      MUSTTAIL return badret_;                                                 \
    }                                                                          \
  } while (0)

OP_DEFINITION(Halt) { return; }

OP_DEFINITION(Nop) { DISPATCH(); }

OP_DEFINITION(Exta) { MUSTTAIL return unusedexta(ARGS); }

OP_DEFINITION(LoadI) {
  ssz_t dst = ARG2A;

  bp[dst] = val_from_i32_macro(sign_extend(ARG2B, 16, 32), ft);

  DISPATCH();
}

OP_DEFINITION(LoaduI) {
  ssz_t dst = ARG2A;

  bp[dst] = val_from_i32_macro(zero_extend(ARG2B, 16, 32), ft);

  DISPATCH();
}

OP_DEFINITION(LoadR) {
  ssz_t dst = ARG2A;
  val_t raw = ARG2B;

  if (unlikely(raw != VAL_EMPTY && raw != VAL_NULL && raw != VAL_FALSE &&
               raw != VAL_TRUE)) {
    MUSTTAIL return badop(ARGS);
  }

  bp[dst] = raw;
  DISPATCH();
}

OP_DEFINITION(LoadC) {
  ssz_t dst = ARG2A;
  val_t cidx = ARG2B;

  bp[dst] = fiber->ctbl[cidx];

  DISPATCH();
}

OP_DEFINITION(LoadType) {
  struct state *state = fiber->state;
  ssz_t dst = ARG2A;
  ssz_t tidx = ARG2B;

  if (unlikely(tidx >= state->numtype)) {
    MUSTTAIL return badop(ARGS);
  }

  bp[dst] = val_from_type(state->types[tidx]);

  DISPATCH();
}

OP_DEFINITION(LoadFree) {
  ssz_t dst = ARG2A;
  val_t fidx = ARG2B;
  struct thunk *thunk = val_as_closure(frame_rv(bp));

  if (fidx == 0) {
    bp[dst] = frame_rv(bp);
  } else {
    if (unlikely(fidx > thunk->nfree)) {
      MUSTTAIL return badop(ARGS);
    }
    bp[dst] = thunk->freevars[fidx - 1];
  }

  DISPATCH();
}

OP_DEFINITION(LoadMem) {
  ssz_t dst = ARG3A;
  ssz_t recv = ARG3B;
  val_t *slot = find_member_by_selector(bp[recv], fiber->ctbl[ARG3C]);

  if (unlikely(slot == nullptr)) {
    MUSTTAIL return nomember(ARGS);
  }

  bp[dst] = *slot;

  DISPATCH();
}

OP_DEFINITION(SetMem) {
  ssz_t src = ARG3A;
  ssz_t recv = ARG3B;
  struct object *holder;
  val_t *slot = find_field_by_selector(bp[recv], fiber->ctbl[ARG3C], &holder);

  if (unlikely(slot == nullptr)) {
    if (find_member_by_selector(bp[recv], fiber->ctbl[ARG3C]) == nullptr) {
      MUSTTAIL return nomember(ARGS);
    }
    MUSTTAIL return notafield(ARGS);
  }

  gc_store_field(fiber->state->heap, holder, slot, bp[src]);

  DISPATCH();
}

THREADED void vm_op_load_by_type_fallback(PARAMS) {
  ssz_t dst = ARG3A;
  ssz_t recv = ARG3B;
  ssz_t k = ARG3C;
  uint32_t tid = g1A(ip[-1]);
  val_t *slot = find_field_by_type(fiber, bp[recv], tid, k, nullptr);

  if (unlikely(slot == nullptr)) {
    MUSTTAIL return nomember(ARGS);
  }

  bp[dst] = *slot;

  DISPATCH();
}

THREADED void vm_op_set_by_type_fallback(PARAMS) {
  ssz_t src = ARG3A;
  ssz_t recv = ARG3B;
  ssz_t k = ARG3C;
  uint32_t tid = g1A(ip[-1]);
  struct object *holder;
  val_t *slot = find_field_by_type(fiber, bp[recv], tid, k, &holder);

  if (unlikely(slot == nullptr)) {
    if (find_field_by_type(fiber, bp[recv], tid, k, nullptr) == nullptr) {
      MUSTTAIL return nomember(ARGS);
    }
    MUSTTAIL return notafield(ARGS);
  }

  gc_store_field(fiber->state->heap, holder, slot, bp[src]);

  DISPATCH();
}

OP_DEFINITION(LoadSlot) {
  ssz_t dst = ARG3A;
  ssz_t recv = ARG3B;
  ssz_t k = ARG3C;
  NEXT_INSN(ext);
  val_t type = val_from_type(fiber->types[EXTRA_ARGU(ext)]);
  val_t self = bp[recv];

  if (likely(val_is_object_macro(self, ft))) {
    struct object *obj = val_as_object(self);
    if (likely(obj_tag_of(obj) == TAG_STRUCT && obj->fields[0] == type)) {
      bp[dst] = obj->fields[1 + k];
      DISPATCH();
    }
  }

  MUSTTAIL return vm_op_load_by_type_fallback(ARGS);
}

OP_DEFINITION(SetSlot) {
  ssz_t src = ARG3A;
  ssz_t recv = ARG3B;
  ssz_t k = ARG3C;
  NEXT_INSN(ext);
  val_t type = val_from_type(fiber->types[EXTRA_ARGU(ext)]);
  val_t self = bp[recv];

  if (likely(val_is_object_macro(self, ft))) {
    struct object *obj = val_as_object(self);
    if (likely(obj_tag_of(obj) == TAG_STRUCT && obj->fields[0] == type)) {
      gc_store_field(fiber->state->heap, obj, &obj->fields[1 + k], bp[src]);
      DISPATCH();
    }
  }

  MUSTTAIL return vm_op_set_by_type_fallback(ARGS);
}

OP_DEFINITION(LoadInd) {
  ssz_t dst = ARG3A;
  ssz_t recv = ARG3B;
  ssz_t k = ARG3C;
  NEXT_INSN(ext);
  val_t type = val_from_type(fiber->types[EXTRA_ARGU(ext)]);
  val_t self = bp[recv];

  if (likely(val_is_object_macro(self, ft))) {
    struct object *obj = val_as_object(self);
    if (likely(obj_tag_of(obj) == TAG_VIEW && obj->fields[0] == type)) {
      struct view *v = (struct view *)obj;
      bp[dst] = view_source(v)->fields[1 + v->slots[k]];
      DISPATCH();
    }
  }

  MUSTTAIL return vm_op_load_by_type_fallback(ARGS);
}

OP_DEFINITION(SetInd) {
  ssz_t src = ARG3A;
  ssz_t recv = ARG3B;
  ssz_t k = ARG3C;
  NEXT_INSN(ext);
  val_t type = val_from_type(fiber->types[EXTRA_ARGU(ext)]);
  val_t self = bp[recv];

  if (likely(val_is_object_macro(self, ft))) {
    struct object *obj = val_as_object(self);
    if (likely(obj_tag_of(obj) == TAG_VIEW && obj->fields[0] == type)) {
      struct view *v = (struct view *)obj;
      struct object *source = view_source(v);
      gc_store_field(fiber->state->heap, source,
                     &source->fields[1 + v->slots[k]], bp[src]);
      DISPATCH();
    }
  }

  MUSTTAIL return vm_op_set_by_type_fallback(ARGS);
}

COLD_HELPER static const uint8_t *
view_template(struct type_desc *source, const struct type_desc *target,
              const struct member_desc **missing) {
  *missing = nullptr;
  for (struct view_tmpl *t = source->views; t != nullptr; t = t->next) {
    if (t->target == target)
      return t->slots;
  }
  struct view_tmpl *t = malloc(sizeof *t + target->nfields);
  if (t == nullptr)
    return nullptr;
  for (uint32_t k = 0; k < target->nfields; k++) {
    const struct member_desc *name = &target->members[k];
    uint32_t i = find_member_pos_by_name(source->members, source->nfields,
                                         name->name, name->len);
    if (i == source->nfields) {
      free(t);
      *missing = name;
      return nullptr;
    }
    t->slots[k] = (uint8_t)i;
  }
  t->target = target;
  t->next = source->views;
  source->views = t;
  return t->slots;
}

COLD_HELPER static void cannotview_format(const struct type_desc *source,
                                          const struct type_desc *target,
                                          const struct member_desc *missing) {
  snprintf(cannotview_msg, sizeof cannotview_msg,
           "cannot view %.*s as %.*s: no field %.*s", (int)source->namelen,
           source->name, (int)target->namelen, target->name,
           (int)missing->len, missing->name);
}

OP_DEFINITION(View) {
  struct state *state = fiber->state;
  ssz_t dst = ARG3A;
  ssz_t src = ARG3B;
  ssz_t ty = ARG3C;
  val_t tv = bp[ty];
  val_t sv = bp[src];

  if (unlikely(!val_is_type_macro(tv, ft))) {
    MUSTTAIL return notatype(ARGS);
  }
  if (unlikely(val_is_empty(sv) || !val_is_ptr_macro(sv, ft))) {
    MUSTTAIL return notaninstance(ARGS);
  }
  struct object *source = val_as_ptr(sv);
  if (obj_tag_of(source) == TAG_VIEW)
    source = view_source((struct view *)source);
  if (unlikely(obj_tag_of(source) != TAG_STRUCT)) {
    MUSTTAIL return notaninstance(ARGS);
  }

  struct object *type = val_as_type(tv);
  if (val_as_type(source->fields[0]) == type) {
    bp[dst] = val_from_ptr(source);
    DISPATCH();
  }

  struct type_desc *sdesc = type_desc_of(val_as_type(source->fields[0]));
  const struct type_desc *desc = type_desc_of(type);
  const struct member_desc *missing;
  const uint8_t *slots = view_template(sdesc, desc, &missing);
  if (unlikely(slots == nullptr)) {
    if (missing == nullptr) {
      MUSTTAIL return outofmemory(ARGS);
    }
    cannotview_format(sdesc, desc, missing);
    MUSTTAIL return cannotview(ARGS);
  }

  size_t size = view_size(desc->nfields);
  struct view *v = alloc_object(size, fiber, bp);
  if (unlikely(v == nullptr)) {
    MUSTTAIL return outofmemory(ARGS);
  }
  view_init(v, type, source, slots);

  gc_publish_new_object(state->heap, v);
  bp[dst] = val_from_ptr(v);
  gc_poll(fiber, bp, size);

  DISPATCH();
}

OP_DEFINITION(Move) {
  ssz_t dst = ARG2A;
  ssz_t src = ARG2B;

  bp[dst] = bp[src];

  DISPATCH();
}

OP_DEFINITION(Apply) {
  ssz_t ithunk = ARG2A;
  val_t fv = bp[ithunk];

  if (unlikely(!val_is_closure_macro(fv, ft))) {
    MUSTTAIL return notafunction(ARGS);
  }

  struct thunk *thunk = val_as_closure(fv);

  bc_t *oldip = ip;
  ip = thunk->ops;

  gc_poll(fiber, bp, 256);

  bp = next_bp(bp, ithunk);
  if (unlikely(bp + thunk->nregs > fiber->stklimit.active)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_rv(bp) = fv;
  frame_ra(bp) = ptr2val(oldip);
  fiber->ctbl = thunk->ctbl;

  DISPATCH();
}

OP_DEFINITION(Invoke) {
  ssz_t dst = ARG3A;
  ssz_t base = ARG3B;

  if (unlikely(val_is_type_macro(bp[base], ft))) {
    MUSTTAIL return notaninstance(ARGS);
  }
  val_t *slot = find_member_by_selector(bp[base], fiber->ctbl[ARG3C]);

  if (unlikely(slot == nullptr)) {
    MUSTTAIL return nomember(ARGS);
  }

  // The call region starts at dst exactly like an ordinary application, so
  // the member closure only has to be moved into place.
  bp[dst] = *slot;
  MUSTTAIL return vm_op_Apply(ARGS);
}

OP_DEFINITION(Call) {
  ssz_t dst = ARG2A;
  ssz_t fx = ARG2B;

  struct thunk *thunk = fns[fx];

  bc_t *oldip = ip;
  ip = thunk->ops;

  gc_poll(fiber, bp, 256);

  bp = next_bp(bp, dst);
  if (unlikely(bp + thunk->nregs > fiber->stklimit.active)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_rv(bp) = val_from_closure(thunk);
  frame_ra(bp) = ptr2val(oldip);
  fiber->ctbl = thunk->ctbl;

  DISPATCH();
}

OP_DEFINITION(Native) {
  ssz_t idx = ARG2B;
  val_t rv;

  if (unlikely(idx >= nnatives)) {
    MUSTTAIL return badop(ARGS);
  }
  const char *err = natives[idx].fn(fiber, bp, &rv);
  if (unlikely(err != nullptr)) {
    fns = (struct thunk **)(void *)err;
    MUSTTAIL return panic(ARGS);
  }

  frame_rv(bp) = rv;

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;
  fiber->ctbl = val_as_closure(frame_rv(bp))->ctbl;

  DISPATCH();
}

OP_DEFINITION(Retu) {
  frame_rv(bp) = 0;

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;
  fiber->ctbl = val_as_closure(frame_rv(bp))->ctbl;

  DISPATCH();
}

OP_DEFINITION(Ret) {
  ssz_t rv = ARG3A;

  frame_rv(bp) = bp[rv];

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;
  fiber->ctbl = val_as_closure(frame_rv(bp))->ctbl;

  DISPATCH();
}

OP_DEFINITION(Retn) {
  ssz_t rv = ARG2A;
  ssz_t nargs = ARG2B;

  bc_t *ra = val2ptr(frame_ra(bp));

  val_t *rvs = &frame_rv(bp);

  for (ssz_t i = 0; i < nargs; i++)
    rvs[i] = bp[rv + i];

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;
  fiber->ctbl = val_as_closure(frame_rv(bp))->ctbl;

  DISPATCH();
}

COLD_HELPER static struct thunk *
thunk_alloc_instance(struct fiber_segment *restrict fiber,
                     struct thunk *template, val_t *restrict bp) {
  size_t size = thunk_instance_size(template->nfree);
  struct thunk *thunk = alloc_object(size, fiber, bp);
  if (thunk == nullptr)
    return nullptr;
  thunk_instance_init(thunk, template);
  return thunk;
}

COLD_HELPER static bool capture_loc_resolve(val_t loc, val_t *restrict bp,
                                            val_t *restrict out) {
  struct thunk *current = val_as_closure(frame_rv(bp));
  uint16_t kind = capture_loc_kind(loc);
  uint16_t index = capture_loc_index(loc);

  switch (kind) {
  case CAPTURE_LOC_SLOT:
    if (unlikely(index >= current->nregs))
      return false;
    *out = bp[index];
    return true;
  case CAPTURE_LOC_FREEVAR:
    if (index == 0) {
      *out = frame_rv(bp);
      return true;
    }
    if (unlikely(index > current->nfree))
      return false;
    *out = current->freevars[index - 1];
    return true;
  default:
    return false;
  }
}

OP_DEFINITION(Clos) {
  struct state *state = fiber->state;
  ssz_t dst = ARG2A;
  ssz_t fx = ARG2B;
  struct thunk *template = fns[fx];

  struct thunk *thunk = thunk_alloc_instance(fiber, template, bp);
  if (unlikely(thunk == nullptr)) {
    MUSTTAIL return outofmemory(ARGS);
  }
  for (size_t i = 0; i < template->nfree; i++) {
    val_t value;
    if (unlikely(!capture_loc_resolve(template->freevars[i], bp, &value))) {
      MUSTTAIL return badop(ARGS);
    }
    thunk->freevars[i] = value;
  }

  gc_publish_new_object(state->heap, thunk);
  bp[dst] = val_from_closure(thunk);
  gc_poll(fiber, bp, obj_size(thunk));
  DISPATCH();
}

OP_DEFINITION(WObj) {
  struct state *state = fiber->state;
  ssz_t fld = ARG3A;
  ssz_t tag = ARG3B;
  ssz_t len = ARG3C;

  // Type values come from the image, see vm_type_alloc.
  if (unlikely(!obj_is_words((enum tag)tag) || tag == TAG_TYPE)) {
    MUSTTAIL return invalidlayout(ARGS);
  }

  // A struct instance wraps its type value and field values.
  if (tag == TAG_STRUCT) {
    if (unlikely(!val_is_type_macro(bp[fld], ft))) {
      MUSTTAIL return invalidlayout(ARGS);
    }
    const struct type_desc *desc = type_desc_of(val_as_type(bp[fld]));
    if (unlikely(len != 1 + desc->nfields)) {
      MUSTTAIL return invalidlayout(ARGS);
    }
  }

  struct object *obj = alloc_object(object_size(len), fiber, bp);
  if (unlikely(obj == nullptr)) {
    MUSTTAIL return outofmemory(ARGS);
  }
  object_init(obj, (enum tag)tag, len);
  for (ssz_t i = 0; i < len; i++)
    obj->fields[i] = bp[fld + i];

  gc_publish_new_object(state->heap, obj);
  bp[fld] = val_from_ptr(obj);
  gc_poll(fiber, bp, object_size(len));

  DISPATCH();
}

OP_DEFINITION(Jmp) {
  joff_t target = JUMP_OFFSET;

  ip = add2ip(ip, target);

  DISPATCH();
}

OP_DEFINITION(Goto) {
  val_t src = ARG2A;
  if (val_is_int_macro(bp[src], ft)) {
    ip = add2ip(ip, val_as_i32_macro(bp[src], ft));
  } else
    MUSTTAIL return notaoffset(ARGS);

  DISPATCH();
}

COLD_HELPER static bool val_to_f64_pair(val_t lv, val_t rv, uint64_t ft,
                                        double *lhs, double *rhs) {
  if (val_is_int_macro(lv, ft))
    *lhs = (double)val_as_i32_macro(lv, ft);
  else if (val_is_number_macro(lv, ft))
    *lhs = val_as_f64_macro(lv, ft);
  else
    return false;
  if (val_is_int_macro(rv, ft))
    *rhs = (double)val_as_i32_macro(rv, ft);
  else if (val_is_number_macro(rv, ft))
    *rhs = val_as_f64_macro(rv, ft);
  else
    return false;
  return true;
}

COLD_HELPER static bool val_eq(val_t lhs, val_t rhs, uint64_t ft) {
  if (lhs == rhs)
    return true;
  double l, r;
  if (val_to_f64_pair(lhs, rhs, ft, &l, &r))
    return l == r;
  if (val_is_str_macro(lhs, ft) && val_is_str_macro(rhs, ft)) {
    struct str *ls = val_as_str(lhs), *rs = val_as_str(rhs);
    size_t ll = str_len(ls);
    return ll == str_len(rs) && memcmp(ls->bytes, rs->bytes, ll) == 0;
  }
  return false;
}

COLD_HELPER static bool cmp_f64(op_t op, double lhs, double rhs) {
  switch (op) {
  case CmpEqDC:
  case CmpEqDD:
    return lhs == rhs;
  case CmpNeDC:
  case CmpNeDD:
    return lhs != rhs;
  case CmpLtDC:
  case CmpLtDD:
    return lhs < rhs;
  case CmpLeDC:
  case CmpLeDD:
    return lhs <= rhs;
  case CmpGtDC:
  case CmpGtDD:
    return lhs > rhs;
  case CmpGeDC:
  case CmpGeDD:
    return lhs >= rhs;
  default:
    __builtin_unreachable();
  }
}

INLINE bool cmp_is_eq(op_t op) { return op == CmpEqDC || op == CmpEqDD; }

INLINE bool cmp_is_ne(op_t op) { return op == CmpNeDC || op == CmpNeDD; }

THREADED void vm_op_arith_dc_fallback(PARAMS) {
  val_t lv = bp[ARG3Y];
  double lhs;
  if (val_is_int_macro(lv, ft))
    lhs = (double)val_as_i32_macro(lv, ft);
  else if (val_is_number_macro(lv, ft))
    lhs = val_as_f64_macro(lv, ft);
  else
    MUSTTAIL return notanumber(ARGS);
  val_t rv = fiber->ctbl[ARG3Z];
  double rhs;
  if (val_is_int_macro(rv, ft))
    rhs = (double)val_as_i32_macro(rv, ft);
  else if (val_is_number_macro(rv, ft))
    rhs = val_as_f64_macro(rv, ft);
  else
    MUSTTAIL return notanumber(ARGS);
  double res;
  switch (gOP(ip[-1])) {
  case AddDC:
    res = lhs + rhs;
    break;
  case SubDC:
    res = lhs - rhs;
    break;
  case MulDC:
    res = lhs * rhs;
    break;
  case DivDC:
    res = lhs / rhs;
    break;
  case RemDC:
    res = fast_fmod(lhs, rhs);
    break;
  default:
    MUSTTAIL return notanumber(ARGS);
  }
  bp[ARG3X] = val_from_f64_macro(res, ft);
  DISPATCH();
}

THREADED void vm_op_arith_dd_fallback(PARAMS) {
  val_t lv = bp[ARG3Y];
  double lhs;
  if (val_is_int_macro(lv, ft))
    lhs = (double)val_as_i32_macro(lv, ft);
  else if (val_is_number_macro(lv, ft))
    lhs = val_as_f64_macro(lv, ft);
  else
    MUSTTAIL return notanumber(ARGS);

  op_t op = gOP(ip[-1]);
  if (op == NegD) {
    bp[ARG3X] = val_from_f64_macro(-lhs, ft);
    DISPATCH();
  }

  val_t rv = bp[ARG3Z];
  double rhs;
  if (val_is_int_macro(rv, ft))
    rhs = (double)val_as_i32_macro(rv, ft);
  else if (val_is_number_macro(rv, ft))
    rhs = val_as_f64_macro(rv, ft);
  else
    MUSTTAIL return notanumber(ARGS);

  double res;
  switch (op) {
  case AddDD:
    res = lhs + rhs;
    break;
  case SubDD:
    res = lhs - rhs;
    break;
  case MulDD:
    res = lhs * rhs;
    break;
  case DivDD:
    res = lhs / rhs;
    break;
  case RemDD:
    res = fast_fmod(lhs, rhs);
    break;
  default:
    MUSTTAIL return notanumber(ARGS);
  }
  bp[ARG3X] = val_from_f64_macro(res, ft);
  DISPATCH();
}

#define DEFINE_OP_ARITH_DC(name_, op_, overflow_)                              \
  OP_DEFINITION(name_) {                                                       \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    val_t v1 = bp[o1];                                                         \
    val_t v2 = fiber->ctbl[ARG3Z];                                             \
    if (val_is_int_macro(v1, ft)) {                                            \
      if (val_is_int_macro(v2, ft)) {                                          \
        int32_t lhs = val_as_i32_macro(v1, ft);                                \
        int32_t rhs = val_as_i32_macro(v2, ft);                                \
        int32_t out;                                                           \
        if (!(overflow_))                                                      \
          bp[dst] = val_from_i32_macro(out, ft);                               \
        else                                                                   \
          MUSTTAIL return vm_op_arith_dc_fallback(ARGS);                       \
      } else                                                                   \
        MUSTTAIL return vm_op_arith_dc_fallback(ARGS);                         \
    } else if (val_is_number_macro(v1, ft)) {                                  \
      if (val_is_float_macro(v2, ft)) {                                        \
        bp[dst] = val_from_f64_macro(                                          \
            val_as_f64_macro(v1, ft) op_ val_as_f64_macro(v2, ft), ft);        \
      } else {                                                                 \
        MUSTTAIL return vm_op_arith_dc_fallback(ARGS);                         \
      }                                                                        \
    } else {                                                                   \
      MUSTTAIL return vm_op_arith_dc_fallback(ARGS);                           \
    }                                                                          \
    DISPATCH();                                                                \
  }

DEFINE_OP_ARITH_DC(AddDC, +, __builtin_add_overflow(lhs, rhs, &out))
DEFINE_OP_ARITH_DC(SubDC, -, __builtin_sub_overflow(lhs, rhs, &out))
DEFINE_OP_ARITH_DC(MulDC, *, __builtin_mul_overflow(lhs, rhs, &out))

OP_DEFINITION(DivDC) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  val_t v1 = bp[o1];
  val_t v2 = fiber->ctbl[ARG3Z];
  if (val_is_int_macro(v1, ft)) {
    if (val_is_int_macro(v2, ft)) {
      int32_t lhs = val_as_i32_macro(v1, ft);
      int32_t rhs = val_as_i32_macro(v2, ft);
      if (rhs != 0 && !(lhs == INT32_MIN && rhs == -1)) {
        int32_t q = lhs / rhs;
        int32_t r = lhs % rhs;
        if (r != 0 && ((lhs ^ rhs) < 0))
          q -= 1;
        bp[dst] = val_from_i32_macro(q, ft);
      } else {
        MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
      }
    } else {
      MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
    }
  } else if (val_is_number_macro(v1, ft)) {
    if (val_is_float_macro(v2, ft)) {
      bp[dst] = val_from_f64_macro(
          val_as_f64_macro(v1, ft) / val_as_f64_macro(v2, ft), ft);
    } else {
      MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
    }
  } else {
    MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(RemDC) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  val_t v1 = bp[o1];
  val_t v2 = fiber->ctbl[ARG3Z];
  if (val_is_int_macro(v1, ft)) {
    if (val_is_int_macro(v2, ft)) {
      int32_t lhs = val_as_i32_macro(v1, ft);
      int32_t rhs = val_as_i32_macro(v2, ft);
      if (rhs != 0) {
        int32_t r = lhs % rhs;
        if (r != 0 && ((lhs ^ rhs) < 0))
          r += rhs;
        bp[dst] = val_from_i32_macro(r, ft);
      } else {
        MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
      }
    } else {
      MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
    }
  } else if (val_is_number_macro(v1, ft)) {
    if (val_is_float_macro(v2, ft)) {
      bp[dst] = val_from_f64_macro(
          fast_fmod(val_as_f64_macro(v1, ft), val_as_f64_macro(v2, ft)), ft);
    } else {
      MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
    }
  } else {
    MUSTTAIL return vm_op_arith_dc_fallback(ARGS);
  }
  DISPATCH();
}

#define DEFINE_OP_ARITH_DD(name_, op_, overflow_)                              \
  OP_DEFINITION(name_) {                                                       \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t o2 = ARG3Z;                                                          \
    val_t v1 = bp[o1];                                                         \
    val_t v2 = bp[o2];                                                         \
    if (val_is_int_macro(v1, ft)) {                                            \
      if (val_is_int_macro(v2, ft)) {                                          \
        int32_t lhs = val_as_i32_macro(v1, ft);                                \
        int32_t rhs = val_as_i32_macro(v2, ft);                                \
        int32_t out;                                                           \
        if (!(overflow_))                                                      \
          bp[dst] = val_from_i32_macro(out, ft);                               \
        else                                                                   \
          MUSTTAIL return vm_op_arith_dd_fallback(ARGS);                       \
      } else                                                                   \
        MUSTTAIL return vm_op_arith_dd_fallback(ARGS);                         \
    } else if (val_is_number_macro(v1, ft)) {                                  \
      if (val_is_float_macro(v2, ft)) {                                        \
        bp[dst] = val_from_f64_macro(                                          \
            val_as_f64_macro(v1, ft) op_ val_as_f64_macro(v2, ft), ft);        \
      } else {                                                                 \
        MUSTTAIL return vm_op_arith_dd_fallback(ARGS);                         \
      }                                                                        \
    } else {                                                                   \
      MUSTTAIL return vm_op_arith_dd_fallback(ARGS);                           \
    }                                                                          \
    DISPATCH();                                                                \
  }

DEFINE_OP_ARITH_DD(AddDD, +, __builtin_add_overflow(lhs, rhs, &out))
DEFINE_OP_ARITH_DD(SubDD, -, __builtin_sub_overflow(lhs, rhs, &out))
DEFINE_OP_ARITH_DD(MulDD, *, __builtin_mul_overflow(lhs, rhs, &out))

OP_DEFINITION(DivDD) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  ssz_t o2 = ARG3Z;
  val_t v1 = bp[o1];
  val_t v2 = bp[o2];
  if (val_is_int_macro(v1, ft)) {
    if (val_is_int_macro(v2, ft)) {
      int32_t lhs = val_as_i32_macro(v1, ft);
      int32_t rhs = val_as_i32_macro(v2, ft);
      if (rhs != 0 && !(lhs == INT32_MIN && rhs == -1)) {
        int32_t q = lhs / rhs;
        int32_t r = lhs % rhs;
        if (r != 0 && ((lhs ^ rhs) < 0))
          q -= 1;
        bp[dst] = val_from_i32_macro(q, ft);
      } else {
        MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
      }
    } else {
      MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
    }
  } else if (val_is_number_macro(v1, ft)) {
    if (val_is_float_macro(v2, ft)) {
      bp[dst] = val_from_f64_macro(
          val_as_f64_macro(v1, ft) / val_as_f64_macro(v2, ft), ft);
    } else {
      MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
    }
  } else {
    MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(RemDD) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  ssz_t o2 = ARG3Z;
  val_t v1 = bp[o1];
  val_t v2 = bp[o2];
  if (val_is_int_macro(v1, ft)) {
    if (val_is_int_macro(v2, ft)) {
      int32_t lhs = val_as_i32_macro(v1, ft);
      int32_t rhs = val_as_i32_macro(v2, ft);
      if (rhs != 0) {
        int32_t r = lhs % rhs;
        if (r != 0 && ((lhs ^ rhs) < 0))
          r += rhs;
        bp[dst] = val_from_i32_macro(r, ft);
      } else {
        MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
      }
    } else {
      MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
    }
  } else if (val_is_number_macro(v1, ft)) {
    if (val_is_float_macro(v2, ft)) {
      bp[dst] = val_from_f64_macro(
          fast_fmod(val_as_f64_macro(v1, ft), val_as_f64_macro(v2, ft)), ft);
    } else {
      MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
    }
  } else {
    MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(NegD) {
  ssz_t dst = ARG3X;
  ssz_t src = ARG3Y;
  val_t v = bp[src];
  if (val_is_int_macro(v, ft)) {
    int32_t value = val_as_i32_macro(v, ft);
    if (likely(value != INT32_MIN))
      bp[dst] = val_from_i32_macro(-value, ft);
    else
      bp[dst] = val_from_f64_macro((double)-(int64_t)INT32_MIN, ft);
  } else if (val_is_number_macro(v, ft)) {
    bp[dst] = val_from_f64_macro(-val_as_f64_macro(v, ft), ft);
  } else {
    MUSTTAIL return vm_op_arith_dd_fallback(ARGS);
  }
  DISPATCH();
}

THREADED void vm_op_compare_di_fallback(PARAMS) {
  MUSTTAIL return notanumber(ARGS);
}

THREADED void vm_op_compare_dc_fallback(PARAMS) {
  ip--;
  val_t lv = bp[ARG2A], rv = fiber->ctbl[ARG2B];
  op_t op = gOP(ip[-1]);
  if (cmp_is_eq(op)) {
    if (val_eq(lv, rv, ft))
      ip++;
    DISPATCH();
  }
  if (cmp_is_ne(op)) {
    if (!val_eq(lv, rv, ft))
      ip++;
    DISPATCH();
  }
  double lhs, rhs;
  if (!val_to_f64_pair(lv, rv, ft, &lhs, &rhs))
    MUSTTAIL return notanumber(ARGS);
  if (cmp_f64(op, lhs, rhs))
    ip++;
  DISPATCH();
}

THREADED void vm_op_compare_dd_fallback(PARAMS) {
  ip--;
  val_t lv = bp[ARG2A], rv = bp[ARG2B];
  op_t op = gOP(ip[-1]);
  if (cmp_is_eq(op)) {
    if (val_eq(lv, rv, ft))
      ip++;
    DISPATCH();
  }
  if (cmp_is_ne(op)) {
    if (!val_eq(lv, rv, ft))
      ip++;
    DISPATCH();
  }
  double lhs, rhs;
  if (!val_to_f64_pair(lv, rv, ft, &lhs, &rhs))
    MUSTTAIL return notanumber(ARGS);
  if (cmp_f64(op, lhs, rhs))
    ip++;
  DISPATCH();
}

#define SC_STORE(dst_, inv_, r_) bp[(dst_)] = val_from_bool(!!(inv_) ^ !!(r_))

#define SC_ON_TRUE                                                             \
  do {                                                                         \
    SC_STORE(dst, invert, true);                                               \
    ip += fiber->sc_jump;                                                      \
  } while (0)
#define SC_ON_FALSE SC_STORE(dst, invert, false)

THREADED void vm_op_compare_setc_fallback(PARAMS) {
  ssz_t dst = ARG2A;
  bool invert = ARG2B != 0;
  bc_t ci = ip[-1];
  op_t op = gOP(ci);
  val_t lv = bp[g3A(ci)];
  val_t rv = (op >= CmpEqDD) ? bp[g2B(ci)] : fiber->ctbl[g2B(ci)];
  bool r;
  if (cmp_is_eq(op)) {
    r = val_eq(lv, rv, ft);
  } else if (cmp_is_ne(op)) {
    r = !val_eq(lv, rv, ft);
  } else {
    double lhs, rhs;
    if (!val_to_f64_pair(lv, rv, ft, &lhs, &rhs))
      MUSTTAIL return notanumber(ARGS);
    r = cmp_f64(op, lhs, rhs);
  }
  SC_STORE(dst, invert, r);
  if (r)
    ip += fiber->sc_jump;
  DISPATCH();
}

THREADED void vm_op_setcond_bad_op(PARAMS) {
  MUSTTAIL return unimplemented(ARGS);
}

#define SETC_NOTF_OP_DEFINITION(name_)                                         \
  THREADED void vm_op_##name_(PARAMS) {                                        \
    ssz_t dst = ARG2A;                                                         \
    bool invert = ARG2B != 0;                                                  \
    bc_t ci = ip[-1];                                                          \
    if (cmp_notf(bp[g3A(ci)], g2B(ci)))                                        \
      SC_ON_TRUE;                                                              \
    else                                                                       \
      SC_ON_FALSE;                                                             \
    DISPATCH();                                                                \
  }

#define SETC_DI_OP_DEFINITION(name_, op_)                                      \
  THREADED void vm_op_##name_(PARAMS) {                                        \
    ssz_t dst = ARG2A;                                                         \
    bool invert = ARG2B != 0;                                                  \
    bc_t ci = ip[-1];                                                          \
    CMP_DI(op_, bp[g3A(ci)], sign_extend(g2B(ci), 16, 32),                     \
           vm_op_compare_di_fallback(ARGS), SC_ON_TRUE, SC_ON_FALSE);          \
    DISPATCH();                                                                \
  }

#define SETC_DC_OP_DEFINITION(name_, op_)                                      \
  THREADED void vm_op_##name_(PARAMS) {                                        \
    ssz_t dst = ARG2A;                                                         \
    bool invert = ARG2B != 0;                                                  \
    bc_t ci = ip[-1];                                                          \
    CMP_NUM(op_, bp[g3A(ci)], fiber->ctbl[g2B(ci)],                            \
            vm_op_compare_setc_fallback(ARGS), SC_ON_TRUE, SC_ON_FALSE);       \
    DISPATCH();                                                                \
  }

#define SETC_DD_OP_DEFINITION(name_, op_)                                      \
  THREADED void vm_op_##name_(PARAMS) {                                        \
    ssz_t dst = ARG2A;                                                         \
    bool invert = ARG2B != 0;                                                  \
    bc_t ci = ip[-1];                                                          \
    CMP_NUM(op_, bp[g3A(ci)], bp[g2B(ci)], vm_op_compare_setc_fallback(ARGS),  \
            SC_ON_TRUE, SC_ON_FALSE);                                          \
    DISPATCH();                                                                \
  }

SETC_NOTF_OP_DEFINITION(setc_CmpNotF)
SETC_DI_OP_DEFINITION(setc_CmpEqDI, ==)
SETC_DI_OP_DEFINITION(setc_CmpNeDI, !=)
SETC_DC_OP_DEFINITION(setc_CmpEqDC, ==)
SETC_DC_OP_DEFINITION(setc_CmpNeDC, !=)
SETC_DC_OP_DEFINITION(setc_CmpLtDC, <)
SETC_DC_OP_DEFINITION(setc_CmpLeDC, <=)
SETC_DC_OP_DEFINITION(setc_CmpGtDC, >)
SETC_DC_OP_DEFINITION(setc_CmpGeDC, >=)
SETC_DD_OP_DEFINITION(setc_CmpEqDD, ==)
SETC_DD_OP_DEFINITION(setc_CmpNeDD, !=)
SETC_DD_OP_DEFINITION(setc_CmpLtDD, <)
SETC_DD_OP_DEFINITION(setc_CmpLeDD, <=)
SETC_DD_OP_DEFINITION(setc_CmpGtDD, >)
SETC_DD_OP_DEFINITION(setc_CmpGeDD, >=)

OP_DEFINITION(SetCond) {
  fiber->sc_jump = 0;

  FETCH_INSN();
  DECODE_OP();
  INC_IP();

  op_t idx = op - CmpNotF;
  if (unlikely(idx >= LIMIT - CmpNotF))
    MUSTTAIL return vm_op_setcond_bad_op(ARGS);

  MUSTTAIL return dispatch_setc[idx](ARGS);
}

OP_DEFINITION(SetCondJ) {
  fiber->sc_jump = 1;

  FETCH_INSN();
  DECODE_OP();
  INC_IP();

  op_t idx = op - CmpNotF;
  if (unlikely(idx >= LIMIT - CmpNotF))
    MUSTTAIL return vm_op_setcond_bad_op(ARGS);

  MUSTTAIL return dispatch_setc[idx](ARGS);
}

OP_DEFINITION(CmpNotF) {
  NEXT_INSN(ji);
  COND_NEXT_IP(cmp_notf(bp[ARG2A], ARG2B), ji);
  DISPATCH();
}

OP_DEFINITION(CmpEqDI) {
  NEXT_INSN(ji);
  CMP_DI(==, bp[ARG2A], sign_extend(ARG2B, 16, 32),
         vm_op_compare_di_fallback(ARGS), ((void)0), COND_NEXT_IP(false, ji));
  DISPATCH();
}

OP_DEFINITION(CmpNeDI) {
  NEXT_INSN(ji);
  CMP_DI(!=, bp[ARG2A], sign_extend(ARG2B, 16, 32),
         vm_op_compare_di_fallback(ARGS), ((void)0), COND_NEXT_IP(false, ji));
  DISPATCH();
}

#define DEFINE_OP_CMP_DC(name_, op_)                                           \
  OP_DEFINITION(name_) {                                                       \
    NEXT_INSN(ji);                                                             \
    CMP_NUM(op_, bp[ARG2A], fiber->ctbl[ARG2B],                                \
            vm_op_compare_dc_fallback(ARGS), ((void)0),                        \
            COND_NEXT_IP(false, ji));                                          \
    DISPATCH();                                                                \
  }

DEFINE_OP_CMP_DC(CmpEqDC, ==)
DEFINE_OP_CMP_DC(CmpNeDC, !=)
DEFINE_OP_CMP_DC(CmpLtDC, <)
DEFINE_OP_CMP_DC(CmpLeDC, <=)
DEFINE_OP_CMP_DC(CmpGtDC, >)
DEFINE_OP_CMP_DC(CmpGeDC, >=)

#define DEFINE_OP_CMP_DD(name_, op_)                                           \
  OP_DEFINITION(name_) {                                                       \
    NEXT_INSN(ji);                                                             \
    CMP_NUM(op_, bp[ARG2A], bp[ARG2B], vm_op_compare_dd_fallback(ARGS),        \
            ((void)0), COND_NEXT_IP(false, ji));                               \
    DISPATCH();                                                                \
  }

DEFINE_OP_CMP_DD(CmpEqDD, ==)
DEFINE_OP_CMP_DD(CmpNeDD, !=)
DEFINE_OP_CMP_DD(CmpLtDD, <)
DEFINE_OP_CMP_DD(CmpLeDD, <=)
DEFINE_OP_CMP_DD(CmpGtDD, >)
DEFINE_OP_CMP_DD(CmpGeDD, >=)

static opthread *const dispatch_setc[LIMIT - CmpNotF] = {
    vm_op_setc_CmpNotF, vm_op_setc_CmpEqDI, vm_op_setc_CmpNeDI,
    vm_op_setc_CmpEqDC, vm_op_setc_CmpNeDC, vm_op_setc_CmpLtDC,
    vm_op_setc_CmpLeDC, vm_op_setc_CmpGtDC, vm_op_setc_CmpGeDC,
    vm_op_setc_CmpEqDD, vm_op_setc_CmpNeDD, vm_op_setc_CmpLtDD,
    vm_op_setc_CmpLeDD, vm_op_setc_CmpGtDD, vm_op_setc_CmpGeDD,
};

static opthread *const dispatch[] = {
#define OPIMPLS(op, mnemonic) vm_op_##op,
    OPS(OPIMPLS)
#undef OPIMPLS
};
