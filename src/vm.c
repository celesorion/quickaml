#include "vm.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>

#define THREADED [[gnu::noinline, clang::qkcc, gnu::aligned(64)]] static
#define INLINE [[gnu::always_inline]] static
#define MUSTTAIL [[clang::musttail]]
#define DP(dp, op) (*(((opthread *const *)(dp))[op]))

#ifndef EXTPA
#define PARAMS bc_t *restrict ip, int32_t a2sb, uint8_t a3a, val_t *restrict bp, val_t *restrict ctbl, const void *restrict dispatch, struct function *restrict fns[]
#define ARGS ip, a2sb, a3a, bp, ctbl, dispatch, fns
#endif
#define DISPATCH() MUSTTAIL return DP(dispatch, op)(ARGS)
#define NONTAILDISPATCH() DP(dispatch, op)(ARGS)

#define FETCH_DECODE() \
  bc_t insn = *ip++;      \
  op_t op = opcode(insn); \
  a3a = arg3A(insn);      \
  a2sb = arg2sB(insn)

#define COND_NEXT_IP_CMOV(c) \
  ip += c ? 0 : arg2sB(next_insn)

#define COND_NEXT_IP_BR(c) \
  if (!c) ip += arg2sB(next_insn)

#define COND_NEXT_IP COND_NEXT_IP_BR

#define OP_DEFINITION(name) THREADED void vm_op_##name(PARAMS)

[[clang::qkcc]] typedef void opthread(PARAMS);

#define LT <
#define LE <=
#define GT >
#define GE >=
#define EQ ==
#define NE !=
#define ADD +
#define SUB -
#define MUL *
#define DIV /
#define REM %

OP_DEFINITION(NOP) {

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(STOPii) {
  (void) dispatch;  (void) ip;
  (void) fns; (void) ctbl;

  ssz_t i1 = a3a;
  ssz_t i2 = arg2B2sB(a2sb);
  
  for (ssz_t i = i1; i < i2; i++)
    printf("slot[%u] 0x%lx\n", i, bp[i]);  

  return;
}

#define OP_CMPll_DEF(name, cmp) \
OP_DEFINITION(name) {                     \
  ssz_t o1 = a3a;                         \
  ssz_t o2 = arg3B2sB(a2sb);              \
                                          \
  bc_t next_insn = *ip++;                 \
                                          \
  unsigned c =                            \
    (int64_t)bp[o1] cmp (int64_t)bp[o2];  \
                                          \
  COND_NEXT_IP(c);                        \
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
  ssz_t o1 = a3a;                         \
  int32_t imm = a2sb;                     \
                                          \
  bc_t next_insn = *ip++;                 \
                                          \
  unsigned c = (int64_t)bp[o1] cmp imm;   \
                                          \
  COND_NEXT_IP(c);                        \
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
  ssz_t o1 = a3a;                         \
  int32_t cidx = a2sb;                    \
                                          \
  bc_t next_insn = *ip++;                 \
                                          \
  unsigned c = (int64_t)bp[o1]            \
    cmp (int64_t)ctbl[cidx];              \
                                          \
  COND_NEXT_IP(c);                        \
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


#define OP_ARITHlli_DEF(name, arith) \
OP_DEFINITION(name) {                     \
  ssz_t dst = a3a;                        \
  ssz_t src1 = arg3B2sB(a2sb);            \
  ssz_t imm = arg3C2sB(a2sb);             \
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
OP_ARITHlli_DEF(DIVlli, DIV)
OP_ARITHlli_DEF(REMlli, REM)

#undef OP_ARITHlli_DEF

#define OP_ARITHlll_DEF(name, arith) \
OP_DEFINITION(name) {                     \
  ssz_t dst = a3a;                        \
  ssz_t src1 = arg3B2sB(a2sb);            \
  ssz_t src2 = arg3C2sB(a2sb);            \
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
OP_ARITHlll_DEF(DIVlll, DIV)
OP_ARITHlll_DEF(REMlll, REM)

#undef OP_ARITHlll_DEF

OP_DEFINITION(CONSTli) {
  ssz_t dst = a3a;
  int32_t imm = a2sb;
  
  bp[dst] = (uint64_t)imm;

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(CLOSkxi) {
  ssz_t dst = a3a;
  ssz_t fx = arg3B2sB(a2sb);
  ssz_t imm = arg3C2sB(a2sb);
 
  size_t n = closure_size(imm);
  struct closure *clos = malloc(n);
  
  clos->fp = ptr2val(fns[fx]);
  clos->args = ptr2val(nullptr);

  bp[dst] = ptr2val(clos);

  FETCH_DECODE();

  DISPATCH(); 
}

OP_DEFINITION(APPLYpi) {
  ssz_t iclos = a3a;
  ssz_t nargs = a2sb;

  (void) nargs;

  struct closure *clos = val2ptr(bp[iclos]);    
  struct function *fn = val2ptr(clos->fp);

  bp = next_bp(bp, iclos);
  frame_ra(bp) = ptr2val(ip);

  // copy closure to the first slot as arg0
  bp[0] = ptr2val(clos); 

  ip = fn->ops;

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(CALLpxi) {
  ssz_t fx = arg3B2sB(a2sb);
  ssz_t dst = a3a;
  ssz_t nargs = arg3C2sB(a2sb);

  (void) nargs;
  struct function *fn = val2ptr(fns[fx]);

  bc_t *oldip = ip;
  ip = fn->ops;

  bp = next_bp(bp, dst);
  frame_ra(bp) = ptr2val(oldip);

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(OSETpip) {
  ssz_t dst = a3a;
  ssz_t imm = arg3B2sB(a2sb);
  ssz_t src = arg3C2sB(a2sb);

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[imm] = bp[src];

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(OGETppi) {
  ssz_t dst = a3a;
  ssz_t src = arg3B2sB(a2sb);
  ssz_t imm = arg3C2sB(a2sb);

  struct object *obj = val2ptr(bp[src]);
  bp[dst] = obj->fields[imm];

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(CLOSGETpi) {
  ssz_t dst = a3a;
  ssz_t imm = arg2B2sB(a2sb);

  struct object *obj = val2ptr(bp[0]);
  bp[dst] = obj->fields[imm];

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(JUMPj) {
  (void) a3a;
  int32_t target = a2sb;
  
  ip = add2ip(ip, target);

  FETCH_DECODE();

  DISPATCH();
}

OP_DEFINITION(RETp) {
  (void) a2sb;
  ssz_t rv = a3a;
  
  frame_rv(bp) = bp[rv];

  bc_t *ra = val2ptr(frame_ra(bp));
  bc_t prev_insn = ra[-1];
  ssz_t fo = arg3A(prev_insn);

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

int vm_exec(struct state *state) {
  bc_t *ip = state->entry->ops;
  val_t *bp = state->stk;
  bc_t insn = *ip++;
  op_t op = opcode(insn);
  uint8_t a3a = arg3A(insn);
  int32_t a2sb = arg2sB(insn);
  val_t *ctbl = nullptr;
  struct function **fns = state->fns;

  NONTAILDISPATCH();
  return 0;
}

#include "bc_parse.h"

#ifdef DEBUG
#include "utest/utest.h"
UTEST_STATE();
#endif

int main(int argc, const char *const argv[]) {
#ifdef DEBUG
  // return utest_main(argc, argv);
#endif

  struct state st;

  if (argc <= 1)
    return 1;
  
  FILE *fp = fopen(argv[1], "rb");

  int r = bc_parse(fp, &st);
  if (r != S_OK) return r;

  return vm_exec(&st);
}

