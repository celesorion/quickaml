#ifndef QK_DEF_H
#define QK_DEF_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef uint64_t val_t;
typedef uint32_t bc_t;
typedef uint32_t ssz_t;
typedef int64_t  joff_t;
typedef uint64_t sz_t;
typedef uint64_t metainfo;

#define unlikely(x) (__builtin_expect(!!(x),0))
#define likely(x) (__builtin_expect(!!(x),1))

#define ptr2val(p) ((val_t)(void *)(p))
#define val2ptr(v) ((void *)(v))
#define val2off(v) ((joff_t)(v))

/* The calling conventions the interpreter relies on.  preserve_none lets the
 * threaded handlers keep the machine state in registers across their tail
 * calls, preserve_most keeps calls into the cold helpers cheap for them.  gcc
 * 15 spells the first one gnu::preserve_none and has no second one. */
#if __has_c_attribute(clang::preserve_none)
#define PRESERVE_NONE [[clang::preserve_none]]
#elif __has_c_attribute(gnu::preserve_none)
#define PRESERVE_NONE [[gnu::preserve_none]]
#else
#define PRESERVE_NONE
#endif
#if __has_c_attribute(clang::preserve_most)
#define PRESERVE_MOST [[clang::preserve_most]]
#else
#define PRESERVE_MOST
#endif

#define INLINE [[gnu::always_inline]] static inline
#define COLD_HELPER [[gnu::noinline]] PRESERVE_MOST

#define STATUS(_) \
  _(S_OK, "success")   \
  _(S_EOF, "reach end of file") \
  _(S_LIMIT, "out of limit") \
  _(S_READ_ERR, "read error") \
  _(S_UNPAIRED, "unpaired symbols") \
  _(S_INVALID_FNID, "invalid function id") \
  _(S_INVALID_NUMFN, "invalid number of functions") \
  _(S_INVALID_NUMBC, "invalid number of bytecodes") \
  _(S_INVALID_LAYOUT_KIND, "invalid layout kind") \
  _(S_INVALID_LAYOUT_SIZE, "invalid layout size") \
  _(S_NOT_AN_OPERAND, "not an operand") \
  _(S_NOT_A_INT, "not an integer") \
  _(S_BAD_OP, "bad opcode") \
  _(S_DESCSPACE_INIT_FAILED, "descspace init failed") \
  _(S_HEAP_INIT_FAILED, "heap init failed") \
  _(S_STATE_INIT_FAILED, "state init failed") \
  _(S_INVALID_OBJ_DESC, "invalid object descriptor") \

typedef enum {
#define SLIST(st, desc) st,
STATUS(SLIST)
#undef SLIST
} status_t;

static inline const char *status_str(status_t st) {
  switch (st) {
#define SLIST(st, desc) case st: return desc;
STATUS(SLIST)
#undef SLIST
    default: return nullptr;
  }
}

typedef enum {
  TRACE_0,
  TRACE_1,
  TRACE_2,
  TRACE_ALL,
} trace_level_t;

struct runtime_args {
  trace_level_t trace_level;
  size_t base_size;
  size_t align;
  size_t descspace_size;
};

struct gc_stats {
  size_t total_allocated_bytes;
  size_t mark_to_sweep_transitions;
  size_t forced_finish_cycles;
  size_t sweep_assist_steps;
  size_t last_completed_live_bytes;
  size_t last_completed_trigger_bytes;
};

#endif
