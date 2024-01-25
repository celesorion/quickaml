#include "vm.h"
#include "alloc.h"
#include "bc.h"
#include "object.h"
#include "state.h"
#include "trap.h"

#include <inttypes.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

static opthread *const dispatch[];

INLINE
int sgn(val_t x) { return (x > (val_t)0) - (x < (val_t)0); }

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
void diverge(PARAMS) {
  for (;;)
    ;
}

THREADED
void halt(PARAMS) { return; }

OP_DEFINITION(TRAP) {
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
    struct object *obj = val2ptr(bp[o]);
    PCALL_VOID(object_print, state, obj);
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

OP_DEFINITION(NOP) { DISPATCH(); }

OP_DEFINITION(MOV) {
  ssz_t dst = ARG2A;
  ssz_t src = ARG2B;

  bp[dst] = bp[src];

  DISPATCH();
}

OP_DEFINITION(EXTA) { MUSTTAIL return unusedexta(ARGS); }

OP_DEFINITION(LSI16) {
  ssz_t dst = ARG2A;

  bp[dst] = sign_extend(ARG2B, 16, 64);

  DISPATCH();
}

OP_DEFINITION(LZI16) {
  ssz_t dst = ARG2A;

  bp[dst] = zero_extend(ARG2B, 16, 64);

  DISPATCH();
}

OP_DEFINITION(LSI32) {
  ssz_t dst = ARG2A;

  NEXT_INSN(exta);

  uint32_t low24 = EXTRA_ARGU(exta);
  uint32_t high8 = ARG2B << 24;

  bp[dst] = sign_extend(low24 | high8, 32, 64);

  DISPATCH();
}

OP_DEFINITION(LZI32) {
  ssz_t dst = ARG2A;

  NEXT_INSN(exta);

  uint32_t low24 = EXTRA_ARGU(exta);
  uint32_t high8 = ARG2B << 24;

  bp[dst] = zero_extend(low24 | high8, 32, 64);

  DISPATCH();
}

OP_DEFINITION(LC) {
  ssz_t dst = ARG2A;
  val_t imm = ARG2B;

  bp[dst] = state->ctbl[imm];

  DISPATCH();
}

OP_DEFINITION(APP) {
  ssz_t iclos = ARG2A;

  struct closure *clos = val2ptr(bp[iclos]);
  struct function *fn = val2ptr(clos->fp);

  bc_t *oldip = ip;
  ip = fn->ops;

  bp = next_bp(bp, iclos);
  if (unlikely(bp >= state->stklimit)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_rv(bp) = ptr2val(fn);
  frame_ra(bp) = ptr2val(oldip);

  // copy closure to the first slot as arg 0
  bp[0] = ptr2val(clos);

  DISPATCH();
}

OP_DEFINITION(CALL) {
  ssz_t dst = ARG3A;
  ssz_t fx = ARG3B;

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

OP_DEFINITION(JMP) {
  joff_t target = val2off(sign_extend(ARG2B, 16, 64));

  ip = add2ip(ip, target);

  DISPATCH();
}

OP_DEFINITION(JR) {
  val_t src = ARG2A;
  joff_t target = val2off(bp[src]);

  ip = add2ip(ip, target);

  DISPATCH();
}

OP_DEFINITION(DISP) {
  ssz_t dispatched = ARG2A;
  int32_t base = sign_extend(ARG2B, 16, 32);

  ssz_t entry = bp[dispatched] + base;
  ip = add2ip(ip, entry);

  DISPATCH();
}

OP_DEFINITION(RETU) {
  frame_rv(bp) = 0;

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;

  DISPATCH();
}

OP_DEFINITION(RET) {
  ssz_t rv = ARG2A;

  frame_rv(bp) = bp[rv];

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;

  DISPATCH();
}

OP_DEFINITION(RETN) {
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

OP_DEFINITION(MOBJ) {
  ssz_t dst = ARG2A;
  ssz_t layout = ARG2B;

  if (unlikely(layout > state->numobject)) {
    MUSTTAIL return invalidlayout(ARGS);
  }

  NEXT_INSN(exta);
  ssz_t size = EXTRA_ARGU(exta);

  struct object *obj;
  PCALL(obj, alloc_object, size, state, bp);
  PCALL(obj->hd, object_make_header, state->descs[layout]);

  bp[dst] = ptr2val(obj);

  DISPATCH();
}

OP_DEFINITION(MCLOS) { MUSTTAIL return unimplemented(ARGS); }

OP_DEFINITION(SF) {
  ssz_t dst = ARG3A;
  ssz_t nth = ARG3B;
  ssz_t src = ARG3C;

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[bp[nth]] = bp[src];

  DISPATCH();
}

OP_DEFINITION(GF) {
  ssz_t src = ARG3A;
  ssz_t nth = ARG3B;
  ssz_t dst = ARG3C;

  struct object *obj = val2ptr(bp[src]);
  bp[dst] = obj->fields[bp[nth]];

  DISPATCH();
}

OP_DEFINITION(SFX) {
  ssz_t dst = ARG3A;
  ssz_t src = ARG3B;

  NEXT_INSN(exta);

  ssz_t nth = EXTRA_ARGU(exta);

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[nth] = bp[src];

  DISPATCH();
}

OP_DEFINITION(GFX) {
  ssz_t src = ARG3A;
  ssz_t dst = ARG3B;

  NEXT_INSN(exta);

  ssz_t nth = EXTRA_ARGU(exta);

  struct object *obj = val2ptr(bp[src]);
  bp[dst] = obj->fields[nth];

  DISPATCH();
}

OP_DEFINITION(SFXI8) {
  ssz_t dst = ARG3A;
  val_t val = ARG3B;

  NEXT_INSN(exta);

  ssz_t nth = EXTRA_ARGU(exta);

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[nth] = (val_t)sign_extend(val, 8, 64);

  DISPATCH();
}

OP_DEFINITION(SFXI16) {
  ssz_t dst = ARG2A;
  val_t val = ARG2B;

  NEXT_INSN(exta);

  ssz_t nth = EXTRA_ARGU(exta);

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[nth] = (val_t)sign_extend(val, 16, 64);

  DISPATCH();
}

#define OP_LP_DEF(name, type)                                                  \
  OP_DEFINITION(name) {                                                        \
    typedef type integer_t;                                                    \
    ssz_t src = ARG3A;                                                         \
    ssz_t off = ARG3B;                                                         \
    ssz_t dst = ARG3C;                                                         \
                                                                               \
    struct object *obj = val2ptr(bp[src]);                                     \
    ptrdiff_t offset = (ptrdiff_t)bp[off];                                     \
    bp[dst] = *(integer_t *)((uint8_t *)obj + offset);                         \
                                                                               \
    DISPATCH();                                                                \
  }

OP_LP_DEF(LP8, uint8_t)
OP_LP_DEF(LP16, uint16_t)
OP_LP_DEF(LP32, uint32_t)
OP_LP_DEF(LP64, uint64_t)

#define OP_SP_DEF(name, type)                                                  \
  OP_DEFINITION(name) {                                                        \
    typedef type integer_t;                                                    \
    ssz_t dst = ARG3A;                                                         \
    ssz_t off = ARG3B;                                                         \
    ssz_t src = ARG3C;                                                         \
                                                                               \
    struct object *obj = val2ptr(bp[dst]);                                     \
    ptrdiff_t offset = (ptrdiff_t)bp[off];                                     \
    *(integer_t *)((uint8_t *)obj + offset) = (integer_t)bp[src];              \
                                                                               \
    DISPATCH();                                                                \
  }

OP_SP_DEF(SP8, uint8_t)
OP_SP_DEF(SP16, uint16_t)
OP_SP_DEF(SP32, uint32_t)
OP_SP_DEF(SP64, uint64_t)

OP_DEFINITION(CSET) {
  cond_t cond = ARG3A;
  ssz_t o1 = ARG3B;
  ssz_t o2 = ARG3C;

  NEXT_INSN(exta);
  ssz_t dst = (uint8_t)EXTRA_ARG(exta);

  switch (cond) {
  case EQZ_64:
    bp[dst] = cast_u(bp[o1], 64) == 0;
    break;
  case EQZ_32:
    bp[dst] = cast_u(bp[o1], 32) == 0;
    break;
  case NEZ_64:
    bp[dst] = cast_u(bp[o1], 64) != 0;
    break;
  case NEZ_32:
    bp[dst] = cast_u(bp[o1], 32) != 0;
    break;
  case EQ_64:
    bp[dst] = cast_u(bp[o1], 64) == cast_u(bp[o2], 64);
    break;
  case NE_64:
    bp[dst] = cast_u(bp[o1], 64) != cast_u(bp[o2], 64);
    break;
  case LT_S64:
    bp[dst] = cast_s(bp[o1], 64) < cast_s(bp[o2], 64);
    break;
  case LE_S64:
    bp[dst] = cast_s(bp[o1], 64) <= cast_s(bp[o2], 64);
    break;
  case LT_U64:
    bp[dst] = cast_u(bp[o1], 64) < cast_u(bp[o2], 64);
    break;
  case LE_U64:
    bp[dst] = cast_u(bp[o1], 64) <= cast_u(bp[o2], 64);
    break;
  case EQ_32:
    bp[dst] = cast_u(bp[o1], 32) == cast_u(bp[o2], 32);
    break;
  case NE_32:
    bp[dst] = cast_u(bp[o1], 32) != cast_u(bp[o2], 32);
    break;
  case LT_S32:
    bp[dst] = cast_s(bp[o1], 32) < cast_s(bp[o2], 32);
    break;
  case LE_S32:
    bp[dst] = cast_s(bp[o1], 32) <= cast_s(bp[o2], 32);
    break;
  case LT_U32:
    bp[dst] = cast_u(bp[o1], 32) < cast_u(bp[o2], 32);
    break;
  case LE_U32:
    bp[dst] = cast_u(bp[o1], 32) <= cast_u(bp[o2], 32);
    break;
  case EQ_F64:
    bp[dst] = cast(bp[o1], double) == cast(bp[o2], double);
    break;
  case NE_F64:
    bp[dst] = cast(bp[o1], double) != cast(bp[o2], double);
    break;
  case LT_F64:
    bp[dst] = cast(bp[o1], double) < cast(bp[o2], double);
    break;
  case LE_F64:
    bp[dst] = cast(bp[o1], double) <= cast(bp[o2], double);
    break;
  default:
    MUSTTAIL return undefined(ARGS);
  }

  DISPATCH();
}

#define OP_CMPZ_DEF(name, cmp, width)                                          \
  OP_DEFINITION(name) {                                                        \
    ssz_t o1 = ARG2A;                                                          \
                                                                               \
    NEXT_INSN(next_insn);                                                      \
                                                                               \
    unsigned c = cast_u(bp[o1], width) cmp 0;                                  \
                                                                               \
    COND_NEXT_IP(c, next_insn);                                                \
                                                                               \
    DISPATCH();                                                                \
  }

OP_CMPZ_DEF(CEQZ64, ==, 64)
OP_CMPZ_DEF(CNEZ64, !=, 64)
OP_CMPZ_DEF(CEQZ32, ==, 32)
OP_CMPZ_DEF(CNEZ32, !=, 32)

#define OP_CMPI16_DEF(name, cast, ext, cmp)                                    \
  OP_DEFINITION(name) {                                                        \
    ssz_t o1 = ARG2A;                                                          \
                                                                               \
    NEXT_INSN(next_insn);                                                      \
                                                                               \
    unsigned c = cast(bp[o1], 64) cmp ext(ARG2B, 16, 64);                      \
                                                                               \
    COND_NEXT_IP(c, next_insn);                                                \
                                                                               \
    DISPATCH();                                                                \
  }

#define OP_CMPSI16_DEF(name, cmp) OP_CMPI16_DEF(name, cast_s, sign_extend, cmp)
#define OP_CMPUI16_DEF(name, cmp) OP_CMPI16_DEF(name, cast_u, zero_extend, cmp)

OP_CMPSI16_DEF(CEQSI16, ==)
OP_CMPSI16_DEF(CNESI16, !=)
OP_CMPSI16_DEF(CLTSI16, <)
OP_CMPSI16_DEF(CLESI16, <=)
OP_CMPSI16_DEF(CGTSI16, >)
OP_CMPSI16_DEF(CGESI16, >=)

OP_CMPUI16_DEF(CEQUI16, ==)
OP_CMPUI16_DEF(CNEUI16, !=)
OP_CMPUI16_DEF(CLTUI16, <)
OP_CMPUI16_DEF(CLEUI16, <=)
OP_CMPUI16_DEF(CGTUI16, >)
OP_CMPUI16_DEF(CGEUI16, >=)

#define OP_CMP_DEF(name, cmp, cast, width)                                     \
  OP_DEFINITION(name) {                                                        \
    ssz_t o1 = ARG3A;                                                          \
    ssz_t o2 = ARG3B;                                                          \
                                                                               \
    NEXT_INSN(next_insn);                                                      \
                                                                               \
    unsigned c = cast(bp[o1], width) cmp cast(bp[o2], width);                  \
                                                                               \
    COND_NEXT_IP(c, next_insn);                                                \
                                                                               \
    DISPATCH();                                                                \
  }

OP_CMP_DEF(CEQ64, ==, cast_u, 64)
OP_CMP_DEF(CNE64, !=, cast_u, 64)
OP_CMP_DEF(CLTU64, <, cast_u, 64)
OP_CMP_DEF(CLEU64, <=, cast_u, 64)
OP_CMP_DEF(CLTS64, <, cast_s, 64)
OP_CMP_DEF(CLES64, <=, cast_s, 64)

OP_CMP_DEF(CEQ32, ==, cast_u, 32)
OP_CMP_DEF(CNE32, !=, cast_u, 32)
OP_CMP_DEF(CLTU32, <, cast_u, 32)
OP_CMP_DEF(CLEU32, <=, cast_u, 32)
OP_CMP_DEF(CLTS32, <, cast_s, 32)
OP_CMP_DEF(CLES32, <=, cast_s, 32)

OP_DEFINITION(EXTEND) {
  ext_t ext = ARG3A;
  ssz_t src = ARG3B;
  ssz_t dst = ARG3C;

  switch (ext) {
  case SEXT_8_32:
    bp[dst] = sign_extend(bp[src], 8, 32);
    break;
  case SEXT_16_32:
    bp[dst] = sign_extend(bp[src], 16, 32);
    break;
  case SEXT_8_64:
    bp[dst] = sign_extend(bp[src], 8, 64);
    break;
  case SEXT_16_64:
    bp[dst] = sign_extend(bp[src], 16, 64);
    break;
  case SEXT_32_64:
    bp[dst] = sign_extend(bp[src], 32, 64);
    break;
  default:
    MUSTTAIL return undefined(ARGS);
  }

  DISPATCH();
}

OP_DEFINITION(WRAP) {
  wrap_t wrap = ARG3A;
  ssz_t src = ARG3B;
  ssz_t dst = ARG3C;

  switch (wrap) {
  case WRAP_8:
    bp[dst] = cast_u(bp[src], 8);
    break;
  case WRAP_16:
    bp[dst] = cast_u(bp[src], 16);
    break;
  case WRAP_32:
    bp[dst] = cast_u(bp[src], 32);
    break;
  default:
    MUSTTAIL return undefined(ARGS);
  }

  DISPATCH();
}

OP_DEFINITION(CTZ) {
  ctz_t ctz = ARG3A;
  ssz_t src = ARG3B;
  ssz_t dst = ARG3C;

  val_t x = bp[src];

  switch (ctz) {
  case CTZ_64:
    bp[dst] = x == 0 ? 64 : __builtin_ctzll(cast_u(x, 64));
    break;
  case CTZ_32:
    bp[dst] = x == 0 ? 32 : __builtin_ctz(cast_u(x, 32));
    break;
  case CTZ_16:
    bp[dst] = x == 0 ? 16 : __builtin_ctz(cast_u(x, 16));
    break;
  case CTZ_8:
    bp[dst] = x == 0 ? 8 : __builtin_ctz(cast_u(x, 8));
    break;
  default:
    MUSTTAIL return undefined(ARGS);
  }

  DISPATCH();
}

OP_DEFINITION(CLZ) {
  clz_t clz = ARG3A;
  ssz_t src = ARG3B;
  ssz_t dst = ARG3C;

  val_t x = bp[src];

  switch (clz) {
  case CLZ_64:
    bp[dst] = x == 0 ? 64 : __builtin_clzll(cast_u(x, 64));
    break;
  case CLZ_32:
    bp[dst] = x == 0 ? 32 : __builtin_clz(cast_u(x, 32));
    break;
  case CLZ_16:
    bp[dst] = x == 0 ? 16 : __builtin_clz(cast_u(x, 16));
    break;
  case CLZ_8:
    bp[dst] = x == 0 ? 8 : __builtin_clz(cast_u(x, 8));
    break;
  default:
    MUSTTAIL return undefined(ARGS);
  }

  DISPATCH();
}

OP_DEFINITION(POPCNT) {
  popcnt_t popcnt = ARG3A;
  ssz_t src = ARG3B;
  ssz_t dst = ARG3C;

  val_t x = bp[src];

  switch (popcnt) {
  case POPCNT_64:
    bp[dst] = __builtin_popcountll(cast_u(x, 64));
    break;
  case POPCNT_32:
    bp[dst] = __builtin_popcount(cast_u(x, 32));
    break;
  case POPCNT_16:
    bp[dst] = __builtin_popcount(cast_u(x, 16));
    break;
  case POPCNT_8:
    bp[dst] = __builtin_popcount(cast_u(x, 8));
    break;
  default:
    MUSTTAIL return undefined(ARGS);
  }

  DISPATCH();
}

#define OP_BITWISE_DEF(name, op1, op2, width)                                  \
  OP_DEFINITION(name) {                                                        \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t o2 = ARG3Z;                                                          \
                                                                               \
    bp[dst] = (op1 cast_u(bp[o1], width))op2 cast_u(bp[o2], width);            \
                                                                               \
    DISPATCH();                                                                \
  }

#define OP_SHIFT_DEF(name, op, cast, width)                                    \
  OP_DEFINITION(name) {                                                        \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t imm = ARG3Z;                                                         \
                                                                               \
    bp[dst] = cast(bp[o1], width) op imm;                                      \
                                                                               \
    DISPATCH();                                                                \
  }

#define OP_ROTATE_DEF(name, op1, op2, width)                                   \
  OP_DEFINITION(name) {                                                        \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t imm = ARG3Z;                                                         \
                                                                               \
    uint##width##_t operand = cast_u(bp[o1], width);                           \
    bp[dst] = (operand op1 imm) | (operand op2(width - imm));                  \
                                                                               \
    DISPATCH();                                                                \
  }

OP_BITWISE_DEF(AND64, , &, 64)
OP_BITWISE_DEF(OR64, , |, 64)
OP_BITWISE_DEF(XOR64, , ^, 64)
OP_BITWISE_DEF(NOTA64, ~, +, 64)
OP_SHIFT_DEF(SHL64, <<, cast_u, 64)
OP_SHIFT_DEF(SHRU64, >>, cast_u, 64)
OP_SHIFT_DEF(SHRS64, >>, cast_s, 64)
OP_ROTATE_DEF(ROTL64, <<, >>, 64)
OP_ROTATE_DEF(ROTR64, >>, <<, 64)

OP_BITWISE_DEF(AND32, , &, 32)
OP_BITWISE_DEF(OR32, , |, 32)
OP_BITWISE_DEF(XOR32, , ^, 32)
OP_BITWISE_DEF(NOTA32, ~, +, 32)
OP_SHIFT_DEF(SHL32, <<, cast_u, 32)
OP_SHIFT_DEF(SHRU32, >>, cast_u, 32)
OP_SHIFT_DEF(SHRS32, >>, cast_s, 32)
OP_ROTATE_DEF(ROTL32, <<, >>, 32)
OP_ROTATE_DEF(ROTR32, >>, <<, 32)

#define OP_ARITH_DEF(name, op, cast, width)                                    \
  OP_DEFINITION(name) {                                                        \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t o2 = ARG3Z;                                                          \
                                                                               \
    bp[dst] = cast(bp[o1], width) op cast(bp[o2], width);                      \
                                                                               \
    DISPATCH();                                                                \
  }

#define OP_DIV_DEF(name, cast, width)                                          \
  OP_DEFINITION(name) {                                                        \
    typedef int##width##_t itype;                                              \
    ssz_t dst = ARG3X;                                                         \
    ssz_t src1 = ARG3Y;                                                        \
    ssz_t src2 = ARG3Z;                                                        \
                                                                               \
    itype D = cast(bp[src1], width);                                           \
    itype d = cast(bp[src2], width);                                           \
    itype q = D / d;                                                           \
    itype r = D % d;                                                           \
    if (sgn(d) + sgn(r) == 0) {                                                \
      q -= 1;                                                                  \
    }                                                                          \
                                                                               \
    bp[dst] = q;                                                               \
                                                                               \
    DISPATCH();                                                                \
  }

#define OP_REM_DEF(name, cast, width)                                          \
  OP_DEFINITION(name) {                                                        \
    typedef int##width##_t itype;                                              \
    ssz_t dst = ARG3X;                                                         \
    ssz_t src1 = ARG3Y;                                                        \
    ssz_t src2 = ARG3Z;                                                        \
                                                                               \
    itype D = cast(bp[src1], width);                                           \
    itype d = cast(bp[src2], width);                                           \
    itype r = D % d;                                                           \
    if (sgn(d) + sgn(r) == 0) {                                                \
      r += d;                                                                  \
    }                                                                          \
                                                                               \
    bp[dst] = r;                                                               \
                                                                               \
    DISPATCH();                                                                \
  }

#define OP_DIR_DEF(name, cast, width)                                          \
  OP_DEFINITION(name) {                                                        \
    typedef int##width##_t itype;                                              \
    ssz_t dst = ARG3X;                                                         \
    ssz_t src1 = ARG3Y;                                                        \
    ssz_t src2 = ARG3Z;                                                        \
                                                                               \
    itype D = cast(bp[src1], width);                                           \
    itype d = cast(bp[src2], width);                                           \
    itype q = D / d;                                                           \
    itype r = D % d;                                                           \
    if (sgn(d) + sgn(r) == 0) {                                                \
      r += d;                                                                  \
      q -= 1;                                                                  \
    }                                                                          \
                                                                               \
    bp[dst] = q;                                                               \
    bp[dst + 1] = r;                                                           \
                                                                               \
    DISPATCH();                                                                \
  }

OP_ARITH_DEF(ADD64, +, cast_u, 64)
OP_ARITH_DEF(SUB64, -, cast_u, 64)
OP_ARITH_DEF(MUL64, *, cast_u, 64)

OP_DEFINITION(MUHS64) {
  ssz_t dst = ARG3X;
  ssz_t src1 = ARG3Y;
  ssz_t src2 = ARG3Z;

  typedef __int128 int128_t;

  int128_t x = cast_s(bp[src1], 64);
  int128_t y = cast_s(bp[src2], 64);
  int128_t p = x * y;

  bp[dst] = (val_t)(p >> 64);

  DISPATCH();
}

OP_DEFINITION(MUHU64) {
  ssz_t dst = ARG3X;
  ssz_t src1 = ARG3Y;
  ssz_t src2 = ARG3Z;

  typedef __uint128_t uint128_t;

  uint128_t x = cast_u(bp[src1], 64);
  uint128_t y = cast_u(bp[src2], 64);
  uint128_t p = x * y;

  bp[dst] = (val_t)(p >> 64);

  DISPATCH();
}

OP_DIV_DEF(DIVS64, cast_s, 64)
OP_DIV_DEF(DIVU64, cast_u, 64)
OP_REM_DEF(REMS64, cast_s, 64)
OP_REM_DEF(REMU64, cast_u, 64)
OP_DIR_DEF(DIRS64, cast_s, 64)
OP_DIR_DEF(DIRU64, cast_u, 64)

OP_ARITH_DEF(ADD32, +, cast_u, 32)
OP_ARITH_DEF(SUB32, -, cast_u, 32)
OP_ARITH_DEF(MUL32, *, cast_u, 32)

OP_DEFINITION(MUHS32) {
  ssz_t dst = ARG3X;
  ssz_t src1 = ARG3Y;
  ssz_t src2 = ARG3Z;

  int64_t x = cast_s(bp[src1], 32);
  int64_t y = cast_s(bp[src2], 32);
  int64_t p = x * y;

  bp[dst] = (val_t)(p >> 32);

  DISPATCH();
}

OP_DEFINITION(MUHU32) {
  ssz_t dst = ARG3X;
  ssz_t src1 = ARG3Y;
  ssz_t src2 = ARG3Z;

  uint64_t x = cast_u(bp[src1], 32);
  uint64_t y = cast_u(bp[src2], 32);
  uint64_t p = x * y;

  bp[dst] = (val_t)(p >> 32);

  DISPATCH();
}

OP_DIV_DEF(DIVS32, cast_s, 32)
OP_DIV_DEF(DIVU32, cast_u, 32)
OP_REM_DEF(REMS32, cast_s, 32)
OP_REM_DEF(REMU32, cast_u, 32)
OP_DIR_DEF(DIRS32, cast_s, 32)
OP_DIR_DEF(DIRU32, cast_u, 32)

#define OP_ARITHI_DEF(name, op, cast, width)                                   \
  OP_DEFINITION(name) {                                                        \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t imm = ARG3Z;                                                         \
                                                                               \
    bp[dst] = cast(bp[o1], width) op cast(imm, width);                         \
                                                                               \
    DISPATCH();                                                                \
  }

OP_ARITHI_DEF(ADD64I, +, cast_u, 64)
OP_ARITHI_DEF(SUB64I, -, cast_u, 64)
OP_ARITHI_DEF(MUL64I, *, cast_u, 64)

OP_ARITHI_DEF(ADD32I, +, cast_u, 32)
OP_ARITHI_DEF(SUB32I, -, cast_u, 32)
OP_ARITHI_DEF(MUL32I, *, cast_u, 32)

#define OP_MINMAX_DEF(name, op, cast, width)                                   \
  OP_DEFINITION(name) {                                                        \
    ssz_t dst = ARG3X;                                                         \
    ssz_t o1 = ARG3Y;                                                          \
    ssz_t o2 = ARG3Z;                                                          \
                                                                               \
    bool cond = cast(bp[o1], width) op cast(bp[o2], width);                    \
                                                                               \
    bp[dst] = cond ? bp[o1] : bp[o2];                                          \
                                                                               \
    DISPATCH();                                                                \
  }

OP_MINMAX_DEF(MAXS64, >, cast_s, 64)
OP_MINMAX_DEF(MAXU64, >, cast_u, 64)
OP_MINMAX_DEF(MINS64, <, cast_s, 64)
OP_MINMAX_DEF(MINU64, <, cast_u, 64)

OP_MINMAX_DEF(MAXS32, >, cast_s, 32)
OP_MINMAX_DEF(MAXU32, >, cast_u, 32)
OP_MINMAX_DEF(MINS32, <, cast_s, 32)
OP_MINMAX_DEF(MINU32, <, cast_u, 32)

static opthread *const dispatch[] = {
#define OPIMPLS(op, mnemonic, name, n) vm_op_##op,
    OPS(OPIMPLS)
#undef OPIMPLS
};
