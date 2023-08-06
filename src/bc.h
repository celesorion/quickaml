#define OPS(_) \
  _(NOP) \
  _(STOPii)  \
  \
  _(CMPLTll) \
  _(CMPLEll) \
  _(CMPEQll) \
  _(CMPNEll) \
  \
  _(CMPLTli) \
  _(CMPLEli) \
  _(CMPGTli) \
  _(CMPGEli) \
  _(CMPEQli) \
  _(CMPNEli) \
  \
  _(CMPLTlc) \
  _(CMPLElc) \
  _(CMPGTlc) \
  _(CMPGElc) \
  _(CMPEQlc) \
  _(CMPNElc) \
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
  _(ADDlli) \
  _(SUBlli) \
  _(MULlli) \
  _(DIVlli) \
  _(REMlli) \
  \
  _(ADDlll) \
  _(SUBlll) \
  _(MULlll) \
  _(DIVlll) \
  _(REMlll) \
/*_(CONCATsss) \
  _(CONSTlc) \
*/\
  _(CONSTli) \
/*_(CONSTsc) \
  _(CONSTpi) \
*/\
  _(CLOSkxi) \
/*_(WRAPkpi) \
*/\
  _(APPLYpi) \
/*_(APPLYTpki) \
*/\
  _(CALLpxi) \
/*_(CALLTpxi) \
  _(CCALLcpi) \
  _(ONEWpii) \
*/\
  _(OSETpip) \
  _(OGETppi) \
  _(CLOSGETpi) \
  _(JUMPj) \
/*_(RET) \
*/\
  _(RETp)
  

typedef enum opcode {
#define OPLIST(name) name,
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

#define make3ABC(op, a, b, c) (((bc_t)(op))|(((bc_t)(a))<<8)|(((bc_t)(b))<<16)|(((bc_t)(c))<<24))
#define make2AB(op, a, b) (((bc_t)(op))|(((bc_t)(a))<<8)|(((bc_t)(b))<<16))
#define make2A(op, a) make2AB(op, a, 0)
#define make2B(op, b) make2AB(op, 0, b)

