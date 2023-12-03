#include "bc.h"
#include "obj.h"
#include "vm.h"
#include "alloc.h"

#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <inttypes.h>

static opthread *const dispatch[];

[[gnu::noinline]]
int vm_entry(struct state *state) {
  bc_t *ip = state->entry->ops;
  val_t *bp = next_bp(state->stk, 3);
  frame_ra(bp) = 0;
  frame_desc(bp) = (val_t)state->entry->desc;
  struct function **fns = state->fns;
  
  [[maybe_unused]] uint8_t a3a, a3b, a3c;
  [[maybe_unused]] int32_t a2sb;
  FETCH_DECODE();

  NONTAILDISPATCH();
  return 0;
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

INLINE
int sgn(val_t x) {
  return (x > (val_t)0) - (x < (val_t)0);
}

OP_DEFINITION(NOP) {

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(STOPii) {
  ssz_t i1 = ARG2A;
  ssz_t i2 = ARG2B;
  
  for (ssz_t i = i1; i < i2; i++) {
    [[maybe_unused]] int r;
    PCALL(r, printf, ("slot[%u] 0x%" PRIx64 "\n"), i, bp[i]);
  }

  return;
}

#define OP_CMPll_DEF(name, cmp) \
OP_DEFINITION(name) {                     \
  ssz_t o1 = ARG3A;                       \
  ssz_t o2 = ARG3B;                       \
                                          \
  COND_NEXT_INSN(next_insn);              \
                                          \
  unsigned c =                            \
    (int64_t)bp[o1] cmp (int64_t)bp[o2];  \
                                          \
  COND_NEXT_IP(c, next_insn);             \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_CMPll_DEF(CMPLTll, LT)
OP_CMPll_DEF(CMPLEll, LE)
OP_CMPll_DEF(CMPEQll, EQ)
OP_CMPll_DEF(CMPNEll, NE)

#undef OP_CMPll_DEF

#define OP_CMPli_DEF(name, cmp) \
OP_DEFINITION(name) {                     \
  ssz_t o1 = ARG2A;                       \
  int32_t imm = ARG2sB;                   \
                                          \
  COND_NEXT_INSN(next_insn);              \
                                          \
  unsigned c = (int64_t)bp[o1] cmp imm;   \
                                          \
  COND_NEXT_IP(c, next_insn);             \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_CMPli_DEF(CMPLTli, LT)
OP_CMPli_DEF(CMPLEli, LE)
OP_CMPli_DEF(CMPGTli, GT)
OP_CMPli_DEF(CMPGEli, GE)
OP_CMPli_DEF(CMPEQli, EQ)
OP_CMPli_DEF(CMPNEli, NE)

#undef OP_CMPli_DEF

#define OP_CMPlc_DEF(name, cmp) \
OP_DEFINITION(name) {                     \
  ssz_t o1 = ARG2A;                       \
  int32_t cidx = ARG2sB;                  \
                                          \
  val_t *ctbl = state->ctbl;              \
  COND_NEXT_INSN(next_insn);              \
                                          \
  unsigned c = (int64_t)bp[o1]            \
    cmp (int64_t)ctbl[cidx];              \
                                          \
  COND_NEXT_IP(c, next_insn);             \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_CMPlc_DEF(CMPLTlc, LT)
OP_CMPlc_DEF(CMPLElc, LE)
OP_CMPlc_DEF(CMPGTlc, GT)
OP_CMPlc_DEF(CMPGElc, GE)
OP_CMPlc_DEF(CMPEQlc, EQ)
OP_CMPlc_DEF(CMPNElc, NE)


#define OP_ARITHlli_DEF(name, arith)      \
OP_DEFINITION(name) {                     \
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t imm = ARG3Z;                      \
                                          \
  bp[dst] = bp[src1] arith imm;           \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_ARITHlli_DEF(ADDlli, ADD)
OP_ARITHlli_DEF(SUBlli, SUB)
OP_ARITHlli_DEF(MULlli, MUL)

#undef OP_ARITHlli_DEF

OP_DEFINITION(DIVlli) {
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t imm = ARG3Z;                      \
                                          \
  val_t D  = bp[src1];                    \
  val_t d  = imm;                         \
  val_t q  = D / d;                       \
  val_t r  = D % d;                       \
  if (sgn(d) + sgn(r) == 0) {             \
    q -= 1;                               \
  }                                       \
                                          \
  bp[dst] = q;                            \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_DEFINITION(REMlli) {
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t imm = ARG3Z;                      \
                                          \
  val_t D  = bp[src1];                    \
  val_t d  = imm;                         \
  val_t r  = D % d;                       \
  if (sgn(d) + sgn(r) == 0) {             \
    r += d;                               \
  }                                       \
                                          \
  bp[dst] = r;                            \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_DEFINITION(DIRlli) {
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t imm = ARG3Z;                      \
                                          \
  val_t D  = bp[src1];                    \
  val_t d  = imm;                         \
  val_t q  = D / d;                       \
  val_t r  = D % d;                       \
  if (sgn(d) + sgn(r) == 0) {             \
    r += d;                               \
    q -= 1;                               \
  }                                       \
                                          \
  bp[dst] = q;                            \
  bp[dst+1] = r;                          \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

#define OP_ARITHlll_DEF(name, arith) \
OP_DEFINITION(name) {                     \
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t src2 = ARG3Z;                     \
                                          \
  bp[dst] = bp[src1] arith bp[src2];      \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_ARITHlll_DEF(ADDlll, ADD)
OP_ARITHlll_DEF(SUBlll, SUB)
OP_ARITHlll_DEF(MULlll, MUL)

#undef OP_ARITHlll_DEF

OP_DEFINITION(DIVlll) {
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t src2 = ARG3Z;                     \
                                          \
  val_t D  = bp[src1];                    \
  val_t d  = bp[src2];                    \
  val_t q  = D / d;                       \
  val_t r  = D % d;                       \
  if (sgn(d) + sgn(r) == 0) {             \
    q -= 1;                               \
  }                                       \
                                          \
  bp[dst] = q;                            \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_DEFINITION(REMlll) {
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t src2 = ARG3Z;                     \
                                          \
  val_t D  = bp[src1];                    \
  val_t d  = bp[src2];                    \
  val_t r  = D % d;                       \
  if (sgn(d) + sgn(r) == 0) {             \
    r += d;                               \
  }                                       \
                                          \
  bp[dst] = r;                            \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_DEFINITION(DIRlll) {
  ssz_t dst = ARG3X;                      \
  ssz_t src1 = ARG3Y;                     \
  ssz_t src2 = ARG3Z;                     \
                                          \
  val_t D  = bp[src1];                    \
  val_t d  = bp[src2];                    \
  val_t q  = D / d;                       \
  val_t r  = D % d;                       \
  if (sgn(d) + sgn(r) == 0) {             \
    r += d;                               \
    q -= 1;                               \
  }                                       \
                                          \
  bp[dst] = q;                            \
  bp[dst+1] = r;                          \
                                          \
  FETCH_DECODE();                         \
                                          \
  DISPATCH();                             \
}

OP_DEFINITION(CONSTli) {
  ssz_t dst = ARG2A;
  int32_t imm = ARG2sB;
  
  bp[dst] = (uint64_t)imm;

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(CLOSkxi) {
  ssz_t dst = ARG3A;
  ssz_t fx = ARG3B;
  ssz_t imm = ARG3C;
 
  size_t n = closure_size(imm);
  struct closure *clos;
  PCALL(clos, simple_malloc, n, &frame_desc(bp));
  
  clos->fp = ptr2val(fns[fx]);
  clos->args = ptr2val(nullptr);

  bp[dst] = ptr2val(clos);

  FETCH_DECODE();

  DISPATCH(); 
}

OP_DEFINITION(APPLYpi) {
  ssz_t iclos = ARG2A;
  ssz_t nargs = ARG2sB;

  (void) nargs;

  struct closure *clos = val2ptr(bp[iclos]);    
  struct function *fn = val2ptr(clos->fp);

  bc_t *oldip = ip;
  ip = fn->ops;

  bp = next_bp(bp, iclos);
  if (unlikely(bp >= state->stklimit)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_ra(bp) = ptr2val(oldip);

  // copy closure to the first slot as arg 0
  bp[0] = ptr2val(clos); 

  ip = fn->ops;

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(CALLpxi) {
  ssz_t dst = ARG3A;
  ssz_t fx = ARG3B;
  ssz_t nargs = ARG3C;

  (void) nargs;
  struct function *fn = val2ptr(fns[fx]);

  bc_t *oldip = ip;
  ip = fn->ops;

  bp = next_bp(bp, dst);
  if (unlikely(bp >= state->stklimit)) {
    MUSTTAIL return stackoverflow(ARGS);
  }

  frame_ra(bp) = ptr2val(oldip);

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(OSETpip) {
  ssz_t dst = ARG3A;
  ssz_t imm = ARG3B;
  ssz_t src = ARG3C;

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[imm] = bp[src];

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(OGETppi) {
  ssz_t dst = ARG3A;
  ssz_t src = ARG3B;
  ssz_t imm = ARG3C;

  struct object *obj = val2ptr(bp[src]);
  bp[dst] = obj->fields[imm];

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(CLOSGETpi) {
  ssz_t dst = ARG2A;
  ssz_t imm = ARG2sB;

  struct object *obj = val2ptr(bp[0]);
  bp[dst] = obj->fields[imm];

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(JUMPj) {
  int32_t target = ARG2sB;
  
  ip = add2ip(ip, target);

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(RETp) {
  ssz_t rv = ARG3A;
  
  frame_rv(bp) = bp[rv];

  bc_t *ra = val2ptr(frame_ra(bp));

  GET_FO(fo);

  bp = prev_bp(bp, fo);
  ip = ra;

  FETCH_DECODE();
  
  DISPATCH();
}

static opthread *const dispatch[] = {
#define OPIMPLS(op, name, n, a1, a2, a3) vm_op_##op,
OPS(OPIMPLS)
#undef OPIMPLS
};

