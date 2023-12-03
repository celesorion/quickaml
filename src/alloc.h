#ifndef QK_ALLOC_H
#define QK_ALLOC_H

#include "def.h"

#include <stdint.h>
#include <stdlib.h>

struct runtime_args {
  size_t base_size;
  size_t align;
};

struct heap {
  uint8_t *bump;
  uint8_t *from_base;
  uint8_t *from_limit;
  uint8_t *to_base;
  uint8_t *to_limit;
  uint8_t *scan;
  struct runtime_args *args;
};

void *simple_malloc(size_t n, val_t *desc);
bool heap_init(struct heap *h, struct runtime_args rargs);

extern struct heap global_heap;

#endif
