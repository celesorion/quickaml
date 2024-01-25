#ifndef QK_TYPEDESC_H
#define QK_TYPEDESC_H

#include <stdlib.h>
#include <stdint.h>

#include "assert_assume.h"
#include "bitset.h"

enum {
  LAYOUT_RAW,            // a memory region with unknown layout
  LAYOUT_OPAQUE,         // an object but with unknown fields
  LAYOUT_CANONICAL,      // an object with all fields being pointers to other objects
  LAYOUT_HYBIRD,         // an object with some fields being pointers to other obejcts
};

struct layoutdesc {
  size_t size;
  uint8_t kind;
  uint32_t length;       // it might be the length of ptrmap or fields
  uint64_t ptrmap[];
};

static inline bool need_scan_fields(const struct layoutdesc *ld) {
  return ld->kind == LAYOUT_CANONICAL || ld->kind == LAYOUT_HYBIRD;
}

static inline size_t layoutdesc_pre_size(uint8_t kind, uint32_t length) {
  switch (kind) {
  case LAYOUT_RAW: case LAYOUT_OPAQUE:
  case LAYOUT_CANONICAL: return sizeof(struct layoutdesc);
  case LAYOUT_HYBIRD: return sizeof(struct layoutdesc) + sizeof(uint64_t) * length;
  default: return 0;
  }
}

static inline size_t layoutdesc_size(const struct layoutdesc *ld) {
  return layoutdesc_pre_size(ld->kind, ld->length);
}

static inline struct nextptr layout_hybird_ptr_scan_init(const struct layoutdesc *const ld) {
  assert_assume(ld->kind == LAYOUT_HYBIRD);
  return ptr_scan_init(ld->ptrmap);
}

static inline struct nextptr layout_hybird_ptr_next(struct nextptr prev, const struct layoutdesc *ld) {
  assert_assume(ld->kind == LAYOUT_HYBIRD);
  return ptr_next(prev, ld->ptrmap, ld->length);
}

static inline struct nextptr layout_canonical_ptr_scan_init() {
  return (struct nextptr){.index = NOT_FOUND, .mask = 0, .offset = -1};
}

static inline struct nextptr layout_canonical_ptr_next(struct nextptr prev, const struct layoutdesc *ld) {
  assert_assume(ld->kind == LAYOUT_CANONICAL);
  uint32_t off = prev.offset + 1;
  if (off >= ld->length * 64)
    return (struct nextptr){.index = NOT_FOUND, .mask = 0, .offset = 0};
  return (struct nextptr){.index = 0, .mask = 0, .offset = off};
}

#endif