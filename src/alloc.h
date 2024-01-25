#ifndef QK_ALLOC_H
#define QK_ALLOC_H

#include <stdint.h>
#include <stdlib.h>

#include "def.h"
#include "state.h"

struct heap {
  uint8_t *bump;
  uint8_t *from_base;
  uint8_t *from_limit;
  uint8_t *to_base;
  uint8_t *to_limit;
  uint8_t *scan;
  struct runtime_args *args;
};

void *alloc_object(size_t n, struct state *restrict st, val_t *restrict bp);
bool heap_init(struct heap *restrict h, struct runtime_args *restrict rargs);
void heap_stat_print(struct heap *restrict h);

extern struct heap global_heap;

#endif
