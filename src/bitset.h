#ifndef QK_BITSET_H
#define QK_BITSET_H

#include <stdint.h>

struct nextptr {
  uint32_t index;
  uint32_t offset;
  uint64_t mask;
};

static inline struct nextptr ptr_scan_init(const uint64_t *const ptrmap) {
  return (struct nextptr){.index = 0, .mask = ptrmap[0], .offset = 0};
}

enum {
  NOT_FOUND = (uint32_t)-1,
};

static inline struct nextptr ptr_next(struct nextptr prev, const uint64_t *const ptrmap, const uint32_t N) {
  uint32_t i = prev.index;
  uint64_t x = prev.mask;
  for (;;) {
    if (x) {
      uint32_t offset = __builtin_clzll(x) + prev.index * 64;
      x &= x - 1;
      return (struct nextptr){.index = i, .mask = x, .offset = offset};
    }
    i += 1;
    if (i >= N)
      return (struct nextptr){.index = NOT_FOUND, .mask = 0, .offset = 0};
    x = ptrmap[i];
  }
}

#endif
