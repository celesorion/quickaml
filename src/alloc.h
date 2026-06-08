#ifndef QK_ALLOC_H
#define QK_ALLOC_H

#include <stdint.h>
#include <stdlib.h>

#include "def.h"
#include "object.h"
#include "state.h"

enum gc_phase {
  GC_IDLE,
  GC_MARK,
  GC_SWEEP,
};

struct heap {
  uint8_t *base;
  uint8_t *limit;

  struct free_block *free_list;
  uint8_t *sweep_cursor;

  void *gray;

  enum gc_phase phase;
  size_t allocated_bytes;
  size_t trigger_bytes;
  size_t live_bytes;
  size_t heap_size;

  struct gc_stats stats;
  struct runtime_args *args;
};

COLD_HELPER void *alloc_object(size_t n, struct fiber_segment *restrict fiber,
                               val_t *restrict bp);
bool heap_init(struct heap *restrict h, struct runtime_args *restrict rargs);
void heap_deinit(struct heap *restrict h);
void heap_stat_print(struct heap *restrict h);

COLD_HELPER void gc_poll_slow(struct fiber_segment *restrict fiber,
                              val_t *restrict bp, size_t credit);
COLD_HELPER void gc_publish_new_object(struct heap *h, void *ref, uint8_t kind);

COLD_HELPER void gc_store_field_slow(struct heap *h, val_t value);

INLINE bool heap_gc_poll_not_required(struct heap *h) {
  return h->phase == GC_IDLE && h->allocated_bytes < h->trigger_bytes;
}

INLINE void gc_poll_refresh(struct state *restrict st,
                            struct fiber_segment *restrict fiber) {
  fiber->gc_poll_not_required = heap_gc_poll_not_required(st->heap);
}

INLINE void gc_poll(struct fiber_segment *restrict fiber, val_t *restrict bp,
                    size_t credit) {
  if (unlikely(!fiber->gc_poll_not_required))
    gc_poll_slow(fiber, bp, credit);
}

INLINE void gc_store_field(struct heap *h, void *container, val_t *slot,
                           val_t value) {
  *slot = value;
  if (unlikely(h->phase == GC_MARK &&
               obj_gc_bits(container) == OBJ_FLAG_GC_BLACK))
    gc_store_field_slow(h, value);
}

extern struct heap global_heap;

#endif
