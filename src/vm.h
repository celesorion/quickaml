#include "obj.h"
#include "def.h"

#include <stdint.h>

#define frame_rv(bp) ((bp)[-2])
#define frame_ra(bp) ((bp)[-1])
#define prev_bp(bp, fo) ((bp)-2-(fo))
#define next_bp(bp, fo) ((bp)+2+(fo))
#define add2ip(ip, off) ((bc_t *)((unsigned char*)(ip) + (ptrdiff_t)off))  

#define THREADED [[gnu::noinline, clang::qkcc, gnu::aligned(64)]] static
#define MUSTTAIL [[clang::musttail]]
#define DP(dp, op) (*(((opthread *const *)(dp))[op]))

#define PARAMS_IMPL_1 bc_t *restrict ip, int32_t a2sb, uint8_t a3a, val_t *restrict bp, struct state *restrict state, const void *restrict dispatch, struct function *restrict fns[]
#define ARGS_IMPL_1 ip, a2sb, a3a, bp, state, dispatch, fns

#define PARAMS_IMPL_2 bc_t *restrict ip, int32_t a2sb, uint8_t a3a, val_t *restrict bp, struct state *restrict state, const void *restrict dispatch, struct function *restrict fns[]
#define ARGS_IMPL_2 ip, a2sb, a3a, bp, state, dispatch, fns

#define DISPATCH() MUSTTAIL return DP(dispatch, op)(ARGS)
#define NONTAILDISPATCH() DP(dispatch, op)(ARGS)

#define FETCH_DECODE_IMPL_1()        \
  bc_t insn = *ip++;                 \
  op_t op = opcode(insn);            \
  a3a = arg3A(insn);                 \
  a2sb = arg2sB(insn);               \

#define FETCH_DECODE_IMPL_2()        \
  bc_t *insnp = ip++;                \
  op_t op = opcodeP(insnp);          \
  a3a = arg3AP(insnp);               \
  a2sb = arg2sBP(insnp);             \

#define COND_NEXT_IP_CMOV(c)     \
  do {                           \
    ip += c ? 0                  \
            : arg2sB(next_insn); \
  } while (0)

#define COND_NEXT_IP_BR(c)     \
  do {                         \
    if (likely(!c))            \
      ip += arg2sB(next_insn); \
  } while (0)

#define COND_NEXT_IP COND_NEXT_IP_BR

#define OP_DEFINITION(name) THREADED void vm_op_##name(PARAMS)

#ifndef DECODE_USING_LOADS
#define PARAMS PARAMS_IMPL_1
#define ARGS ARGS_IMPL_1
#define FETCH_DECODE FETCH_DECODE_IMPL_1
#else
#define PARAMS PARAMS_IMPL_2
#define ARGS ARGS_IMPL_2
#define FETCH_DECODE FETCH_DECODE_IMPL_2
#endif

[[clang::qkcc]] typedef void opthread(PARAMS);

#define PCALL_INNER(o_, f_) o_ = f_
#define PCALL_INNER_VOID(o_, f_) f_

#define PCALL_AARCH64(i_, o_, f_, ...)            \
  do {                                            \
    unsigned long lr;                             \
    __asm__("mov %0, lr" : "=r"(lr));             \
    i_(o_, f_)(__VA_ARGS__);                      \
    __asm__("mov lr, %0" : : "r"(lr) : "lr");     \
  } while (0)

#define PCALL_X86_64(i_, o_, f_, ...)             \
  do {                                            \
    i_(o_, f_)(__VA_ARGS__);                      \
  } while (0)

#if defined(__x86_64__) || defined(_M_X64)
#define PCALL(o_, f_, ...)      \
  PCALL_X86_64(PCALL_INNER, o_, f_, __VA_ARGS__)
#define PCALL_VOID(f_, ...) \
  PCALL_X86_64(PCALL_INNER_VOID, 0, f_, __VA_ARGS__)
#elif defined(__aarch64__) || defined(_M_ARM64)
#define PCALL(o_, f_, ...)      \
  PCALL_AARCH64(PCALL_INNER, o_, f_, __VA_ARGS__)
#define PCALL_VOID(f_, ...) \
  PCALL_AARCH64(PCALL_INNER_VOID, 0, f_, __VA_ARGS__)
#endif

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


int vm_entry(struct state *state);
