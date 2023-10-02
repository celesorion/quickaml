#ifndef QK_BC_H
#define QK_BC_H

enum {
  N,
  I,
  J,
  A,
  F,
  L,
  C,
  P,
  X,
  K, 
};

#define OPS(_) \
  _(NOP,        "nop",  0, N, N, N) \
  _(STOPii,     "stop.ll",   2, I, I, N) \
  \
  _(CMPLTll,    "cmplt.ll",  2, L, L, N) \
  _(CMPLEll,    "cmple.ll",  2, L, L, N) \
  _(CMPEQll,    "cmpeq.ll",  2, L, L, N) \
  _(CMPNEll,    "cmpne.ll",  2, L, L, N) \
  \
  _(CMPLTli,    "cmplt.li",  2, L, I, N) \
  _(CMPLEli,    "cmple.li",  2, L, I, N) \
  _(CMPGTli,    "cmpgt.li",  2, L, I, N) \
  _(CMPGEli,    "cmpge.li",  2, L, I, N) \
  _(CMPEQli,    "cmpeq.li",  2, L, I, N) \
  _(CMPNEli,    "cmpne.li",  2, L, I, N) \
  \
  _(CMPLTlc,    "cmplt.lc",  2, L, C, N) \
  _(CMPLElc,    "cmple.lc",  2, L, C, N) \
  _(CMPGTlc,    "cmpgt.lc",  2, L, C, N) \
  _(CMPGElc,    "cmpge.lc",  2, L, C, N) \
  _(CMPEQlc,    "cmpeq.lc",  2, L, C, N) \
  _(CMPNElc,    "cmpne.lc",  2, L, C, N) \
/*_(CMPipp) \
  _(MOVpp) \
  _(NEGi) \
  _(NOTb) \
  _(NOTp) \
  _(ADDllc) \
  _(SUBllc) \
  _(MULllc) \
  _(DIVllc) \
  _(REMllc) \
*/\
  _(ADDlli,     "add.lli",  3, L, L, I) \
  _(SUBlli,     "sub.lli",  3, L, L, I) \
  _(MULlli,     "mul.lli",  3, L, L, I) \
  _(DIVlli,     "div.lli",  3, L, L, I) \
  _(REMlli,     "rem.lli",  3, L, L, I) \
  \
  _(ADDlll,     "add.lll",  3, L, L, L) \
  _(SUBlll,     "sub.lll",  3, L, L, L) \
  _(MULlll,     "mul.lll",  3, L, L, L) \
  _(DIVlll,     "div.lll",  3, L, L, L) \
  _(REMlll,     "rem.lll",  3, L, L, L) \
/*_(CONCATsss) \
  _(CONSTlc) \
*/\
  _(CONSTli,    "const.li", 3, L, I, N) \
/*_(CONSTsc) \
  _(CONSTpi) \
*/\
  _(CLOSkxi,    "clos.kxi", 3, K, X, I) \
/*_(WRAPkpi) \
*/\
  _(APPLYpi,    "apply.pi", 2, P, I, N) \
/*_(APPLYTpki) \
*/\
  _(CALLpxi,    "call.pxi", 3, P, X, I) \
/*_(CALLTpxi) \
  _(CCALLcpi) \
  _(ONEWpii) \
*/\
  _(OSETpip,    "oset.pip", 3, P, I, P) \
  _(OGETppi,    "oget.ppi", 3, P, P, I) \
  _(CLOSGETpi,  "closget.pi",  2, P, I, N) \
  _(JUMPj,      "jump.j",   1, N, J, N) \
/*_(RET) \
*/\
  _(RETp,       "ret.p",    1, P, N, N)
  

typedef enum opcode {
#define OPLIST(op, name, n, a1, a2, a3) op,
OPS(OPLIST)
#undef OPLIST
  LIMIT
} op_t;

static_assert(LIMIT <= 256);

#define opcode(i)   ((i)&0xff)
#define arg3A(i)  (((i)>>8)&0xff)
#define arg3B(i)  (((i)>>16)&0xff)
#define arg3C(i)  ((i)>>24)
#define arg2A(i)  arg3A(i)
#define arg2B(i)  ((i)>>16)
#define arg2sB(i) ((int32_t)(i)>>16)
#define arg1sA(i) ((int32_t)(i)>>8)
#define arg3B2sB(i) (((uint32_t)(i))&0xff)
#define arg3C2sB(i) ((((uint32_t)(i))>>8)&0xff)
#define arg2B2sB(i) (((uint32_t)(i))&0xffff)

#define mkOP(x_)  (((bc_t)(x_))&0xff)
#define mk3A(x_)  ((((bc_t)(x_))&0xff)<<8)
#define mk3B(x_)  ((((bc_t)(x_))&0xff)<<16)
#define mk3C(x_)  ((((bc_t)(x_))&0xff)<<24)
#define mk2A(x_)  ((((bc_t)(x_))&0xff)<<8)
#define mk2B(x_)  ((((bc_t)(x_))&0xffff)<<16)

#define make3ABC(op, a, b, c) (mkOP(op) | mk3A(a) | mk3B(b) | mk3C(c)) 
#define make2AB(op, a, b) (mkOP(op) | mk2A(a) | mk2B(b))
#define make2A(op, a) make2AB(op, a, 0)
#define make2B(op, b) make2AB(op, 0, b)

#endif
