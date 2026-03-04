#include "def.h"
#include "object.h"
#include "state.h"

#include <stdint.h>

#define frame_rv(bp) ((bp)[-2])
#define frame_ra(bp) ((bp)[-1])
#define prev_bp(bp, fo) ((bp) - 2 - (fo))
#define next_bp(bp, fo) ((bp) + 2 + (fo))
#define add2ip(ip, off)                                                        \
  ((bc_t *)((unsigned char *)(ip) + (ptrdiff_t)off * sizeof(bc_t)))

#define THREADED                                                               \
  [[gnu::noinline, clang::preserve_none, gnu::aligned(32)]] static
#define MUSTTAIL [[clang::musttail]]
#define DP(dp, op) (((opthread *const *)(dp))[op])

#define PARAMS_IMPL_1                                                          \
  [[maybe_unused]] bc_t *restrict ip, [[maybe_unused]] uint16_t a2b,           \
      [[maybe_unused]] uint8_t a3a, [[maybe_unused]] val_t *restrict bp,       \
      [[maybe_unused]] struct state *restrict state,                           \
      [[maybe_unused]] const void *restrict dispatch,                          \
      [[maybe_unused]] struct function *restrict fns[]

#define ARGS_IMPL_1 ip, a2b, a3a, bp, state, dispatch, fns

#define PARAMS_IMPL_2                                                          \
  [[maybe_unused]] bc_t *restrict ip, [[maybe_unused]] uint16_t a2b,           \
      [[maybe_unused]] uint8_t a3a, [[maybe_unused]] val_t *restrict bp,       \
      [[maybe_unused]] struct state *restrict state,                           \
      [[maybe_unused]] const void *restrict dispatch,                          \
      [[maybe_unused]] struct function *restrict fns[]
#define ARGS_IMPL_2 ip, a2b, a3a, bp, state, dispatch, fns

#define REPLICATED_DISPATCH() MUSTTAIL return DP(dispatch, op)(ARGS)
#define NONTAILDISPATCH()                                                      \
  FETCH_INSN();                                                                \
  DECODE_OP();                                                                 \
  DECODE_A3A();                                                                \
  DECODE_A2SB();                                                               \
  INC_IP();                                                                    \
  DP(dispatch, op)(ARGS)
#define DISPATCH_IMPL_1()                                                      \
  do {                                                                         \
    FETCH_INSN();                                                              \
    DECODE_OP();                                                               \
    opthread *const next = DP(dispatch, op);                                   \
    DECODE_A3A();                                                              \
    DECODE_A2SB();                                                             \
    INC_IP();                                                                  \
    MUSTTAIL return (*next)(ARGS);                                             \
  } while (0)
#define DISPATCH() DISPATCH_IMPL_1()

#define FETCH_INSN_IMPL_1() bc_t insn = *ip

#define DECODE_OP_IMPL_1() op_t op = opcode(insn);

#define DECODE_A3A_IMPL_1() a3a = arg3A(insn)

#define DECODE_A2SB_IMPL_1() a2b = arg2B(insn)

#define INC_IP_IMPL_1() ip++

#define FETCH_INSN_IMPL_2() bc_t *insnp = ip

#define DECODE_OP_IMPL_2() op_t op = opcodeP(insnp);

#define DECODE_A3A_IMPL_2() a3a = arg3AP(insnp)

#define DECODE_A2SB_IMPL_2() a2b = arg2BP(insnp)

#define INC_IP_IMPL_2() ip++

#define COND_NEXT_IP_CMOV(c, i)                                                \
  do {                                                                         \
    char *p = (char *)ip;                                                      \
    p += c ? 0 : sizeof(bc_t) * JUMP_OFFSET(i);                                \
    ip = (bc_t *)p;                                                            \
  } while (0)

#define COND_NEXT_IP_BR(c, i)                                                  \
  do {                                                                         \
    if (likely(!c))                                                            \
      ip = add2ip(ip, JUMP_OFFSET(i));                                         \
  } while (0)

#if !defined(JUMP_MODE) || defined(JUMP_MODE) && JUMP_MODE == 0
#define COND_NEXT_IP COND_NEXT_IP_BR
#elif defined(JUMP_MODE) && JUMP_MODE == 1
#define COND_NEXT_IP COND_NEXT_IP_CMOV
#endif

#define OP_DEFINITION(name) THREADED void vm_op_##name(PARAMS)

#if !defined(DECODE_MODE) || defined(DECODE_MODE) && DECODE_MODE == 0
#define PARAMS PARAMS_IMPL_1
#define ARGS ARGS_IMPL_1
#define FETCH_INSN FETCH_INSN_IMPL_1
#define INC_IP INC_IP_IMPL_1
#define DECODE_OP DECODE_OP_IMPL_1
#define DECODE_A3A DECODE_A3A_IMPL_1
#define DECODE_A2SB DECODE_A2SB_IMPL_1
#define NEXT_INSN(x) bc_t x = *ip++
#define EXTRA_ARG(x) arg1sA(x)
#define EXTRA_ARGU(x) arg1A(x)
#define INSN(x) insn(x)
#define ARG3A a3a
#define ARG3B arg3B2B(a2b)
#define ARG3C arg3C2B(a2b)
#define ARG3X ARG3C
#define ARG3Y ARG3A
#define ARG3Z ARG3B
#define ARG2A a3a
#define ARG2B a2b
#define JUMP_OFFSET(x) arg2sB(x)
#define GET_FO(fo)                                                             \
  bc_t prev_insn = ra[-1];                                                     \
  ssz_t fo = arg3A(prev_insn)

#elif defined(DECODE_MODE) && DECODE_MODE == 1
#define PARAMS PARAMS_IMPL_2
#define ARGS ARGS_IMPL_2
#define FETCH_INSN FETCH_INSN_IMPL_2
#define INC_IP INC_IP_IMPL_2
#define DECODE_OP DECODE_OP_IMPL_2
#define DECODE_A3A DECODE_A3A_IMPL_2
#define DECODE_A2SB DECODE_A2SB_IMPL_2
#define NEXT_INSN(x) bc_t *x = ip++
#define EXTRA_ARG(x) arg1sAP(x)
#define EXTRA_ARGU(x) arg1AP(x)
#define INSN(x) insnP(x)
#define ARG3A a3a
#define ARG3B arg3B2B(a2b)
#define ARG3C arg3C2B(a2b)
#define ARG3X ARG3C
#define ARG3Y ARG3A
#define ARG3Z ARG3B
#define ARG2A a3a
#define ARG2B a2b
#define JUMP_OFFSET(x) arg2sBP(x)
#define GET_FO(fo)                                                             \
  bc_t *prev_insnp = ra - 1;                                                   \
  ssz_t fo = arg3AP(prev_insnp)

#endif

[[clang::preserve_none]] typedef void opthread(PARAMS);

#define PCALL_INNER(o_, f_) o_ = f_
#define PCALL_INNER_VOID(o_, f_) f_

#define PCALL_AARCH64(i_, o_, f_, ...)                                         \
  do {                                                                         \
    unsigned long lr;                                                          \
    __asm__("mov %0, lr" : "=r"(lr));                                          \
    i_(o_, f_)(__VA_ARGS__);                                                   \
    __asm__("mov lr, %0" : : "r"(lr) : "lr");                                  \
  } while (0)

#define PCALL_X86_64(i_, o_, f_, ...)                                          \
  do {                                                                         \
    i_(o_, f_)(__VA_ARGS__);                                                   \
  } while (0)

#if defined(__x86_64__) || defined(_M_X64)
#define PCALL(o_, f_, ...) PCALL_X86_64(PCALL_INNER, o_, f_, __VA_ARGS__)
#define PCALL_VOID(f_, ...) PCALL_X86_64(PCALL_INNER_VOID, 0, f_, __VA_ARGS__)
#elif defined(__aarch64__) || defined(_M_ARM64)
#define PCALL(o_, f_, ...) PCALL_AARCH64(PCALL_INNER, o_, f_, __VA_ARGS__)
#define PCALL_VOID(f_, ...) PCALL_AARCH64(PCALL_INNER_VOID, 0, f_, __VA_ARGS__)
#endif

#define cast(x, t) ((t)(x))
#define cast_u(x, width) ((uint##width##_t)(x))
#define cast_s(x, width) ((int##width##_t)(uint##width##_t)(x))
#define sign_extend(x, from, to)                                               \
  ((int##to##_t)(int##from##_t)(uint##from##_t)(x))
#define zero_extend(x, from, to) ((uint##to##_t)(uint##from##_t)(x))

status_t vm_entry(struct state *state);
