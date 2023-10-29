#include "alloc.h"
#include "tls.h"

#include <stdlib.h>
#include <string.h>
#include <stdatomic.h>
#include <stdio.h>

thread_local struct tls_data tlsd;

/* clang will optimize this well but gcc won't */
static bool memiszero(void * ptr, size_t size) {
  char *p = ptr;
  size_t x = 1;
  for (size_t i = 0; i < size; i++)
    x &= p[i] == 0;
  return x == 1;
}

static uintptr_t align_up(uintptr_t addr, size_t align) {
  return (addr + align - 1) & -align;
}

static uintptr_t align_down(uintptr_t addr, size_t align) {
  return addr & -align;
}

bool is_in_emergent_collection() {
  return false;
}

static void *align_ptr(void *p, size_t align, ptrdiff_t offset) {
  uint8_t *q = p;
  ptrdiff_t mask = (ptrdiff_t)align - 1;
  ptrdiff_t delta = (-offset - (intptr_t)p) & mask;
  return q + delta;
}

static size_t maximum_aligned_size(size_t size, size_t align) {
  static const size_t MIN_ALIGNMENT = 4;
  if (align <= MIN_ALIGNMENT) return size;
  return size + align - MIN_ALIGNMENT;
}

static block_queue_t *block_queue_alloc() { 
  block_queue_t *new_queue = malloc(sizeof(block_queue_t));
  new_queue->cur = 0;
  return new_queue;
}

static bool block_queue_push(struct block_queue *queue, block_t *block) {
  size_t cur = queue->cur;
  if (cur < BLOCK_QUEUE_CAPACITY) {
    queue->data[cur] = block;
    queue->cur = cur + 1;
    return true;
  }
  return false;
}

static block_t *block_queue_pop(struct block_queue *queue, bool *empty) {
  size_t cur = queue->cur;
  if (cur > 0) {
    queue->cur = cur - 1;
    *empty = false;
    return queue->data[cur - 1];
  } else {
    *empty = true;
    return nullptr;
  }
}

static block_t *block_queue_pop_unchecked(struct block_queue *queue) {
  size_t cur = queue->cur;
  queue->cur = cur - 1;
  return queue->data[cur - 1];
}

static void block_queue_list_push_relaxed(struct block_queue_list *list, block_queue_t *queue) {
  block_queue_t *head = atomic_load_explicit(&list->head, memory_order_relaxed);
  queue->next = head;
  atomic_store_explicit(&list->head, queue, memory_order_relaxed);
}

static const struct block_queue empty_block_queue = {
  .cur = 0,
  .next = nullptr,
};

static block_t *block_pool_pop_reusable_tl_block(struct tls_data *tlsd) {
  block_queue_t *q = tlsd->non_empty_reusable;
  bool empty;
  block_t *block = block_queue_pop(q, &empty);
  if (empty) {
    // the non-empty block queue has been empty ... move to the empty block queue list
    block_queue_list_push_relaxed(&tlsd->empty_reusable, q);
    
    // try to pop a full one from the full block queue list
    block_queue_t *full = atomic_load_explicit(&tlsd->full_reusable.head, memory_order_relaxed);
    block_queue_t *nu;
    if (full == nullptr) {
      nu = (block_queue_t *)&empty_block_queue;
      return nullptr;
    } else {
      nu = full;
      block_queue_t *next = full->next;
      atomic_store_explicit(&tlsd->full_reusable.head, next, memory_order_relaxed);
      full->next = nullptr;
    }
    tlsd->non_empty_reusable = nu;
    return block_queue_pop_unchecked(nu);
  }
  return block;
}

static void block_pool_push_reusable_tl_block(struct tls_data *tlsd, block_t *block) {
  block_queue_t *q = tlsd->non_empty_reusable;
  bool succ = block_queue_push(q, block);
  if (!succ) {
    // the non-empty block queue is full now
    block_queue_list_push_relaxed(&tlsd->full_reusable, q);

    // try to pop an empty queue from `empty_reusable`
    block_queue_t *empty = atomic_load_explicit(&tlsd->empty_reusable.head, memory_order_relaxed);
    block_queue_t *nu;
    if (empty == nullptr) 
      // we need a new block queue
      nu = block_queue_alloc();
    else {
      nu = empty;
      block_queue_t *next = empty->next;
      atomic_store_explicit(&tlsd->empty_reusable.head, next, memory_order_relaxed);
      empty->next = nullptr;
    }
    tlsd->non_empty_reusable = nu;
    block_queue_push(nu, block);
  }
}

static bool block_state_is_reusable(uint8_t state) {
  return state >= BS_REUSABLE_S && state <= BS_REUSABLE_E;
}

static bool block_is_reusable(block_t *block) {
  return block_state_is_reusable(block->meta.block_mark);
}

static void block_set_state(block_t *block, uint8_t state) {
  atomic_store_explicit(&block->meta.block_mark, state, memory_order_release);
}

static void block_clear_in_place_promoted(block_t *block) {
  atomic_store_explicit(&block->meta.nursery_promoted, true, memory_order_relaxed);
}

static void block_set_defrag(block_t *block, bool defrag) {
  atomic_store_explicit(&block->meta.block_defrag, defrag ? 255 : 0, memory_order_release);
}

static void block_init(block_t *block, bool copy, bool reuse) {
  if (!reuse) block_clear_in_place_promoted(block);
  if (!copy && reuse) block_set_state(block, BS_REUSING);
  else {
    if (copy) { 
      block_set_state(block, BS_UNMARKED);
      block_set_defrag(block, false); 
    } else {
      block_set_state(block, BS_NURSERY);
      block_set_defrag(block, false); 
    }
  }
}

static bool block_attemp_mutator_reuse(block_t *block) {
  uint8_t next;
  uint8_t s = atomic_load_explicit(&block->meta.block_mark, memory_order_acquire);
  do {
    if (block_state_is_reusable(s)) next = BS_REUSING;
    else return false;
  } while (!atomic_compare_exchange_weak_explicit(&block->meta.block_mark, &s, next, memory_order_acquire, memory_order_acq_rel));

  return true;
}

static void *immix_space_acquire(size_t pages) {
  return malloc(pages * PAGE_BYTES);
}

static bool immix_space_get_reusable_block(struct immix_space *self, bool copy, block_t *(*found)[1]) {
  for (;;) {
    block_t *block;
    if ((block = block_pool_pop_reusable_tl_block(&tlsd))) {
      if (copy && block->meta.block_defrag > 0) continue;
      if (self->args->rc_mature_evacuation && block->meta.block_defrag) continue;
      if (!block_is_reusable(block)) continue;
      if (!copy && !block_attemp_mutator_reuse(block)) continue;
      if (!copy) 
        ; // TODO: pushed to the block allocation

      (*found)[0] = block;
      block_init(block, copy, true);
    } else {
      return false;
    }
  }
}

static block_t *immix_space_block_of_line(line_t *line) {
  uintptr_t v = (uintptr_t)line;
  return (block_t *)align_down(v, BLOCK_BYTES);
}

static block_t *immix_space_end_of_block(block_t *block) {
  return (block_t *)((uint8_t *)block + BLOCK_BYTES); 
}

static line_t *immix_space_end_line_of_block(block_t *block) {
  return (line_t *)((uint8_t *)block + BLOCK_BYTES); 
}

static line_t *immix_space_get_first_available_line(block_t *block) {
  return (line_t *)align_up((uintptr_t)block + sizeof(block_meta_t), LINE_BYTES);
}

static bool immix_space_rc_array_is_dead(block_t *block, size_t index) {
  return memiszero(block->meta.rc[index], sizeof(block->meta.rc[index])); 
}

static size_t immix_space_get_index_within_block(line_t *line) {
  line_t *start_line = (line_t *) immix_space_block_of_line(line);
  return line - start_line;
}

static void immix_space_inc_dead_bytes_sloppy(block_t *block, size_t bytes) {
  const size_t max_words = BLOCK_BYTES >> LOG_WORD_BYTES;
  size_t words = bytes >> LOG_WORD_BYTES;
  atomic_uint* p = &block->meta.dead_words; 
  unsigned old = atomic_load_explicit(p, memory_order_relaxed);
  unsigned new = old + (unsigned)words;
  if (new >= max_words)
    new = max_words - 1;
  atomic_store_explicit(p, new, memory_order_relaxed);
}

static void immix_space_dec_dead_bytes_sloppy(block_t *block, size_t bytes) {
  size_t words = bytes >> LOG_WORD_BYTES;
  atomic_uint* p = &block->meta.dead_words; 
  unsigned old = atomic_load_explicit(p, memory_order_relaxed);
  unsigned new = old <= words ? 0 : old - (unsigned)words;
  atomic_store_explicit(p, new, memory_order_relaxed);
}

static bool immix_space_rc_get_next_available_lines(struct immix_space *self, bool copy, line_t *(*found)[2], line_t *start) {
  block_t *block = immix_space_block_of_line(start);
  size_t limit = BLOCK_LINES;

  size_t start_cur = immix_space_get_index_within_block(start);
  line_t *first_free = nullptr;
  size_t i = start_cur;
  for (; i < limit; i++) {
    if (immix_space_rc_array_is_dead(block, i)) {
      first_free = (line_t *)block + i;
      break;
    }
  }
  if (first_free == nullptr)
    return false;
  
  for (i += 1; i < limit; i++) {
    if (!immix_space_rc_array_is_dead(block, i))
      break;
  }
  line_t *end = (line_t *)block + i; 
  size_t num = (size_t)(end - first_free);

  if (num < self->args->min_reuse_lines) {
    if (end == immix_space_end_line_of_block(block)) {
      return false;
    } else {
      return immix_space_rc_get_next_available_lines(self, copy, found, end);
    }
  }

  // log bits

  if (!copy)
    atomic_fetch_add_explicit(&self->reused_lines_consumed, num, memory_order_relaxed);
  immix_space_dec_dead_bytes_sloppy(block, num << LOG_LINE_BYTES);

  // TODO: lxr_srv_ratio

  // mark table
  
  (*found)[0] = first_free;
  (*found)[1] = end;

  return true;
}

static bool immix_space_get_next_available_lines(
    struct immix_space *self, bool copy, line_t *(*found)[2], line_t *start) {
  return immix_space_rc_get_next_available_lines(self, copy, found, start);
}

static bool immix_space_get_clean_block(bool copy, block_t *(*found)[1]) {
  void *p = immix_space_acquire(BLOCK_PAGES);
  if (p == nullptr)
    return false;
  
  block_t *block = p;
  if (!copy) {
    // TODO: push to block allocation
  }

  // TODO: init by block_allocation

  // TODO: lxr_srv_ratio
  (*found)[0] = block;
  return true;
}

static void *immix_alloc_internal(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset);
static void *immix_alloc_slow_once(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset, bool large);

[[gnu::always_inline]]
static void *immix_alloc_slow_inline(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset, bool large) {
  bool is_mutator = tlsd.is_mutator;

  bool emergent_collection = false;

  for (;;) {
    void *p = immix_alloc_slow_once(self, copy, size, align, offset, large);
    if (!is_mutator) return p;

    if (p != nullptr) {
      // TODO: notify allocation success

      return p;
    }

    if (emergent_collection && is_in_emergent_collection()) {
      // TODO: OOM things
      return nullptr;
    }

    emergent_collection = is_in_emergent_collection();
  }

  return nullptr;
}

static void *immix_alloc_large(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset) {
  uint8_t *r = align_ptr(self->large_cur, align, offset);
  uint8_t *new_cur = r + size;
  if (new_cur > self->large_limit) {
    return immix_alloc_slow_inline(self, copy, size, align, offset, true);
  }
  memset(self->large_cur, r - self->large_cur, 0x77);
  self->large_cur = new_cur;
  return r;
}

static bool immix_acquire_recyclable_block(struct immix_allocator *self, bool copy) { 
  if (self->space->args->no_mutator_line_recycling && !copy)
    return false;
  if (self->space->args->no_line_recycling)
    return false;

  block_t *block[1];
  bool succ = immix_space_get_reusable_block(self->space, copy, &block);
  if (succ)
    self->line = immix_space_get_first_available_line(block[0]);
  return succ;
}

static bool immix_acquire_recyclable_lines(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset) {
  (void) size; (void) align; (void) offset;
  while (self->line || immix_acquire_recyclable_block(self, copy)) {
    line_t *line = self->line;

    line_t *range[2];
    bool succ = immix_space_get_next_available_lines(self->space, copy, &range, line);
    if (succ) {
      self->cur = (uint8_t *)range[0];
      self->limit = (uint8_t *)range[1];

      if (!copy && self->space->args->zero)
        memset(self->cur, 0, self->limit - self->cur);

      block_t *block = immix_space_block_of_line(line);
      
      if (range[1] == immix_space_end_line_of_block(block))
        self->line = nullptr;
      else
        self->line = range[1];

      return true;
    } else {
      self->line = nullptr;
    }
  }
  return false;
}

static void *immix_acquire_clean_block(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset, bool large) {
  block_t *found[1];
  bool succ = immix_space_get_clean_block(copy, &found);
  if (!succ)
    return nullptr;
  block_t *block = found[0];
  if (large) {
    self->large_cur = (void *)immix_space_get_first_available_line(block);
    self->large_limit = (void *)immix_space_end_of_block(block);
  } else {
    self->cur = (void *)immix_space_get_first_available_line(block);
    self->limit = (void *)immix_space_end_of_block(block);
  }
  return immix_alloc(self, copy, size, align, offset); 
}

static void *immix_retry_alloc_slow_hot(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset) {
  if (self->space->args->only_retry_small_alloc
      && maximum_aligned_size(size, align) > LINE_BYTES)
    return nullptr;
  if (immix_acquire_recyclable_lines(self, copy, size, align, offset)) {
    uint8_t *r = align_ptr(self->cur, align, offset);
    uint8_t *new_cur = r + size;
    if (new_cur > self->limit) {
      return nullptr; 
    }
    memset(self->cur, r - self->cur, 0x77);
    self->cur = new_cur;
    return r;
  }
  return nullptr;
}

static void *immix_alloc_slow_hot(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset) {
  if (immix_acquire_recyclable_lines(self, copy, size, align, offset))
    return immix_alloc(self, copy, size, align, offset);
  return immix_alloc_slow_inline(self, copy, size, align, offset, false);
}

static void *immix_alloc_slow_once(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset, bool large) {
  if (self->space->args->only_retry_small_alloc) {
    void *p = immix_retry_alloc_slow_hot(self, copy, size, align, offset);
    if (p != nullptr)
      return p;
  }
  return immix_acquire_clean_block(self, copy, size, align, offset, large);
}

static void *immix_alloc_internal(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset) {
  uint8_t *r = align_ptr(self->cur, align, offset);
  uint8_t *new_cur = r + size;
  if (new_cur > self->limit) {
    if ((copy || self->space->args->no_mutator_line_recycling)
        && maximum_aligned_size(size, align) > LINE_BYTES)
      return immix_alloc_large(self, copy, size, align, offset);
    else
      return immix_alloc_slow_hot(self, copy, size, align, offset);
  }
  memset(self->cur, r - self->cur, 0x77);
  self->cur = new_cur;
  return r;
}

void *immix_alloc(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset) {
  return immix_alloc_internal(self, copy, size, align, offset);
}

static struct immix_allocator *g;

[[gnu::noinline]]
void *immix_malloc(size_t n) {
  return immix_alloc(g, false, n, 8, 0);
}

void immix_init() {
  g = immix_create_allocator();
  tlsd.non_empty_reusable = block_queue_alloc();
  tlsd.empty_reusable.head = nullptr;
  tlsd.full_reusable.head = nullptr;
  tlsd.is_mutator = true;
}
