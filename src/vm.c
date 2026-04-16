#include "vm.h"
#include "alloc.h"
#include "bc.h"
#include "object.h"
#include "state.h"
#include "trap.h"

#include <inttypes.h>
#include <limits.h>
#include <math.h>
#include <stddef.h>
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
status_t vm_entry(struct state *state) {
  bc_t *ip = state->entry->ops;
  val_t *bp = next_bp(state->stk, 2);
  frame_rv(bp) = ptr2val(state->entry);
  frame_ra(bp) = 0;
  state->ctbl = state->entry->ctbl;
  struct function **fns = state->fns;

  [[maybe_unused]] uint8_t a3a, a3b, a3c;
  [[maybe_unused]] uint16_t a2b;
  uint64_t ft = VAL_FLOAT_TAG;

  NONTAILDISPATCH();
  return S_OK;
}

THREADED
void panic(PARAMS) {
  [[maybe_unused]] int r;
  PCALL(r, fprintf, stderr, "panic: %s\n", state->msg);
  PCALL_VOID(exit, 255);
}

THREADED
void stackoverflow(PARAMS) {
  state->msg = "stack overflow";
  MUSTTAIL return panic(ARGS);
}

THREADED
void unimplemented(PARAMS) {
  state->msg = "unimplemented";
  MUSTTAIL return panic(ARGS);
}

THREADED
void undefined(PARAMS) {
  state->msg = "invalid bytecode";
  MUSTTAIL return panic(ARGS);
}

THREADED
void invalidlayout(PARAMS) {
  state->msg = "invalid layout";
  MUSTTAIL return panic(ARGS);
}

THREADED
void assertionfailed(PARAMS) {
  state->msg = "assertion failed";
  MUSTTAIL return panic(ARGS);
}

THREADED
void invalidtrap(PARAMS) {
  state->msg = "invalid trap id";
  MUSTTAIL return panic(ARGS);
}

THREADED
void unusedexta(PARAMS) {
  state->msg = "unused extra arguments";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notanumber(PARAMS) {
  state->msg = "not a number";
  MUSTTAIL return panic(ARGS);
}

THREADED
void notaoffset(PARAMS) {
  state->msg = "not a offset";
  MUSTTAIL return panic(ARGS);
}

THREADED
void diverge(PARAMS) {
  for (;;)
    ;
}

THREADED
void halt(PARAMS) { return; }

INLINE bool cmp_notf(val_t lhs, uint16_t flag) {
  return flag == UINT16_MAX ? val_is_falsy(lhs) : !val_is_falsy(lhs);
}

INLINE int32_t di_imm(uint8_t imm) { return sign_extend(imm, 8, 32); }

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

OP_DEFINITION(Trap) {
  ssz_t tid = ARG3A;
  switch (tid) {
  case T_UNDEFINED:
    MUSTTAIL return undefined(ARGS);
  case T_DIVERGE:
    MUSTTAIL return diverge(ARGS);
  case T_HALT:
    MUSTTAIL return halt(ARGS);
  case T_UNUSEDEXTA:
    MUSTTAIL return unusedexta(ARGS);
  case T_PRINTREGS:
  case T_PRINTREGSX: {
    ssz_t i1 = ARG3B;
    ssz_t i2 = ARG3C;

    for (ssz_t i = i1; i < i2; i++) {
      [[maybe_unused]] int r;
      PCALL(r, fprintf, stderr,
            tid == T_PRINTREGSX ? ("[%u] 0x%" PRIx64 "\n")
                                : ("[%u] %" PRIu64 "\n"),
            i, bp[i]);
    }
    break;
  }
  case T_ASSERT_EQ: {
    ssz_t i1 = ARG3B;
    ssz_t i2 = ARG3C;

    if (bp[i1] != bp[i2]) {
      [[maybe_unused]] int r;
      PCALL(r, fprintf, stderr, "0x%" PRIx64 " != 0x%" PRIx64 "\n", bp[i1],
            bp[i2]);
      MUSTTAIL return assertionfailed(ARGS);
    }
    break;
  }
  case T_PRINTOBJ: {
    ssz_t o = ARG3B;
    [[maybe_unused]] int r;
    PCALL(r, fprintf, stderr, "r%u = ", o);
    PCALL_VOID(obj_print, stderr, bp[o]);
    PCALL(r, fprintf, stderr, "\n");
    break;
  }
  case T_HEAPSTAT: {
    PCALL_VOID(heap_stat_print, state->heap);
    break;
  }
  default:
    MUSTTAIL return invalidtrap(ARGS);
  }

  DISPATCH();
}

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

OP_DEFINITION(LoadC) {
  ssz_t dst = ARG2A;
  val_t cidx = ARG2B;

  bp[dst] = state->ctbl[cidx];

  DISPATCH();
}

OP_DEFINITION(LoadF) {
  ssz_t dst = ARG2A;
  val_t fidx = ARG2B;

  (void)dst;
  (void)fidx;
  MUSTTAIL return unimplemented(ARGS);
}

OP_DEFINITION(SetF) {
  ssz_t dst = ARG2A;
  val_t fidx = ARG2B;

  (void)dst;
  (void)fidx;
  MUSTTAIL return unimplemented(ARGS);
}

OP_DEFINITION(Move) {
  ssz_t dst = ARG2A;
  ssz_t src = ARG2B;

  bp[dst] = bp[src];

  DISPATCH();
}

OP_DEFINITION(Apply) {
  ssz_t iclos = ARG2A;

  struct closure *clos = val_as_ptr(bp[iclos]);
  struct function *fn = clos->fn;

  bc_t *oldip = ip;
  ip = fn->ops;

  bp = next_bp(bp, iclos);
  if (unlikely(bp >= state->stklimit)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_rv(bp) = ptr2val(fn);
  frame_ra(bp) = ptr2val(oldip);
  state->ctbl = fn->ctbl;

  // copy closure to the first slot as arg 0
  bp[0] = val_from_ptr(clos);

  DISPATCH();
}

OP_DEFINITION(Call) {
  ssz_t dst = ARG2A;
  ssz_t fx = ARG2B;

  struct function *fn = val2ptr(fns[fx]);

  bc_t *oldip = ip;
  ip = fn->ops;

  bp = next_bp(bp, dst);
  if (unlikely(bp >= state->stklimit)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_rv(bp) = ptr2val(fn);
  frame_ra(bp) = ptr2val(oldip);
  state->ctbl = fn->ctbl;

  DISPATCH();
}

OP_DEFINITION(Retu) {
  frame_rv(bp) = 0;

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;
  state->ctbl = ((struct function *)val2ptr(frame_rv(bp)))->ctbl;

  DISPATCH();
}

OP_DEFINITION(Ret) {
  ssz_t rv = ARG3A;

  frame_rv(bp) = bp[rv];

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;
  state->ctbl = ((struct function *)val2ptr(frame_rv(bp)))->ctbl;

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
  state->ctbl = ((struct function *)val2ptr(frame_rv(bp)))->ctbl;

  DISPATCH();
}

OP_DEFINITION(Clos) {
  ssz_t dst = ARG2A;
  ssz_t fx = ARG2B;

  struct closure *clos;
  PCALL(clos, alloc_object, closure_size(0), state, bp);
  closure_init(clos, fns[fx], 0);

  bp[dst] = val_from_ptr(clos);

  DISPATCH();
}

OP_DEFINITION(WObj) {
  ssz_t fld = ARG3A;
  ssz_t tag = ARG3B;
  ssz_t len = ARG3C;

  if (unlikely(tag > state->numobject)) {
    MUSTTAIL return invalidlayout(ARGS);
  }

  /* TODO: len or size? */

  struct object *obj;
  PCALL(obj, alloc_object, object_size(len), state, bp);
  object_init(obj, (uint16_t)tag, len);
  for (ssz_t i = 0; i < len; i++)
    obj->fields[i] = bp[fld + i];

  bp[fld] = val_from_ptr(obj);

  DISPATCH();
}

OP_DEFINITION(MObj) {
  ssz_t dst = ARG3A;
  ssz_t tag = ARG3B;
  ssz_t src = ARG3C;
  (void)src;

  if (tag < TAG_INT) {
    bp[dst] = val_from_tag((uint8_t)tag);
    DISPATCH();
  }

  if (unlikely(tag > state->numobject)) {
    MUSTTAIL return invalidlayout(ARGS);
  }

  // TODO: allocate and materialize heap-backed objects here once the allocator
  // and GC semantics are ready.
  bp[dst] = bp[src];

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

INLINE bool val_to_f64_pair(val_t lv, val_t rv, uint64_t ft, double *lhs,
                            double *rhs) {
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

INLINE bool val_eq(val_t lhs, val_t rhs, uint64_t ft) {
  if (lhs == rhs)
    return true;
  double l, r;
  if (val_to_f64_pair(lhs, rhs, ft, &l, &r))
    return l == r;
  if (val_is_ptr(lhs) && val_is_ptr(rhs)) {
    void *lp = val_as_ptr(lhs), *rp = val_as_ptr(rhs);
    if (obj_kind_of(lp) == OBJ_STRING && obj_kind_of(rp) == OBJ_STRING) {
      struct str *ls = lp, *rs = rp;
      size_t ll = str_len(ls);
      return ll == str_len(rs) && memcmp(ls->bytes, rs->bytes, ll) == 0;
    }
  }
  return false;
}

INLINE bool cmp_f64(op_t op, double lhs, double rhs) {
  switch (op) {
  case CmpEqDC: case CmpEqDD: return lhs == rhs;
  case CmpNeDC: case CmpNeDD: return lhs != rhs;
  case CmpLtDC: case CmpLtDD: return lhs < rhs;
  case CmpLeDC: case CmpLeDD: return lhs <= rhs;
  case CmpGtDC: case CmpGtDD: return lhs > rhs;
  case CmpGeDC: case CmpGeDD: return lhs >= rhs;
  default: __builtin_unreachable();
  }
}

INLINE bool cmp_is_eq(op_t op) {
  return op == CmpEqDC || op == CmpEqDD;
}

INLINE bool cmp_is_ne(op_t op) {
  return op == CmpNeDC || op == CmpNeDD;
}

THREADED void vm_op_arith_di_fallback(PARAMS) {
  val_t v = bp[ARG3Y];
  if (unlikely(!val_is_int_macro(v, ft)))
    MUSTTAIL return notanumber(ARGS);
  double lhs = (double)val_as_i32_macro(v, ft);
  double rhs = (double)di_imm(ARG3Z);
  double res;
  switch (gOP(ip[-1])) {
  case AddDI: res = lhs + rhs; break;
  case SubDI: res = lhs - rhs; break;
  case MulDI: res = lhs * rhs; break;
  case DivDI: res = lhs / rhs; break;
  case RemDI: res = fast_fmod(lhs, rhs); break;
  default: MUSTTAIL return notanumber(ARGS);
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
  case AddDD: res = lhs + rhs; break;
  case SubDD: res = lhs - rhs; break;
  case MulDD: res = lhs * rhs; break;
  case DivDD: res = lhs / rhs; break;
  case RemDD: res = fast_fmod(lhs, rhs); break;
  default: MUSTTAIL return notanumber(ARGS);
  }
  bp[ARG3X] = val_from_f64_macro(res, ft);
  DISPATCH();
}

#define DEFINE_OP_ARITH_DI(name_, op_, overflow_)                              \
  OP_DEFINITION(name_) {                                                       \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    int32_t imm = di_imm(ARG3Z);                                               \
    if (val_is_int_macro(bp[o1], ft)) {                                        \
      int32_t lhs = val_as_i32_macro(bp[o1], ft);                              \
      int32_t out;                                                             \
      if (!(overflow_))                                                        \
        bp[dst] = val_from_i32_macro(out, ft);                                 \
      else                                                                     \
        MUSTTAIL return vm_op_arith_di_fallback(ARGS);                         \
    } else if (val_is_number_macro(bp[o1], ft)) {                              \
      double lhs = val_as_f64_macro(bp[o1], ft);                               \
      bp[dst] = val_from_f64_macro(lhs op_(double) imm, ft);                   \
    } else {                                                                   \
      MUSTTAIL return vm_op_arith_di_fallback(ARGS);                           \
    }                                                                          \
    DISPATCH();                                                                \
  }

#define ARITH_DI_INT_OVERFLOW(op_, overflow_)

DEFINE_OP_ARITH_DI(AddDI, +, __builtin_add_overflow(lhs, imm, &out))
DEFINE_OP_ARITH_DI(SubDI, -, __builtin_sub_overflow(lhs, imm, &out))
DEFINE_OP_ARITH_DI(MulDI, *, __builtin_mul_overflow(lhs, imm, &out))

OP_DEFINITION(DivDI) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  int32_t imm = di_imm(ARG3Z);
  if (val_is_int_macro(bp[o1], ft)) {
    int32_t lhs = val_as_i32_macro(bp[o1], ft);
    if (imm != 0 && !(lhs == INT32_MIN && imm == -1)) {
      int32_t q = lhs / imm;
      int32_t r = lhs % imm;
      if (r != 0 && ((lhs ^ imm) < 0))
        q -= 1;
      bp[dst] = val_from_i32_macro(q, ft);
    } else {
      MUSTTAIL return vm_op_arith_di_fallback(ARGS);
    }
  } else if (val_is_number_macro(bp[o1], ft)) {
    double lhs = val_as_f64_macro(bp[o1], ft);
    bp[dst] = val_from_f64_macro(lhs / (double)imm, ft);
  } else {
    MUSTTAIL return vm_op_arith_di_fallback(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(RemDI) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  int32_t imm = di_imm(ARG3Z);
  if (val_is_int_macro(bp[o1], ft)) {
    int32_t lhs = val_as_i32_macro(bp[o1], ft);
    if (imm != 0) {
      int32_t r = lhs % imm;
      if (r != 0 && ((lhs ^ imm) < 0))
        r += imm;
      bp[dst] = val_from_i32_macro(r, ft);
    } else {
      MUSTTAIL return vm_op_arith_di_fallback(ARGS);
    }
  } else if (val_is_number_macro(bp[o1], ft)) {
    double lhs = val_as_f64_macro(bp[o1], ft);
    bp[dst] = val_from_f64_macro(fast_fmod(lhs, (double)imm), ft);
  } else {
    MUSTTAIL return vm_op_arith_di_fallback(ARGS);
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
        bp[dst] = val_from_f64_macro(val_as_f64_macro(v1, ft)                  \
                                         op_ val_as_f64_macro(v2, ft),         \
                                     ft);                                      \
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
  val_t lv = bp[ARG2A], rv = state->ctbl[ARG2B];
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
    ip += state->sc_jump;                                                      \
  } while (0)
#define SC_ON_FALSE SC_STORE(dst, invert, false)

THREADED void vm_op_compare_setc_fallback(PARAMS) {
  ssz_t dst = ARG2A;
  bool invert = ARG2B != 0;
  bc_t ci = ip[-1];
  op_t op = gOP(ci);
  val_t lv = bp[g3A(ci)];
  val_t rv = (op >= CmpEqDD) ? bp[g2B(ci)] : state->ctbl[g2B(ci)];
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
    ip += state->sc_jump;
  DISPATCH();
}

THREADED void vm_op_setcond_bad_op(PARAMS) {
  MUSTTAIL return unimplemented(ARGS);
}

#define SETC_NOTF_OP_DEFINITION(name_)                                        \
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
    CMP_DI(op_, bp[g3A(ci)], (int32_t)g2B(ci),                                 \
           vm_op_compare_di_fallback(ARGS), SC_ON_TRUE, SC_ON_FALSE);          \
    DISPATCH();                                                                \
  }

#define SETC_DC_OP_DEFINITION(name_, op_)                                      \
  THREADED void vm_op_##name_(PARAMS) {                                        \
    ssz_t dst = ARG2A;                                                         \
    bool invert = ARG2B != 0;                                                  \
    bc_t ci = ip[-1];                                                          \
    CMP_NUM(op_, bp[g3A(ci)], state->ctbl[g2B(ci)],                            \
            vm_op_compare_setc_fallback(ARGS), SC_ON_TRUE, SC_ON_FALSE);       \
    DISPATCH();                                                                \
  }

#define SETC_DD_OP_DEFINITION(name_, op_)                                      \
  THREADED void vm_op_##name_(PARAMS) {                                        \
    ssz_t dst = ARG2A;                                                         \
    bool invert = ARG2B != 0;                                                  \
    bc_t ci = ip[-1];                                                          \
    CMP_NUM(op_, bp[g3A(ci)], bp[g2B(ci)],                                     \
            vm_op_compare_setc_fallback(ARGS), SC_ON_TRUE, SC_ON_FALSE);       \
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
  state->sc_jump = 0;

  FETCH_INSN();
  DECODE_OP();
  INC_IP();

  op_t idx = op - CmpNotF;
  if (unlikely(idx >= LIMIT - CmpNotF))
    MUSTTAIL return vm_op_setcond_bad_op(ARGS);

  MUSTTAIL return dispatch_setc[idx](ARGS);
}

OP_DEFINITION(SetCondJ) {
  state->sc_jump = 1;

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
  CMP_DI(==, bp[ARG2A], (int32_t)ARG2B, vm_op_compare_di_fallback(ARGS),
         ((void)0), COND_NEXT_IP(false, ji));
  DISPATCH();
}

OP_DEFINITION(CmpNeDI) {
  NEXT_INSN(ji);
  CMP_DI(!=, bp[ARG2A], (int32_t)ARG2B, vm_op_compare_di_fallback(ARGS),
         ((void)0), COND_NEXT_IP(false, ji));
  DISPATCH();
}

#define DEFINE_OP_CMP_DC(name_, op_)                                           \
  OP_DEFINITION(name_) {                                                       \
    NEXT_INSN(ji);                                                             \
    CMP_NUM(op_, bp[ARG2A], state->ctbl[ARG2B],                                \
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
    CMP_NUM(op_, bp[ARG2A], bp[ARG2B],                                         \
            vm_op_compare_dd_fallback(ARGS), ((void)0),                        \
            COND_NEXT_IP(false, ji));                                          \
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
