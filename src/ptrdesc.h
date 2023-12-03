#ifndef QK_FRAME_INFO_H
#define QK_FRAME_INFO_H

#include <stdint.h>

struct ptrdesc {
  uint64_t ptrmap[4];
};

struct nextptr {
  bool found;
  uint32_t offset;
};

static inline struct nextptr frame_ptr_next(struct ptrdesc *fi) {
  for (unsigned i = 0; i < 4; ++i) {
    uint64_t x = fi->ptrmap[i];
    if (x) {
      uint32_t offset = __builtin_ctzll(fi->ptrmap[i]) + i * 64;
      fi->ptrmap[i] = x & (x - 1);
      return (struct nextptr){true, offset};
    }
  }

  return (struct nextptr){false, 0};
}

#endif
