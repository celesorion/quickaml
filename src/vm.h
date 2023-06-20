#include <stdint.h>
#include <stdlib.h>

typedef enum vm_opcode {
  NOP = 0,
  STOPii,
//  CMPLTll,
//  CMPLEll,
//  CMPEQll,
  
  CMPLTli,
//  CMPLEli,
//  CMPEQli,
//
//  CMPLTlc,
//  CMPLElc,
//  CMPEQlc,
//
//  CMPipp,
//
//  MOVpp,
//
//  NEGi,
//  NOTb,
//  NOTp,
//
//  ADDllc,
//  SUBllc,
//  MULllc,
//  DIVllc,
//  REMllc,

  ADDlli,
  SUBlli,
//  MULlli,
//  DIVlli,
//  REMlli,
  
  ADDlll,
  SUBlll,
//  MULlll,
//  DIVlll,
//  REMlll,
//
//  CONCATsss,
//
//  CONSTlc,
  CONSTli,
//  CONSTsc,
//  CONSTpi,
//
  CLOSkxi,
//  WRAPkpi,
  APPLYpki,
//  APPLYTpki,
  CALLpxi,
//  CALLTpxi,
//  CCALLcpi,
//
//  ONEWpii,
  OSETpip,
  OGETppi,  
//
  JUMPj,
  JUMPNj,
//
//  RET,
  RETp,
} op_t;

static_assert(sizeof(enum vm_opcode) <= sizeof(uint32_t));

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
#define make3ABC(op, a, b, c) (((bc_t)(op))|(((bc_t)(a))<<8)|(((bc_t)(b))<<16)|(((bc_t)(c))<<24))
#define make2AB(op, a, b) (((bc_t)(op))|(((bc_t)(a))<<8)|(((bc_t)(b))<<16))
#define make2A(op, a) make2AB(op, a, 0)
#define make2B(op, b) make2AB(op, 0, b)

typedef uint64_t val_t;
typedef uint32_t bc_t;
typedef uint32_t ssz_t;
typedef uint64_t sz_t;
typedef uint64_t obj_header;

struct vm_fn {
  ssz_t framesz;
  bc_t *oplimit;
  bc_t ops[];
};

struct vm_state {
  struct vm_fn *entry;
  struct vm_fn **fns;
  val_t *stk;
  val_t *stklimit;
};

#define frame_link(bp) ((bp)[-3])
#define frame_rv(bp) ((bp)[-2])
#define frame_ra(bp) ((bp)[-1])
#define next_bp(sp) ((sp)+3)
#define prev_sp(bp) ((bp)-3)

struct object {
  obj_header hd;
  val_t fields[];
};

struct closure {
  obj_header hd;
  val_t fp;
  val_t args;
  val_t env[];  
};

#define closure_size(n) (sizeof(struct closure) + sizeof(val_t)*(n))
#define ptr2val(p) ((val_t)(void *)(p))
#define val2ptr(v) ((void *)(v))
#define add2ip(ip, off) ((bc_t *)((unsigned char*)(ip) + (ptrdiff_t)off))  

