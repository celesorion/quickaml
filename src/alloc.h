#ifndef QK_ALLOC_H
#define QK_ALLOC_H

#include <stdatomic.h>
#include <stdalign.h>
#include <stdlib.h>

#define LOG_WORD_BYTES  3u
#define WORD_BYTES      (1ul << LOG_WORD_BYTES)

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

#define LOG_RC_LOCK_BITS  0u
#define RC_LOCK_BITS      (1ul << LOG_RC_LOCK_BITS)

#define LOG_RC_BITS_PER_LINE  (LOG_LINE_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS)
#define LOG_RC_BITS_PER_BLOCK (LOG_BLOCK_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS)
#define RC_BITS_PER_LINE      (1ul << LOG_RC_BITS_PER_LINE)
#define RC_BITS_PER_BLOCK     (1ul << LOG_RC_BITS_PER_BLOCK)

#define LOG_RC_BYTES_PER_LINE  (LOG_LINE_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS - LOG_BYTE_BITS)
#define LOG_RC_BYTES_PER_BLOCK (LOG_BLOCK_BYTES - LOG_MIN_OBJECT_SIZE + LOG_RC_BITS - LOG_BYTE_BITS)
#define RC_BYTES_PER_LINE      (1ul << LOG_RC_BYTES_PER_LINE)
#define RC_BYTES_PER_BLOCK     (1ul << LOG_RC_BYTES_PER_BLOCK)

#define LOG_BLOCK_MARK_BITS   3u
#define BLOCK_MARK_BITS       (1ul << LOG_BLOCK_MARK_BITS)
#define LOG_BLOCK_MARK_BYTES  (LOG_BLOCK_MARK_BITS - LOG_BYTE_BITS)
#define BLOCK_MARK_BYTES      (1ul << LOG_BLOCK_MARK_BYTES)
static_assert(BLOCK_MARK_BYTES == sizeof(atomic_uchar));

#define LOG_BLOCK_DEFRAG_BITS   3u
#define BLOCK_DEFRAG_BITS       (1ul << LOG_BLOCK_DEFRAG_BITS)
#define LOG_BLOCK_DEFRAG_BYTES  (LOG_BLOCK_DEFRAG_BITS - LOG_BYTE_BITS)
#define BLOCK_DEFRAG_BYTES      (1ul << LOG_BLOCK_DEFRAG_BYTES)
static_assert(BLOCK_DEFRAG_BYTES == sizeof(atomic_uchar));

#define LOG_BLOCK_DEAD_WORDS_BITS   5u
#define BLOCK_DEAD_WORDS_BITS       (1ul << LOG_BLOCK_DEAD_WORDS_BITS)
#define LOG_BLOCK_DEAD_WORDS_BYTES  (LOG_BLOCK_DEAD_WORDS_BITS - LOG_BYTE_BITS)
#define BLOCK_DEAD_WORDS_BYTES      (1ul << LOG_BLOCK_DEAD_WORDS_BYTES)
static_assert(BLOCK_DEAD_WORDS_BYTES == sizeof(atomic_uint));

#define LOG_LINE_MARK_BITS   3u
#define LINE_MARK_BITS       (1ul << LOG_LINE_MARK_BITS)
#define LOG_LINE_MARK_BYTES  (LOG_LINE_MARK_BITS - LOG_BYTE_BITS)
#define LINE_MARK_BYTES      (1ul << LOG_LINE_MARK_BYTES)
static_assert(LINE_MARK_BYTES == sizeof(atomic_uchar));

#define LOG_LINE_VALIDITY_BITS   3u
#define LINE_VALIDITY_BITS       (1ul << LOG_LINE_VALIDITY_BITS)
#define LOG_LINE_VALIDITY_BYTES  (LOG_LINE_VALIDITY_BITS - LOG_BYTE_BITS)
#define LINE_VALIDITY_BYTES      (1ul << LOG_LINE_VALIDITY_BYTES)
static_assert(LINE_VALIDITY_BYTES == sizeof(atomic_uchar));

#define LOG_STRADDLE_LINE_MARK_BITS   3u
#define STRADDLE_LINE_MARK_BITS       (1ul << LOG_STRADDLE_LINE_MARK_BITS)
#define LOG_STRADDLE_LINE_MARK_BYTES  (LOG_STRADDLE_LINE_MARK_BITS - LOG_BYTE_BITS)
#define STRADDLE_LINE_MARK_BYTES      (1ul << LOG_STRADDLE_LINE_MARK_BYTES)
static_assert(STRADDLE_LINE_MARK_BYTES == sizeof(atomic_uchar));

#define LOG_BLOCK_LOG_BITS   0u
#define BLOCK_LOG_BITS       (1ul << LOG_BLOCK_LOG_BITS)

#define BLOCK_QUEUE_CAPACITY 256

struct runtime_args {
  size_t min_reuse_lines;
  bool no_mutator_line_recycling;
  bool no_line_recycling;
  bool rc_mature_evacuation;
  bool only_retry_small_alloc;
  bool zero;
};

struct common_space {
  void *start;
  size_t size;
};

typedef struct {
  uint8_t data[LINE_BYTES];
} line_t;

typedef union block_s block_t;

enum {
  BS_UNALLOCATED = 0,
  BS_REUSABLE_S  = 1,
  BS_REUSABLE_E  = 251,
  BS_REUSING     = 252,
  BS_NURSERY     = 253,
  BS_MARED       = 254,
  BS_UNMARKED    = 255,
};

typedef struct {
  uint8_t rc[BLOCK_LINES][RC_BYTES_PER_LINE];
  uint8_t straddle_line_marks[BLOCK_LINES][STRADDLE_LINE_MARK_BYTES];
  uint8_t line_marks[BLOCK_LINES][LINE_MARK_BYTES];
  atomic_uchar line_validity[BLOCK_LINES];
  alignas(4) atomic_uint dead_words;
  alignas(4) atomic_uchar block_mark;
  alignas(4) atomic_uchar block_defrag;
  alignas(4) atomic_bool block_log;
  alignas(4) atomic_bool nursery_promoted;
} block_meta_t;

typedef union block_s {
  uint8_t data[BLOCK_BYTES];
  block_meta_t meta;
} block_t;

typedef struct block_queue block_queue_t;

struct block_queue {
  size_t cur;
  block_queue_t * next;
  block_t *data[BLOCK_QUEUE_CAPACITY];
};

struct block_queue_list {
  _Atomic(block_queue_t *) head;
};

struct immix_space {
  atomic_size_t lines_consumed;
  atomic_size_t reused_lines_consumed;
  const struct runtime_args *args;
};

struct immix_allocator {
  uint8_t *cur;
  uint8_t *limit;
  uint8_t *large_cur;
  uint8_t *large_limit;
  line_t *line;
  struct immix_space *space;
};


inline static void immix_reset(struct immix_allocator *self) {
  self->cur = self->limit = nullptr;
  self->large_cur = self->large_limit = nullptr;
  self->line = nullptr;
}

inline static struct runtime_args *immix_create_runtime_args() {
  struct runtime_args *ra = malloc(sizeof(struct runtime_args));
  
  ra->min_reuse_lines = 2;
  ra->no_line_recycling = true;
  ra->only_retry_small_alloc = true;
  ra->rc_mature_evacuation = false;
  ra->zero = true;
  ra->no_mutator_line_recycling = true;

  return ra;
}

inline static struct immix_space *immix_create_space() {
  struct immix_space *space = malloc(sizeof(struct immix_space));

  space->lines_consumed = 0;
  space->reused_lines_consumed = 0;
  space->args = immix_create_runtime_args();

  return space;
}

inline static struct immix_allocator *immix_create_allocator() {
  struct immix_allocator *allocator = malloc(sizeof(struct immix_allocator));

  allocator->cur = nullptr;
  allocator->limit = nullptr;
  allocator->large_cur = nullptr;
  allocator->large_limit = nullptr;
  allocator->line = nullptr;
  allocator->space = immix_create_space();

  return allocator;
}

void *immix_alloc(struct immix_allocator *self, bool copy, size_t size, size_t align, size_t offset); 
void immix_init();
void *immix_malloc(size_t n);

#endif
