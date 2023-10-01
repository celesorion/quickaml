#ifndef QK_HASH_H
#define QK_HASH_H

#include "komihash/komihash.h"

typedef uint64_t komihash_state;

#define komihash_init() ((komihash_state)0)

static inline void komihash_write(komihash_state *state, const void *val, size_t len) {
  *state = komihash(val, len, 0);
}

static inline uint64_t komihash_finish(komihash_state state) {
  return state;
}

#endif

