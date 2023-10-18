#include <stdatomic.h>
#include <threads.h>
#include <memory.h>

#include "def.h"

struct runtime_args {
  size_t min_reuse_lines;
};

struct common_space {
  void *start;
  size_t size;
  mtx_t acq_lock;
};

struct immix_space {
  uint8_t *rc_table;
  atomic_size_t lines_consumed;
  atomic_size_t reused_lines_consumed;
  struct common_space space;
  struct runtime_args *args;
};

#define LOG_BYTE_BITS   3u
#define BYTE_BITS       (1ul << LOG_BYTE_BITS)

#define LOG_MIN_OBJECT_SIZE 3u
#define MIN_OBJECT_SIZE     (1ul << LOG_MIN_OBJECT_SIZE)

#define LOG_LINE_BYTES  9u
#define LOG_BLOCK_BYTES 13u
#define LOG_PAGE_BYTES  12u  /* for 4KB pages */
#define LOG_BLOCK_PAGES (LOG_BLOCK_BYTES - LOG_PAGE_BYTES)
#define LOG_BLOCK_LINES (LOG_BLOCK_BYTES - LOG_LINE_BYTES)
#define BLOCK_BYTES     (1ul << LOG_BLOCK_BYTES)
#define LINE_BYTES      (1ul << LOG_LINE_BYTES)
#define PAGE_BYTES      (1ul << LOG_PAGE_BYTES)
#define BLOCK_PAGES     (1ul << LOG_BLOCK_PAGES)
#define BLOCK_LINES     (1ul << LOG_BLOCK_LINES)

#define LOG_RC_BITS     1u
#define RC_BITS         (1ul << LOG_RC_BITS)

#define LOG_RC_BITS_PER_LINE  (LOG_LINE_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS)
#define LOG_RC_BITS_PER_BLOCK (LOG_BLOCK_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS)
#define RC_BITS_PER_LINE      (1ul << LOG_RC_BITS_PER_LINE)
#define RC_BITS_PER_BLOCK     (1ul << LOG_RC_BITS_PER_BLOCK)

#define LOG_RC_BYTES_PER_LINE  (LOG_LINE_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS - LOG_BYTE_BITS)
#define LOG_RC_BYTES_PER_BLOCK (LOG_BLOCK_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS - LOG_BYTE_BITS)
#define RC_BYTES_PER_LINE      (1ul << LOG_RC_BYTES_PER_LINE)
#define RC_BYTES_PER_BLOCK     (1ul << LOG_RC_BYTES_PER_BLOCK)

typedef struct {
  uint8_t data[LINE_BYTES];
} line_t;

typedef struct {
  uint8_t data[BLOCK_BYTES];
} block_t;

typedef struct {
  uint8_t data[BLOCK_LINES][RC_BYTES_PER_LINE];
} rc_array_t;

struct immix_allocator {
  uint8_t *cur;
  uint8_t *limit;
  uint8_t *large_cur;
  uint8_t *large_limit;
  line_t *line;
  thrd_t thread;
  struct immix_space *space;
};

/* clang will optimize this well but gcc won't */
bool memzero(void * ptr, size_t size) {
  char *p = ptr;
  size_t x = 1;
  for (size_t i = 0; i < size; i++)
    x &= p[i] == 0;
  return x == 1;
}

uintptr_t align_up(uintptr_t addr, size_t align) {
  return (addr + align - 1) & -align;
}

uintptr_t align_down(uintptr_t addr, size_t align) {
  return addr & -align;
}

uintptr_t addr_to_meta_addr(void *base, uintptr_t addr, unsigned log_meta_bits, unsigned log_region_bytes) {
  uintptr_t p = (uintptr_t) base;
  unsigned shift = (LOG_BYTE_BITS - log_meta_bits);
  return p + ((addr >> log_region_bytes) >> (shift > 0 ? shift : -shift));
}

void immix_reset(struct immix_allocator *self) {
  self->cur = self->limit = nullptr;
  self->large_cur = self->large_limit = nullptr;
  self->line = nullptr;
}

void *align_ptr(void *p, size_t align, ptrdiff_t offset) {
  uint8_t *q = p;
  ptrdiff_t mask = (ptrdiff_t)align - 1;
  ptrdiff_t delta = (-offset - (intptr_t)p) & mask;
  return q + delta;
}

size_t maximum_aligned_size(size_t size, size_t align) {
  static const size_t MIN_ALIGNMENT = 4;
  if (align <= MIN_ALIGNMENT) return size;
  return size + align - MIN_ALIGNMENT;
}

block_t *immix_space_block_of_line(line_t *line) {
  uintptr_t v = (uintptr_t)line;
  return (block_t *)align_down(v, BLOCK_BYTES);
}

line_t *immix_space_end_line_of_block(block_t *block) {
  return (line_t *)((uint8_t *)block + BLOCK_BYTES); 
}

bool immix_space_rc_array_is_dead(rc_array_t *rc, size_t index) {
  return memzero(rc->data[index], sizeof(rc->data[index])); 
}

size_t immix_space_get_index_within_block(line_t *line) {
  line_t *start_line = (line_t *) immix_space_block_of_line(line);
  return line - start_line;
}

bool immix_space_rc_get_next_available_lines(struct immix_space *self, bool copy, line_t *(*found)[2], line_t *start) {
  block_t *block = immix_space_block_of_line(start);
  rc_array_t *rc = (rc_array_t *)addr_to_meta_addr(self->rc_table, (uintptr_t)block, LOG_RC_BITS, LOG_MIN_OBJECT_SIZE);
  size_t limit = BLOCK_LINES;

  size_t start_cur = immix_space_get_index_within_block(start);
  line_t *first_free = nullptr;
  size_t i = start_cur;
  for (; i < limit; i++) {
    if (immix_space_rc_array_is_dead(rc, i)) {
      first_free = (line_t *)block + i;
      break;
    }
  }
  if (first_free == nullptr)
    return false;
  
  for (i += 1; i < limit; i++) {
    if (!immix_space_rc_array_is_dead(rc, i))
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

  // TODO: log bits

  if (!copy)
    atomic_fetch_add_explicit(&self->reused_lines_consumed, num, memory_order_relaxed);

  // Many TODOs here
  
  (*found)[0] = first_free;
  (*found)[1] = end;

  return true;
}

bool immix_space_get_next_available_lines(
    struct immix_space *self, bool copy, line_t *(*found)[2], line_t *start) {
  return immix_space_rc_get_next_available_lines(self, copy, found, start);
}


void *immix_alloc(struct immix_allocator *self, size_t size, size_t align, size_t offset);

[[gnu::always_inline]]
static void *immix_alloc_slow_inline(struct immix_allocator *self, size_t size, size_t align, size_t offset, bool large) {
  // TODO
  return nullptr;
}

void *immix_alloc_large(struct immix_allocator *self, size_t size, size_t align, size_t offset) {
  uint8_t *r = align_ptr(self->large_cur, align, offset);
  uint8_t *new_cur = r + size;
  if (new_cur > self->large_limit) {
    return immix_alloc_slow_inline(self, size, align, offset, true);
  }
  memset(self->large_cur, r - self->large_cur, 0x77);
  self->large_cur = new_cur;
  return r;
}

bool immix_acquire_recyclable_block(struct immix_allocator *self) { 
  return false;
}

bool immix_acquire_recyclable_lines(struct immix_allocator *self, size_t size, size_t align, size_t offset) {
  while (self->line || immix_acquire_recyclable_block(self)) {
    // TODO
  }
  return false;
}

void *immix_alloc_slow_hot(struct immix_allocator *self, size_t size, size_t align, size_t offset) {
  if (immix_acquire_recyclable_lines(self, size, align, offset))
    return immix_alloc(self, size, align, offset);
  return immix_alloc_slow_inline(self, size, align, offset, false);
}

void *immix_alloc(struct immix_allocator *self, size_t size, size_t align, size_t offset) {
  uint8_t *r = align_ptr(self->cur, align, offset);
  uint8_t *new_cur = r + size;
  if (new_cur > self->limit) {
    if (maximum_aligned_size(size, align) > LINE_BYTES)
      return immix_alloc_large(self, size, align, offset);
    else
      return immix_alloc_slow_hot(self, size, align, offset);
  }
  memset(self->cur, r - self->cur, 0x77);
  self->cur = new_cur;
  return r;
}


