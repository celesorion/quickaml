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
    // TODO: print
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

  bp[dst] = ptr2val(obj);

  DISPATCH();
}

OP_DEFINITION(MCLOS) { MUSTTAIL return unimplemented(ARGS); }

static opthread *const dispatch[] = {
#define OPIMPLS(op, mnemonic, name, n) vm_op_##op,
    OPS(OPIMPLS)
#undef OPIMPLS
};
