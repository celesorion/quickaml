#include "def.h"
#include "object.h"
#include "state.h"

#include <stdint.h>

#define FRAME_HEADER_SIZE 3
#define frame_rv(bp) ((bp)[-3])
#define frame_ra(bp) ((bp)[-2])
#define frame_self(bp) ((bp)[-1])
#define prev_bp(bp, fo) ((bp) - FRAME_HEADER_SIZE - (fo))
#define next_bp(bp, fo) ((bp) + FRAME_HEADER_SIZE + (fo))
#define add2ip(ip, off)                                                        \
  ((bc_t *)((unsigned char *)(ip) + (ptrdiff_t)off * sizeof(bc_t)))

#define THREADED                                                               \
  [[gnu::noinline, clang::preserve_none, gnu::aligned(32)]] static
#define MUSTTAIL [[clang::musttail]]
#define DP(dp, op) (((opthread *const *)(dp))[op])

#define PARAMS_IMPL_1                                                          \
  [[maybe_unused]] bc_t *restrict ip, [[maybe_unused]] uint16_t a2b,           \
      [[maybe_unused]] uint8_t a3a, [[maybe_unused]] val_t *restrict bp,       \
      [[maybe_unused]] uint64_t ft,                                            \
      [[maybe_unused]] struct state *restrict state,                           \
      [[maybe_unused]] const void *restrict dispatch,                          \
      [[maybe_unused]] struct thunk *restrict fns[]

#define ARGS_IMPL_1 ip, a2b, a3a, bp, ft, state, dispatch, fns

#define PARAMS_IMPL_2                                                          \
  [[maybe_unused]] bc_t *restrict ip, [[maybe_unused]] uint16_t a2b,           \
      [[maybe_unused]] uint8_t a3a, [[maybe_unused]] val_t *restrict bp,       \
      [[maybe_unused]] uint64_t ft,                                            \
      [[maybe_unused]] struct state *restrict state,                           \
      [[maybe_unused]] const void *restrict dispatch,                          \
      [[maybe_unused]] struct thunk *restrict fns[]
#define ARGS_IMPL_2 ip, a2b, a3a, bp, ft, state, dispatch, fns

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

#define DECODE_OP_IMPL_1() op_t op = gOP(insn);

#define DECODE_A3A_IMPL_1() a3a = g3A(insn)

#define DECODE_A2SB_IMPL_1() a2b = g2B(insn)

#define INC_IP_IMPL_1() ip++

#define FETCH_INSN_IMPL_2() bc_t *insnp = ip

#define DECODE_OP_IMPL_2() op_t op = gpOP(insnp);

#define DECODE_A3A_IMPL_2() a3a = gp3A(insnp)

#define DECODE_A2SB_IMPL_2() a2b = gp2B(insnp)

#define INC_IP_IMPL_2() ip++

#define COND_NEXT_IP_CMOV(c, i)                                                \
  do {                                                                         \
    char *p = (char *)ip;                                                      \
    p += c ? 0 : sizeof(bc_t) * JUMP_OFFSET_OF(i);                             \
    ip = (bc_t *)p;                                                            \
  } while (0)

#define COND_NEXT_IP_BR(c, i)                                                  \
  do {                                                                         \
    if (likely(!c))                                                            \
      ip = add2ip(ip, JUMP_OFFSET_OF(i));                                      \
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
#define EXTRA_ARG(x) g1sA(x)
#define EXTRA_ARGU(x) g1A(x)
#define INSN(x) insn(x)
#define ARG3A a3a
#define ARG3B g3B_of_2B(a2b)
#define ARG3C g3C_of_2B(a2b)
#define ARG3X ARG3C
#define ARG3Y ARG3A
#define ARG3Z ARG3B
#define ARG2A a3a
#define ARG2B a2b
#define JUMP_OFFSET (((int32_t)(int16_t)a2b << 8) | a3a)
#define JUMP_OFFSET_OF(i) g1sA(i)
#define GET_FO(fo)                                                             \
  bc_t prev_insn = ra[-1];                                                     \
  ssz_t fo = g3A(prev_insn)

#elif defined(DECODE_MODE) && DECODE_MODE == 1
#define PARAMS PARAMS_IMPL_2
#define ARGS ARGS_IMPL_2
#define FETCH_INSN FETCH_INSN_IMPL_2
#define INC_IP INC_IP_IMPL_2
#define DECODE_OP DECODE_OP_IMPL_2
#define DECODE_A3A DECODE_A3A_IMPL_2
#define DECODE_A2SB DECODE_A2SB_IMPL_2
#define NEXT_INSN(x) bc_t *x = ip++
#define EXTRA_ARG(x) gp1sA(x)
#define EXTRA_ARGU(x) gp1A(x)
#define INSN(x) insnP(x)
#define ARG3A a3a
#define ARG3B g3B_of_2B(a2b)
#define ARG3C g3C_of_2B(a2b)
#define ARG3X ARG3C
#define ARG3Y ARG3A
#define ARG3Z ARG3B
#define ARG2A a3a
#define ARG2B a2b
#define JUMP_OFFSET (((int32_t)(int16_t)a2b << 8) | a3a)
#define JUMP_OFFSET_OF(i) gp1sA(i)
#define GET_FO(fo)                                                             \
  bc_t *prev_insnp = ra - 1;                                                   \
  ssz_t fo = gp3A(prev_insnp)

#endif

[[clang::preserve_none]] typedef void opthread(PARAMS);


#define cast(x, t) ((t)(x))
#define cast_u(x, width) ((uint##width##_t)(x))
#define cast_s(x, width) ((int##width##_t)(uint##width##_t)(x))
#define sign_extend(x, from, to)                                               \
  ((int##to##_t)(int##from##_t)(uint##from##_t)(x))
#define zero_extend(x, from, to) ((uint##to##_t)(uint##from##_t)(x))

status_t vm_entry(struct state *state);
status_t vm_exec(struct thunk *entry, struct thunk **fns, size_t numfn,
                 size_t numobject, size_t stack_slots, val_t *result);
status_t vm_exec_with_args(struct thunk *entry, struct thunk **fns,
                           size_t numfn, size_t numobject, size_t stack_slots,
                           val_t *result, struct runtime_args *rargs,
                           struct gc_stats *stats_out);
struct thunk *vm_thunk_alloc(const bc_t *ops, size_t nops, const val_t *ctbl,
                             size_t nconst, uint8_t nregs, size_t nfree);
void vm_thunk_free(struct thunk *thunk);
struct thunk *vm_thunk_make_wrapper(size_t top_idx);
bool vm_const_from_i64(int64_t value, val_t *out);
bool vm_const_from_f64(double value, val_t *out);
struct str *vm_alloc_str(const char *data, uint32_t len);
void vm_free_str(struct str *s);
bool vm_format_result(val_t value, char *buf, size_t len);
size_t vm_object_size_for_fields(size_t nfields);
const char *vm_status_name(status_t status);
