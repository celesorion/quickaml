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

static opthread *const dispatch[];

[[gnu::noinline]]
status_t vm_entry(struct state *state) {
  bc_t *ip = state->entry->ops;
  val_t *bp = next_bp(state->stk, 2);
  frame_rv(bp) = ptr2val(state->entry);
  frame_ra(bp) = 0;
  struct function **fns = state->fns;

  [[maybe_unused]] uint8_t a3a, a3b, a3c;
  [[maybe_unused]] uint16_t a2b;

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
    if (val_is_int(_lhs)) {                                                    \
      if (val_as_i32(_lhs) op_ _imm) {                                         \
        on_true_;                                                              \
      } else {                                                                 \
        on_false_;                                                             \
      }                                                                        \
    } else if (val_is_number(_lhs)) {                                          \
      if (val_as_f64(_lhs) op_(double) _imm) {                                 \
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
    if (val_is_int(_lhs)) {                                                    \
      if (val_is_int(_rhs)) {                                                  \
        if (val_as_i32(_lhs) op_ val_as_i32(_rhs)) {                           \
          on_true_;                                                            \
        } else {                                                               \
          on_false_;                                                           \
        }                                                                      \
      } else if (val_is_number(_rhs)) {                                        \
        if ((double)val_as_i32(_lhs) op_ val_as_f64(_rhs)) {                   \
          on_true_;                                                            \
        } else {                                                               \
          on_false_;                                                           \
        }                                                                      \
      } else {                                                                 \
        MUSTTAIL return badret_;                                               \
      }                                                                        \
    } else if (val_is_number(_lhs)) {                                          \
      if (val_is_int(_rhs)) {                                                  \
        if (val_as_f64(_lhs) op_(double) val_as_i32(_rhs)) {                   \
          on_true_;                                                            \
        } else {                                                               \
          on_false_;                                                           \
        }                                                                      \
      } else if (val_is_number(_rhs)) {                                        \
        if (val_as_f64(_lhs) op_ val_as_f64(_rhs)) {                           \
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

  bp[dst] = val_from_i32(sign_extend(ARG2B, 16, 32));

  DISPATCH();
}

OP_DEFINITION(LoaduI) {
  ssz_t dst = ARG2A;

  bp[dst] = val_from_i32(zero_extend(ARG2B, 16, 32));

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

  DISPATCH();
}

OP_DEFINITION(Retu) {
  frame_rv(bp) = 0;

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;

  DISPATCH();
}

OP_DEFINITION(Ret) {
  ssz_t rv = ARG2A;

  frame_rv(bp) = bp[rv];

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;

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
  joff_t target =
      val_is_int(bp[src]) ? (joff_t)val_as_i32(bp[src]) : val2off(bp[src]);

  ip = add2ip(ip, target);

  DISPATCH();
}

#define DEFINE_OP_ARITH_DI(name_, op_, overflow_)                              \
  OP_DEFINITION(name_) {                                                       \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    int32_t imm = di_imm(ARG3Z);                                               \
    if (val_is_int(bp[o1])) {                                                  \
      int32_t lhs = val_as_i32(bp[o1]);                                        \
      int32_t out;                                                             \
      if (!(overflow_))                                                        \
        bp[dst] = val_from_i32(out);                                           \
      else                                                                     \
        bp[dst] = val_from_f64((double)lhs op_(double) imm);                   \
    } else if (val_is_float(bp[o1])) {                                         \
      double lhs = val_as_f64(bp[o1]);                                         \
      bp[dst] = val_from_f64(lhs op_(double) imm);                             \
    } else {                                                                   \
      MUSTTAIL return notanumber(ARGS);                                        \
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
  if (val_is_int(bp[o1])) {
    int32_t lhs = val_as_i32(bp[o1]);
    if (imm != 0 && !(lhs == INT32_MIN && imm == -1)) {
      int32_t q = lhs / imm;
      int32_t r = lhs % imm;
      if (r != 0 && ((lhs ^ imm) < 0))
        q -= 1;
      bp[dst] = val_from_i32(q);
    } else
      bp[dst] = val_from_f64((double)lhs / (double)imm);
  } else if (val_is_float(bp[o1])) {
    double lhs = val_as_f64(bp[o1]);
    bp[dst] = val_from_f64(lhs / (double)imm);
  } else {
    MUSTTAIL return notanumber(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(RemDI) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  int32_t imm = di_imm(ARG3Z);
  if (val_is_int(bp[o1])) {
    int32_t lhs = val_as_i32(bp[o1]);
    if (imm != 0) {
      int32_t r = lhs % imm;
      if (r != 0 && ((lhs ^ imm) < 0))
        r += imm;
      bp[dst] = val_from_i32(r);
    } else
      bp[dst] = val_from_f64(fmod((double)lhs, (double)imm));
  } else if (val_is_float(bp[o1])) {
    double lhs = val_as_f64(bp[o1]);
    bp[dst] = val_from_f64(fmod(lhs, (double)imm));
  } else {
    MUSTTAIL return notanumber(ARGS);
  }
  DISPATCH();
}

#define DEFINE_OP_ARITH_DD(name_, op_, overflow_)                              \
  OP_DEFINITION(name_) {                                                       \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t o2 = ARG3Z;                                                          \
    if (val_is_int(bp[o1])) {                                                  \
      if (val_is_int(bp[o2])) {                                                \
        int32_t lhs = val_as_i32(bp[o1]);                                      \
        int32_t rhs = val_as_i32(bp[o2]);                                      \
        int32_t out;                                                           \
        if (!(overflow_))                                                      \
          bp[dst] = val_from_i32(out);                                         \
        else                                                                   \
          bp[dst] = val_from_f64((double)lhs op_(double) rhs);                 \
      } else if (val_is_number(bp[o2])) {                                      \
        bp[dst] =                                                              \
            val_from_f64((double)val_as_i32(bp[o1]) op_ val_as_f64(bp[o2]));   \
      } else {                                                                 \
        MUSTTAIL return notanumber(ARGS);                                      \
      }                                                                        \
    } else if (val_is_number(bp[o1])) {                                        \
      if (val_is_int(bp[o2])) {                                                \
        bp[dst] =                                                              \
            val_from_f64(val_as_f64(bp[o1]) op_(double) val_as_i32(bp[o2]));   \
      } else if (val_is_number(bp[o2])) {                                      \
        bp[dst] = val_from_f64(val_as_f64(bp[o1]) op_ val_as_f64(bp[o2]));     \
      } else {                                                                 \
        MUSTTAIL return notanumber(ARGS);                                      \
      }                                                                        \
    } else {                                                                   \
      MUSTTAIL return notanumber(ARGS);                                        \
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
  if (val_is_int(bp[o1])) {
    if (val_is_int(bp[o2])) {
      int32_t lhs = val_as_i32(bp[o1]);
      int32_t rhs = val_as_i32(bp[o2]);
      if (rhs != 0 && !(lhs == INT32_MIN && rhs == -1)) {
        int32_t q = lhs / rhs;
        int32_t r = lhs % rhs;
        if (r != 0 && ((lhs ^ rhs) < 0))
          q -= 1;
        bp[dst] = val_from_i32(q);
      } else
        bp[dst] = val_from_f64((double)lhs / (double)rhs);
    } else if (val_is_number(bp[o2])) {
      bp[dst] = val_from_f64((double)val_as_i32(bp[o1]) / val_as_f64(bp[o2]));
    } else {
      MUSTTAIL return notanumber(ARGS);
    }
  } else if (val_is_number(bp[o1])) {
    if (val_is_int(bp[o2])) {
      bp[dst] = val_from_f64(val_as_f64(bp[o1]) / (double)val_as_i32(bp[o2]));
    } else if (val_is_number(bp[o2])) {
      bp[dst] = val_from_f64(val_as_f64(bp[o1]) / val_as_f64(bp[o2]));
    } else {
      MUSTTAIL return notanumber(ARGS);
    }
  } else {
    MUSTTAIL return notanumber(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(RemDD) {
  ssz_t dst = ARG3X;
  ssz_t o1 = ARG3Y;
  ssz_t o2 = ARG3Z;
  if (val_is_int(bp[o1])) {
    if (val_is_int(bp[o2])) {
      int32_t lhs = val_as_i32(bp[o1]);
      int32_t rhs = val_as_i32(bp[o2]);
      if (rhs != 0) {
        int32_t r = lhs % rhs;
        if (r != 0 && ((lhs ^ rhs) < 0))
          r += rhs;
        bp[dst] = val_from_i32(r);
      } else
        bp[dst] = val_from_f64(fmod((double)lhs, (double)rhs));
    } else if (val_is_number(bp[o2])) {
      bp[dst] =
          val_from_f64(fmod((double)val_as_i32(bp[o1]), val_as_f64(bp[o2])));
    } else {
      MUSTTAIL return notanumber(ARGS);
    }
  } else if (val_is_number(bp[o1])) {
    if (val_is_int(bp[o2])) {
      bp[dst] =
          val_from_f64(fmod(val_as_f64(bp[o1]), (double)val_as_i32(bp[o2])));
    } else if (val_is_number(bp[o2])) {
      bp[dst] = val_from_f64(fmod(val_as_f64(bp[o1]), val_as_f64(bp[o2])));
    } else {
      MUSTTAIL return notanumber(ARGS);
    }
  } else {
    MUSTTAIL return notanumber(ARGS);
  }
  DISPATCH();
}

OP_DEFINITION(NegD) {
  ssz_t dst = ARG3X;
  ssz_t src = ARG3Y;
  if (val_is_int(bp[src])) {
    int32_t value = val_as_i32(bp[src]);
    if (value != INT32_MIN)
      bp[dst] = val_from_i32(-value);
    else
      bp[dst] = val_from_f64(-(double)value);
  } else if (val_is_number(bp[src])) {
    bp[dst] = val_from_f64(-val_as_f64(bp[src]));
  } else {
    MUSTTAIL return notanumber(ARGS);
  }
  DISPATCH();
}

#define SETCOND_ON_TRUE()                                                      \
  do {                                                                         \
    if (mode < 0) {                                                            \
      bp[dst] = val_from_bool(false);                                          \
      ip++;                                                                    \
    } else {                                                                   \
      bp[dst] = val_from_bool(true);                                           \
    }                                                                          \
  } while (0)

#define SETCOND_ON_FALSE()                                                     \
  do {                                                                         \
    if (mode > 0) {                                                            \
      bp[dst] = val_from_bool(false);                                          \
      ip++;                                                                    \
    } else {                                                                   \
      bp[dst] = val_from_bool(true);                                           \
    }                                                                          \
  } while (0)

OP_DEFINITION(SetCond) {
  ssz_t dst = ARG2A;
  int16_t mode = cast_s(ARG2B, 16);

  FETCH_INSN();
  DECODE_OP();
  DECODE_A3A();
  DECODE_A2SB();
  INC_IP();

  switch (op) {
  case CmpNotF:
    if (cmp_notf(bp[ARG2A], ARG2B))
      SETCOND_ON_TRUE();
    else
      SETCOND_ON_FALSE();
    DISPATCH();
  case CmpEqDI:
    CMP_DI(==, bp[ARG2A], (int32_t)ARG2B, notanumber(ARGS), SETCOND_ON_TRUE(),
           SETCOND_ON_FALSE());
    DISPATCH();
  case CmpNeDI:
    CMP_DI(!=, bp[ARG2A], (int32_t)ARG2B, notanumber(ARGS), SETCOND_ON_TRUE(),
           SETCOND_ON_FALSE());
    DISPATCH();
  case CmpEqDC:
    CMP_NUM(==, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS),
            SETCOND_ON_TRUE(), SETCOND_ON_FALSE());
    DISPATCH();
  case CmpNeDC:
    CMP_NUM(!=, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS),
            SETCOND_ON_TRUE(), SETCOND_ON_FALSE());
    DISPATCH();
  case CmpLtDC:
    CMP_NUM(<, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS),
            SETCOND_ON_TRUE(), SETCOND_ON_FALSE());
    DISPATCH();
  case CmpLeDC:
    CMP_NUM(<=, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS),
            SETCOND_ON_TRUE(), SETCOND_ON_FALSE());
    DISPATCH();
  case CmpGtDC:
    CMP_NUM(>, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS),
            SETCOND_ON_TRUE(), SETCOND_ON_FALSE());
    DISPATCH();
  case CmpGeDC:
    CMP_NUM(>=, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS),
            SETCOND_ON_TRUE(), SETCOND_ON_FALSE());
    DISPATCH();
  case CmpEqDD:
    CMP_NUM(==, bp[ARG2A], bp[ARG2B], notanumber(ARGS), SETCOND_ON_TRUE(),
            SETCOND_ON_FALSE());
    DISPATCH();
  case CmpNeDD:
    CMP_NUM(!=, bp[ARG2A], bp[ARG2B], notanumber(ARGS), SETCOND_ON_TRUE(),
            SETCOND_ON_FALSE());
    DISPATCH();
  case CmpLtDD:
    CMP_NUM(<, bp[ARG2A], bp[ARG2B], notanumber(ARGS), SETCOND_ON_TRUE(),
            SETCOND_ON_FALSE());
    DISPATCH();
  case CmpLeDD:
    CMP_NUM(<=, bp[ARG2A], bp[ARG2B], notanumber(ARGS), SETCOND_ON_TRUE(),
            SETCOND_ON_FALSE());
    DISPATCH();
  case CmpGtDD:
    CMP_NUM(>, bp[ARG2A], bp[ARG2B], notanumber(ARGS), SETCOND_ON_TRUE(),
            SETCOND_ON_FALSE());
    DISPATCH();
  case CmpGeDD:
    CMP_NUM(>=, bp[ARG2A], bp[ARG2B], notanumber(ARGS), SETCOND_ON_TRUE(),
            SETCOND_ON_FALSE());
    DISPATCH();
  default:
    MUSTTAIL return unimplemented(ARGS);
  }
}

OP_DEFINITION(CmpNotF) {
  if (!cmp_notf(bp[ARG2A], ARG2B))
    ip++;
  DISPATCH();
}

OP_DEFINITION(CmpEqDI) {
  CMP_DI(==, bp[ARG2A], (int32_t)ARG2B, notanumber(ARGS), ((void)0), ip++);
  DISPATCH();
}

OP_DEFINITION(CmpNeDI) {
  CMP_DI(!=, bp[ARG2A], (int32_t)ARG2B, notanumber(ARGS), ((void)0), ip++);
  DISPATCH();
}

#define DEFINE_OP_CMP_DC(name_, op_)                                           \
  OP_DEFINITION(name_) {                                                       \
    CMP_NUM(op_, bp[ARG2A], state->ctbl[ARG2B], notanumber(ARGS), ((void)0),   \
            ip++);                                                             \
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
    CMP_NUM(op_, bp[ARG2A], bp[ARG2B], notanumber(ARGS), ((void)0), ip++);     \
    DISPATCH();                                                                \
  }

DEFINE_OP_CMP_DD(CmpEqDD, ==)
DEFINE_OP_CMP_DD(CmpNeDD, !=)
DEFINE_OP_CMP_DD(CmpLtDD, <)
DEFINE_OP_CMP_DD(CmpLeDD, <=)
DEFINE_OP_CMP_DD(CmpGtDD, >)
DEFINE_OP_CMP_DD(CmpGeDD, >=)

static opthread *const dispatch[] = {
#define OPIMPLS(op, mnemonic) vm_op_##op,
    OPS(OPIMPLS)
#undef OPIMPLS
};
