#ifndef QK_DEF_H
#define QK_DEF_H

#include <stdint.h>

typedef uint64_t val_t;
typedef uint32_t bc_t;
typedef uint32_t ssz_t;
typedef uint64_t sz_t;
typedef uint64_t obj_header;

#define unlikely(x) (__builtin_expect(!!(x),0))
#define likely(x) (__builtin_expect(!!(x),1))

#define ptr2val(p) ((val_t)(void *)(p))
#define val2ptr(v) ((void *)(v))

#define INLINE [[gnu::always_inline]] static
#endif
