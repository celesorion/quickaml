#include "alloc.h"
#include "bc.h"
#include "trace.h"
#include "vm.h"

#include <assert.h>
#include <stdlib.h>
#include <string.h>

struct heap global_heap;

/* ---------- heap helpers ---------- */

static bool heap_contains_ptr(struct heap *h, void *ptr) {
  uint8_t *p = (uint8_t *)ptr;
  return p >= h->base && p < h->limit;
}

/* ---------- free list management ---------- */

static void freelist_unlink(struct heap *h, struct free_block *blk) {
  struct free_block **prev = &h->free_list;
  struct free_block *cur = h->free_list;
  while (cur) {
    if (cur == blk) {
      *prev = cur->next;
      return;
    }
    prev = &cur->next;
    cur = cur->next;
  }
}

static void *freelist_alloc(struct heap *h, size_t n) {
  struct free_block **prev = &h->free_list;
  struct free_block *blk = h->free_list;

  while (blk) {
    size_t blk_size = obj_size(blk);
    if (blk_size >= n) {
      size_t remainder = blk_size - n;
      if (remainder >= object_align(sizeof(struct free_block))) {
        struct free_block *split =
            (struct free_block *)((uint8_t *)blk + n);
        free_block_init(split, (uint32_t)remainder, blk->next);
        *prev = split;
      } else {
        n = blk_size;
        *prev = blk->next;
      }
      h->allocated_bytes += n;
      h->stats.total_allocated_bytes += n;
      return blk;
    }
    prev = &blk->next;
    blk = blk->next;
  }
  return nullptr;
}

COLD_HELPER void *heap_alloc_preload(struct heap *h, size_t n) {
  if (h == nullptr || h->phase != GC_IDLE)
    return nullptr;
  return freelist_alloc(h, object_align(n));
}

/* ---------- shading ---------- */

static void shade_gray(struct heap *h, void *ref) {
  if (obj_gc_bits(ref) != OBJ_FLAG_GC_WHITE)
    return;
  if (obj_has_gclist(obj_tag_of(ref))) {
    obj_set_gc_bits(ref, OBJ_FLAG_GC_GRAY);
    obj_set_gclist(ref, h->gray);
    h->gray = ref;
  } else {
    obj_set_gc_bits(ref, OBJ_FLAG_GC_BLACK);
  }
}

static void shade_value(struct heap *h, val_t value) {
  if (!val_is_ptr(value) || val_is_empty(value))
    return;
  void *ref = val_as_ptr(value);
  if (!heap_contains_ptr(h, ref))
    return;
  shade_gray(h, ref);
}

/* ---------- write barrier slow path (heap edges only) ---------- */

COLD_HELPER void gc_store_field_slow(struct heap *h, val_t value) {
  shade_value(h, value);
}

/* ---------- root scanning ---------- */

static void gc_scan_stack_roots(struct heap *h,
                                struct fiber_segment *restrict fiber,
                                val_t *restrict bp) {
  val_t *cur_bp = bp;
  val_t *stk_base = fiber->stk;

  while (cur_bp > stk_base + 2 * FRAME_HEADER_SIZE) {
    val_t fn_val = frame_rv(cur_bp);
    struct thunk *thunk = val2ptr(fn_val);
    uint8_t nregs = thunk->nregs;
    shade_value(h, fn_val);

    for (uint8_t i = 0; i < nregs; i++)
      shade_value(h, cur_bp[i]);

    for (size_t i = 0; i < thunk->nconst; i++)
      shade_value(h, thunk->ctbl[i]);

    bc_t *ra = val2ptr(frame_ra(cur_bp));
    bc_t prev_insn = ra[-1];
    ssz_t fo = g3A(prev_insn);
    cur_bp = prev_bp(cur_bp, fo);
  }

  if (cur_bp > stk_base) {
    val_t fn_val = frame_rv(cur_bp);
    if (fn_val) {
      struct thunk *thunk = val2ptr(fn_val);
      uint8_t nregs = thunk->nregs;
      shade_value(h, fn_val);
      for (uint8_t i = 0; i < nregs; i++)
        shade_value(h, cur_bp[i]);
      for (size_t i = 0; i < thunk->nconst; i++)
        shade_value(h, thunk->ctbl[i]);
    }
  }
}

static void gc_scan_thunk_constants(struct heap *h,
                                    const struct thunk *thunk) {
  for (size_t i = 0; i < thunk->nconst; i++)
    shade_value(h, thunk->ctbl[i]);
}

static void gc_scan_roots(struct fiber_segment *restrict fiber, struct heap *h,
                          val_t *restrict bp) {
  struct state *state = fiber->state;
  for (size_t i = 0; i < state->numfn; i++)
    gc_scan_thunk_constants(h, state->fns[i]);

  gc_scan_stack_roots(h, fiber, bp);

  for (struct fiber_segment *parent = fiber->parent; parent != nullptr;
       parent = parent->parent) {
    val_t *parent_bp = parent->stk + parent->stklimit.inactive.used_slots;
    gc_scan_stack_roots(h, parent, parent_bp);
  }
}

/* ---------- marking ---------- */

static void gc_scan_object(struct heap *h, void *ref) {
  switch (obj_tag_of(ref)) {
  case TAG_THUNK: {
    struct thunk *thunk = ref;
    for (size_t i = 0; i < thunk->nconst; i++)
      shade_value(h, thunk->ctbl[i]);
    for (size_t i = 0; i < thunk->nfree; i++)
      shade_value(h, thunk->freevars[i]);
    break;
  }
  case TAG_STR:
  case TAG_FREE:
    break;
  default: {
    struct object *obj = ref;
    size_t nfields = object_nfields(obj);
    for (size_t i = 0; i < nfields; i++)
      shade_value(h, obj->fields[i]);
    break;
  }
  }
}

static size_t gc_mark_step(struct heap *h, size_t budget) {
  size_t work = 0;
  while (h->gray != nullptr && work < budget) {
    void *ref = h->gray;
    h->gray = obj_gclist(ref);
    gc_scan_object(h, ref);
    obj_set_gc_bits(ref, OBJ_FLAG_GC_BLACK);
    obj_set_gclist(ref, nullptr);
    work += object_align(obj_size(ref));
  }
  return work;
}

static bool gc_mark_is_complete(struct heap *h) {
  return h->gray == nullptr;
}

/* ---------- sweeping ---------- */

static size_t gc_sweep_step(struct heap *h, size_t budget) {
  size_t work = 0;
  uint8_t *cursor = h->sweep_cursor;
  uint8_t *end = h->limit;

  while (cursor < end && work < budget) {
    size_t run_size = 0;
    uint8_t *run_start = cursor;
    bool leading_is_free = (obj_tag_of(cursor) == TAG_FREE);

    while (cursor < end) {
      size_t block_size = object_align(obj_size(cursor));

      if (obj_tag_of(cursor) == TAG_FREE) {
        if (run_size > 0)
          freelist_unlink(h, (struct free_block *)cursor);
        run_size += block_size;
        cursor += block_size;
        continue;
      }

      metainfo bits = obj_gc_bits(cursor);
      if (bits == OBJ_FLAG_GC_WHITE) {
        h->allocated_bytes -= block_size;
        run_size += block_size;
        cursor += block_size;
        continue;
      }

      break;
    }

    if (run_size > 0) {
      if (leading_is_free) {
        struct free_block *blk = (struct free_block *)run_start;
        free_block_init(blk, (uint32_t)run_size, blk->next);
      } else {
        free_block_init((struct free_block *)run_start, (uint32_t)run_size,
                        h->free_list);
        h->free_list = (struct free_block *)run_start;
      }
      work += run_size;
      continue;
    }

    size_t block_size = object_align(obj_size(cursor));
    obj_set_gc_bits(cursor, OBJ_FLAG_GC_WHITE);
    h->live_bytes += block_size;
    work += block_size;
    cursor += block_size;
  }

  h->sweep_cursor = cursor;

  if (cursor >= end) {
    /* live_bytes = swept survivors + already-swept allocations */
    assert(h->live_bytes <= h->allocated_bytes);
    h->trigger_bytes =
        h->live_bytes < h->heap_size / 2 ? h->live_bytes * 2 : h->heap_size;
    if (h->trigger_bytes < 4096)
      h->trigger_bytes = 4096;
    h->stats.last_completed_live_bytes = h->live_bytes;
    h->stats.last_completed_trigger_bytes = h->trigger_bytes;
    h->phase = GC_IDLE;
  }

  return work;
}

/* ---------- phase transitions ---------- */

static void gc_mark_to_fixpoint(struct heap *h) {
  while (!gc_mark_is_complete(h))
    gc_mark_step(h, SIZE_MAX);
}

static void gc_begin_sweep(struct heap *h) {
  assert(h->phase == GC_MARK);
  h->phase = GC_SWEEP;
  h->sweep_cursor = h->base;
  h->live_bytes = 0;
  h->stats.mark_to_sweep_transitions++;
}

static void gc_sweep_to_fixpoint(struct heap *h) {
  while (h->sweep_cursor < h->limit)
    gc_sweep_step(h, SIZE_MAX);
}

static void gc_start_cycle(struct fiber_segment *restrict fiber, struct heap *h,
                           val_t *restrict bp) {
  h->phase = GC_MARK;
  h->gray = nullptr;
  gc_scan_roots(fiber, h, bp);
}

static void gc_finish_mark(struct fiber_segment *restrict fiber, struct heap *h,
                           val_t *restrict bp) {
  gc_scan_roots(fiber, h, bp);
  gc_mark_to_fixpoint(h);
  gc_begin_sweep(h);
}

static void gc_finish_sweep(struct heap *h) {
  gc_sweep_to_fixpoint(h);
}

static void gc_finish_cycle(struct fiber_segment *restrict fiber, struct heap *h,
                            val_t *restrict bp) {
  switch (h->phase) {
  case GC_IDLE:
    gc_start_cycle(fiber, h, bp);
    gc_finish_mark(fiber, h, bp);
    gc_finish_sweep(h);
    break;
  case GC_MARK:
    gc_finish_mark(fiber, h, bp);
    gc_finish_sweep(h);
    break;
  case GC_SWEEP:
    gc_finish_sweep(h);
    break;
  }
}

/* ---------- gc poll (safepoint) ---------- */

COLD_HELPER void gc_poll_slow(struct fiber_segment *restrict fiber,
                              val_t *restrict bp, size_t credit) {
  struct state *st = fiber->state;
  struct heap *h = st->heap;

  if (h->phase == GC_IDLE) {
    if (h->allocated_bytes >= h->trigger_bytes) {
      gc_start_cycle(fiber, h, bp);
    } else {
      gc_poll_refresh(st, fiber);
      return;
    }
  }

  if (h->phase == GC_MARK) {
    gc_scan_roots(fiber, h, bp);
    size_t work = gc_mark_step(h, credit);
    credit = work < credit ? credit - work : 0;

    if (gc_mark_is_complete(h)) {
      gc_begin_sweep(h);
      if (credit > 0)
        gc_sweep_step(h, credit);
    }
    gc_poll_refresh(st, fiber);
    return;
  }

  if (h->phase == GC_SWEEP)
    gc_sweep_step(h, credit);

  gc_poll_refresh(st, fiber);
}

/* ---------- heap init/deinit ---------- */

void heap_stat_print(struct heap *restrict h) {
  fprintf(stderr, "heap: base=%p limit=%p size=%zu\n", h->base, h->limit,
          h->heap_size);
  fprintf(stderr, "  allocated=%zu live=%zu trigger=%zu phase=%d total=%zu\n",
          h->allocated_bytes, h->live_bytes, h->trigger_bytes, h->phase,
          h->stats.total_allocated_bytes);
  size_t free_total = 0;
  size_t free_count = 0;
  for (struct free_block *fb = h->free_list; fb; fb = fb->next) {
    free_total += obj_size(fb);
    free_count++;
  }
  fprintf(stderr, "  free_blocks=%zu free_bytes=%zu\n", free_count, free_total);
  fprintf(stderr, "  gc: mark_sweeps=%zu forced=%zu sweep_assists=%zu\n",
          h->stats.mark_to_sweep_transitions,
          h->stats.forced_finish_cycles,
          h->stats.sweep_assist_steps);
}

bool heap_init(struct heap *restrict h,
               const struct runtime_args *restrict rargs) {
  size_t heap_size = rargs->base_size;
  size_t align = rargs->align;
  uint8_t *mem = aligned_alloc(align, heap_size);
  if (!mem)
    return false;

  *h = (struct heap){
      .base = mem,
      .limit = mem + heap_size,
      .free_list = nullptr,
      .sweep_cursor = nullptr,
      .gray = nullptr,
      .phase = GC_IDLE,
      .allocated_bytes = 0,
      .trigger_bytes = heap_size / 2,
      .live_bytes = 0,
      .heap_size = heap_size,
      .stats = {0},
      .args = *rargs,
  };

  free_block_init((struct free_block *)mem, (uint32_t)heap_size, nullptr);
  h->free_list = (struct free_block *)mem;

  return true;
}

void heap_deinit(struct heap *restrict h) {
  free(h->base);
  h->base = nullptr;
  h->limit = nullptr;
}

/* ---------- allocation ---------- */

COLD_HELPER void gc_publish_new_object(struct heap *h, void *ref) {
  if (h->phase == GC_MARK) {
    if (obj_has_gclist(obj_tag_of(ref))) {
      obj_set_gc_bits(ref, OBJ_FLAG_GC_GRAY);
      obj_set_gclist(ref, h->gray);
      h->gray = ref;
    } else {
      obj_set_gc_bits(ref, OBJ_FLAG_GC_BLACK);
    }
  } else if (h->phase == GC_SWEEP) {
    bool already_swept = (uint8_t *)ref < h->sweep_cursor;
    if (already_swept) {
      obj_set_gc_bits(ref, OBJ_FLAG_GC_WHITE);
      /* Sweep will not revisit this object; count it as live now so
         trigger_bytes at cycle end reflects the true working set. */
      h->live_bytes += object_align(obj_size(ref));
    } else {
      obj_set_gc_bits(ref, OBJ_FLAG_GC_BLACK);
    }
  }
}

static void *gc_sweep_until_allocable(struct state *restrict st,
                                      struct fiber_segment *restrict fiber,
                                      size_t n) {
  struct heap *h = st->heap;

  while (h->phase == GC_SWEEP) {
    gc_sweep_step(h, 4096);
    h->stats.sweep_assist_steps++;
    void *p = freelist_alloc(h, n);
    gc_poll_refresh(st, fiber);
    if (p)
      return p;
  }

  void *p = freelist_alloc(h, n);
  gc_poll_refresh(st, fiber);
  return p;
}

[[gnu::noinline]] static void *
alloc_object_fallback(struct state *restrict st,
                      struct fiber_segment *restrict fiber, size_t n,
                      val_t *bp) {
  struct heap *heap = st->heap;
  heap->stats.forced_finish_cycles++;
  gc_finish_cycle(fiber, heap, bp);
  void *p = freelist_alloc(heap, n);
  gc_poll_refresh(st, fiber);
  return p;
}

COLD_HELPER void *alloc_object(size_t n, struct fiber_segment *restrict fiber,
                               val_t *restrict bp) {
  struct state *st = fiber->state;
  n = object_align(n);
  void *p = freelist_alloc(st->heap, n);
  if (p != nullptr) {
    gc_poll_refresh(st, fiber);
    return p;
  }

  trace(st, TRACE_0, "alloc_object: free list exhausted, collecting garbage");

  if (st->heap->phase == GC_SWEEP) {
    p = gc_sweep_until_allocable(st, fiber, n);
    if (p != nullptr)
      return p;
    return nullptr;
  }

  return alloc_object_fallback(st, fiber, n, bp);
}
