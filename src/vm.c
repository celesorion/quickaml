#include "vm.h"
/*
let rec fib =
  fun n ->
   if n < 1 then 1
   else fib (n - 1) + fib (n - 2)

 
F1:
0001  CLOS    #0, F2, 0
0002  OSET    #0，2, #0
0003  CONST   #1, 10
0004  APPLY   #0, #0, 2

F2:
0001  CMPLT   #1, 1
0002  JUMPN   +3 => 0005

0003  CONST   #2, 1
0004  RET     #2

0005  OGET    #2, #0, 1
0006  SUB     #3, #1, 1
0007  APPLY   #2, #2, 2
0008  OGET    #3, #0, 1
0009  SUB     #4, #1, 2
0010  APPLY   #3, #3, 2 
0011  ADD     #1, #2, #3
0012  RET     #1

*/

// [RBX, RCX, RSI, RDI, RBP, R12, R13, R14, R8, R9, R15, RAX, RDX, R10, R11]
// ('PARAMS="bc_t *ip, int32_t a2sb, bc_t insn, uint8_t a3a, val_t *bp, val_t *sp, void *dispatch" ARGS="ip, a2sb, insn, a3a, bp, sp, dispatch"', 509)



#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>

#define THREADED [[gnu::noinline, clang::qkcc]] static
#define INLINE [[gnu::always_inline]] static
#define MUSTTAIL [[clang::musttail]]
#define DP(dp, op) (*(((opthread **)(dp))[op]))

#ifndef EXTPA
#define PARAMS bc_t *ip, int32_t a2sb, bc_t insn, uint8_t a3a, val_t *bp, val_t *sp, void *dispatch, struct vm_fn *fns[]
#define ARGS ip, a2sb, insn, a3a, bp, sp, dispatch, fns
#endif
#define DISPATCH() MUSTTAIL return DP(dispatch, op)(ARGS)
#define NONTAILDISPATCH() DP(dispatch, op)(ARGS)
#define FETCH_DECODE() \
  insn = *ip++;           \
  op_t op = opcode(insn); \
  a3a = arg3A(insn);      \
  a2sb = arg2sB(insn)

[[clang::qkcc]] typedef void opthread(PARAMS);

THREADED void vm_op_NOP(PARAMS) {

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_STOPii(PARAMS) {
  (void) dispatch;  (void) ip; (void) sp;
  (void) a3a; (void) a2sb;
  (void) fns;

  ssz_t i1 = arg2A(insn);
  ssz_t i2 = arg2B(insn);
  
  for (ssz_t i = i1; i < i2; i++)
    printf("slot[%u] 0x%lx\n", i, bp[i]);  

  return;
}

THREADED void vm_op_CMPLTli(PARAMS) {
  ssz_t src = a3a;
  int32_t imm = a2sb; 
 
  bc_t next_insn = *ip;
  op_t jop = opcode(next_insn);

  unsigned lt = (int64_t)bp[src] < imm;
  unsigned neg = jop == JUMPNj;
  unsigned jump = lt ^ neg;  

  ip += jump ? arg2sB(next_insn) : 1;

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_ADDlli(PARAMS) {
  ssz_t dst = a3a; 
  ssz_t src1 = arg3B2sB(a2sb);
  ssz_t imm = arg3C2sB(a2sb);

  bp[dst] = bp[src1] + imm;

  FETCH_DECODE();
  
  DISPATCH();
}

THREADED void vm_op_SUBlli(PARAMS) {
  ssz_t dst = a3a; 
  ssz_t src1 = arg3B2sB(a2sb);
  ssz_t imm = arg3C2sB(a2sb);

  bp[dst] = bp[src1] - imm;

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_ADDlll(PARAMS) {
  ssz_t dst = a3a;
  ssz_t src1 = arg3B2sB(a2sb);
  ssz_t src2 = arg3C2sB(a2sb);

  bp[dst] = bp[src1] + bp[src2];

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_SUBlll(PARAMS) {
  ssz_t dst = a3a;
  ssz_t src1 = arg3B2sB(a2sb);
  ssz_t src2 = arg3C2sB(a2sb);

  bp[dst] = bp[src1] - bp[src2];

  FETCH_DECODE();
  
  DISPATCH();
}

THREADED void vm_op_CONSTli(PARAMS) {
  ssz_t dst = a3a;
  int32_t imm = a2sb;
  
  bp[dst] = (uint64_t)imm;

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_CLOSkxi(PARAMS) {
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

THREADED void vm_op_APPLYpki(PARAMS) {
  ssz_t dst = a3a;
  ssz_t iclos = arg3B2sB(a2sb);
  ssz_t nargs = arg3C2sB(a2sb);

  struct closure *clos = val2ptr(bp[iclos]);    
  struct vm_fn *fn = val2ptr(clos->fp);

  val_t *old_bp = bp;
  bp = next_bp(sp);
  sp += fn->framesz;

  frame_link(bp) = ptr2val(old_bp);
  frame_rv(bp) = ptr2val(old_bp + dst);
  frame_ra(bp) = ptr2val(ip);

  for (ssz_t i = 0; i < nargs; i++)
    bp[i] = old_bp[iclos + i];

  ip = fn->ops;

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_CALLpxi(PARAMS) {
  ssz_t dst = a3a;
  ssz_t fx = arg3B2sB(a2sb);
  ssz_t nargs = arg3C2sB(a2sb);

  struct vm_fn *fn = val2ptr(fns[fx]);

  val_t *old_bp = bp;
  bp = next_bp(sp);
  sp += fn->framesz;

  frame_link(bp) = ptr2val(old_bp);
  frame_rv(bp) = ptr2val(old_bp + dst);
  frame_ra(bp) = ptr2val(ip);

  for (ssz_t i = 0; i < nargs; i++)
    bp[i] = old_bp[dst + i];

  ip = fn->ops;

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_OSETpip(PARAMS) {
  ssz_t dst = a3a;
  ssz_t imm = arg3B2sB(a2sb);
  ssz_t src = arg3C2sB(a2sb);

  struct object *obj = val2ptr(bp[dst]);
  obj->fields[imm] = bp[src];

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_OGETppi(PARAMS) {
  ssz_t dst = a3a;
  ssz_t src = arg3B2sB(a2sb);
  ssz_t imm = arg3C2sB(a2sb);

  struct object *obj = val2ptr(bp[src]);
  bp[dst] = obj->fields[imm];

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_JUMPj(PARAMS) {
  (void) a3a;
  int32_t target = a2sb;
  
  ip = add2ip(ip, target);

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_JUMPNj(PARAMS) {
  (void) a3a;
  int32_t target = a2sb;
  
  ip = add2ip(ip, target);

  FETCH_DECODE();

  DISPATCH();
}

THREADED void vm_op_RETp(PARAMS) {
  (void) a2sb;
  ssz_t rv = a3a;
  
  *(val_t*)val2ptr(frame_rv(bp)) = bp[rv];
  
  ip = val2ptr(frame_ra(bp));
  
  sp = prev_sp(bp);
  bp = val2ptr(frame_link(bp)); 

  FETCH_DECODE();
  
  DISPATCH();
}

static opthread *dispatch[] = {
  vm_op_NOP, 
  vm_op_STOPii,
  vm_op_CMPLTli,
  vm_op_ADDlli,
  vm_op_SUBlli,
  vm_op_ADDlll,
  vm_op_SUBlll,
  vm_op_CONSTli,
  vm_op_CLOSkxi,
  vm_op_APPLYpki,
  vm_op_CALLpxi,
  vm_op_OSETpip,
  vm_op_OGETppi,  
  vm_op_JUMPj,
  vm_op_JUMPNj,
  vm_op_RETp,
};

int vm_exec(struct vm_state *state) {
  bc_t *ip = state->entry->ops;
  val_t *bp = next_bp(state->stk);
  val_t *sp = state->stk+state->entry->framesz;
  bc_t insn = *ip++;
  op_t op = opcode(insn);
  uint8_t a3a = arg3A(insn);
  int32_t a2sb = arg2sB(insn);
  struct vm_fn **fns = state->fns;

  NONTAILDISPATCH();
  return 0;
}

int main() {
  struct vm_state vs;

  struct vm_fn *f1 = malloc(10000);
  f1->framesz = 5; // 3 + fib + arg0 
  f1->ops[0] = make3ABC(CLOSkxi, 0, 1, 1);
  f1->ops[1] = make3ABC(OSETpip, 0, 2, 0);
  f1->ops[2] = make2AB(CONSTli, 1, 40);
  f1->ops[3] = make3ABC(APPLYpki, 0, 0, 2);
  f1->ops[4] = make3ABC(STOPii, 0, 2, 0);

  struct vm_fn *f2 = malloc(10000);
  f2->framesz = 8; 
  f2->ops[0] = make2AB(CMPLTli, 1, 2);
  f2->ops[1] = make2B(JUMPNj, 3);

  f2->ops[2] = make2AB(CONSTli, 2, 1);
  f2->ops[3] = make2A(RETp, 2);

  f2->ops[4] = make3ABC(OGETppi, 2, 0, 2);
  f2->ops[5] = make3ABC(SUBlli, 3, 1, 1);
  f2->ops[6] = make3ABC(APPLYpki, 2, 2, 2);
  f2->ops[7] = make3ABC(OGETppi, 3, 0, 2);
  f2->ops[8] = make3ABC(SUBlli, 4, 1, 2);
  f2->ops[9] = make3ABC(APPLYpki, 3, 3, 2);
  f2->ops[10]= make3ABC(ADDlll, 1, 2, 3);
  f2->ops[11]= make2A(RETp, 1);

  struct vm_fn *f3 = malloc(10000);
  f3->framesz = 4; // 3 + arg0 
  f3->ops[0] = make2AB(CONSTli, 0, 40);
  f3->ops[1] = make3ABC(CALLpxi, 0, 3, 1);
  f3->ops[2] = make3ABC(STOPii, 0, 1, 0);

  struct vm_fn *f4 = malloc(10000);
  f4->framesz = 6; 
  f4->ops[0] = make2AB(CMPLTli, 0, 2);
  f4->ops[1] = make2B(JUMPNj, 3);

  f4->ops[2] = make2AB(CONSTli, 2, 1);
  f4->ops[3] = make2A(RETp, 2);

  f4->ops[4] = make3ABC(SUBlli, 1, 0, 1);
  f4->ops[5] = make3ABC(CALLpxi, 1, 3, 1);
  f4->ops[6] = make3ABC(SUBlli, 2, 0, 2);
  f4->ops[7] = make3ABC(CALLpxi, 2, 3, 1);
  f4->ops[8]= make3ABC(ADDlll, 1, 1, 2);
  f4->ops[9]= make2A(RETp, 1);
  struct vm_fn *fns[] = {f1, f2, f3, f4};

  vs.entry = f3;
  vs.fns = fns;
  vs.stk = malloc(1000000);

  vm_exec(&vs);
}

