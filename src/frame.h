#ifndef QK_FRAME_H
#define QK_FRAME_H

#include <stdint.h>

#include "bitset.h"

struct framedesc {
  uint64_t ptrmap[4];
};

static inline struct nextptr frame_ptr_scan_init(const struct framedesc *fd) {
  return ptr_scan_init(fd->ptrmap);
}

static inline struct nextptr frame_ptr_next(struct nextptr prev, const struct framedesc *fd) {
  return ptr_next(prev, fd->ptrmap, 4);
}

#endif

