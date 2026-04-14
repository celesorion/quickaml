#ifndef QK_OBJ_H
#define QK_OBJ_H

#include "def.h"

#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

struct heap;
struct state;

struct function {
  bc_t *oplimit;
  val_t *ctbl;
  size_t nconst;
  bc_t ops[];
};

INLINE size_t function_constants_offset(size_t nops) {
  size_t ops_end = sizeof(struct function) + nops * sizeof(bc_t);
  size_t align = _Alignof(val_t);
  return (ops_end + align - 1) & ~(align - 1);
}

INLINE size_t function_size(size_t nops, size_t nconst) {
  return function_constants_offset(nops) + nconst * sizeof(val_t);
}

enum obj_kind {
  OBJ_WORDS,
  OBJ_STRING,
  OBJ_CLOSURE,
  OBJ_FORWARD,
};

enum {
  OBJ_TAG_CLOSURE = 0xffff,
};

/* Bytecode-level type tags.  Must stay in sync with Tag in bytecode.rs.
 * Tags below TAG_INT are encoded directly as values by `mobj`;
 * tags >= TAG_INT require heap-backed materialization. */
enum tag {
  TAG_UNIT = 0,
  TAG_TUPLE = 1,
  TAG_FALSE = 2,
  TAG_TRUE = 3,
  TAG_INT = 4,
  TAG_STR = 5,
};

/*
 * NuN-boxed value layout:
 * - low canonical 48-bit values are raw heap pointers
 * - 0xfffe:0000:iiii:iiii are tagged 32-bit signed integers
 * - low non-pointer values are reserved for trivial tagged-pointer values
 * - everything else is a double encoded by adding 2^49 to the IEEE754 bits
 */
#define VAL_NUN_BIAS UINT64_C(0x0002000000000000)
#define VAL_FLOAT_TAG UINT64_C(0xfffe000000000000)
#define VAL_OTHER_TAG UINT64_C(0x2)
#define VAL_BOOL_TAG UINT64_C(0x4)
#define VAL_BOOL_VAL_BIT UINT64_C(0x1) /* distinguishes true from false */
#define VAL_NOT_CELL_MASK (VAL_FLOAT_TAG | VAL_OTHER_TAG)
#define VAL_EMPTY UINT64_C(0x0)
#define VAL_NULL VAL_OTHER_TAG
#define VAL_FALSE (VAL_OTHER_TAG | VAL_BOOL_TAG)
#define VAL_TRUE (VAL_OTHER_TAG | VAL_BOOL_TAG | VAL_BOOL_VAL_BIT)

static_assert(sizeof(val_t) == 8, "NuN boxing requires 64-bit values");
static_assert(sizeof(metainfo) == 8, "object headers must stay 64-bit");

struct object {
  metainfo hd;
  val_t fields[];
};

struct str {
  metainfo hd;
  char bytes[];
};

struct closure {
  metainfo hd;
  struct function *fn;
  uint32_t nfree;
  uint32_t pad;
  val_t freevars[];
};

INLINE bool val_is_empty(val_t value) { return value == VAL_EMPTY; }

INLINE bool val_is_null(val_t value) { return value == VAL_NULL; }

INLINE bool val_is_false(val_t value) { return value == VAL_FALSE; }

INLINE bool val_is_true(val_t value) { return value == VAL_TRUE; }

/* Mask out the value bit; both false and true collapse to VAL_FALSE. */
INLINE bool val_is_bool(val_t value) {
  return (value & ~VAL_BOOL_VAL_BIT) == VAL_FALSE;
}

/* Falsy values are null and false.  Mask out the bool tag so that
 *   null  (OTHER)            -> OTHER  == VAL_NULL  ✓
 *   false (OTHER | BOOL)     -> OTHER  == VAL_NULL  ✓
 *   true  (OTHER | BOOL | 1) -> OTHER | 1  ≠ VAL_NULL
 * Everything else has different tag bits and cannot match. */
INLINE bool val_is_falsy(val_t value) {
  return (value & ~VAL_BOOL_TAG) == VAL_NULL;
}

INLINE bool val_is_cell(val_t value) { return !(value & VAL_NOT_CELL_MASK); }

INLINE bool val_is_ptr(val_t value) {
  return val_is_cell(value) /* && !val_is_empty(value) */;
}

INLINE bool val_is_number(val_t value) { return value & VAL_FLOAT_TAG; }

INLINE bool val_is_int(val_t value) {
  return (value & VAL_FLOAT_TAG) == VAL_FLOAT_TAG;
}

INLINE bool val_is_float(val_t value) {
  return val_is_number(value) && !val_is_int(value);
}

INLINE val_t val_from_ptr(void *ptr) {
  uintptr_t raw = (uintptr_t)ptr;
  assert(raw != VAL_EMPTY);
  assert((raw & VAL_NOT_CELL_MASK) == 0);
  return (val_t)raw;
}

INLINE void *val_as_ptr(val_t value) {
  assert(val_is_ptr(value));
  return (void *)(uintptr_t)value;
}

INLINE val_t val_from_i32(int32_t num) { return VAL_FLOAT_TAG | (uint32_t)num; }

INLINE int32_t val_as_i32(val_t value) {
  assert(val_is_int(value));
  return (int32_t)(uint32_t)value;
}

INLINE val_t val_from_bool(bool value) { return value ? VAL_TRUE : VAL_FALSE; }

INLINE bool val_as_bool(val_t value) {
  assert(val_is_bool(value));
  return value == VAL_TRUE;
}

INLINE val_t val_from_null(void) { return VAL_NULL; }

INLINE val_t bitcast_f64_to_val(double num) {
  val_t raw = 0;
  memcpy(&raw, &num, sizeof(raw));
  return raw;
}

INLINE double bitcast_val_to_f64(val_t raw) {
  double num = 0.0;
  memcpy(&num, &raw, sizeof(num));
  return num;
}

INLINE val_t val_from_f64(double num) {
  return bitcast_f64_to_val(num) + VAL_NUN_BIAS;
}

INLINE double val_as_f64(val_t value) {
  assert(val_is_float(value));
  return bitcast_val_to_f64(value - VAL_NUN_BIAS);
}

INLINE metainfo obj_meta_pack(uint32_t size, uint16_t tag, uint8_t kind,
                              uint8_t flags) {
  return (metainfo)size | ((metainfo)tag << 32) | ((metainfo)kind << 48) |
         ((metainfo)flags << 56);
}

INLINE size_t obj_size(const void *ref) {
  const struct object *obj = ref;
  return (size_t)(obj->hd & UINT64_C(0xffffffff));
}

INLINE uint16_t obj_layout_tag(const void *ref) {
  const struct object *obj = ref;
  return (uint16_t)((obj->hd >> 32) & UINT64_C(0xffff));
}

INLINE enum obj_kind obj_kind_of(const void *ref) {
  const struct object *obj = ref;
  return (enum obj_kind)((obj->hd >> 48) & UINT64_C(0xff));
}

INLINE uint8_t obj_flags_of(const void *ref) {
  const struct object *obj = ref;
  return (uint8_t)((obj->hd >> 56) & UINT64_C(0xff));
}

val_t val_from_tag(uint8_t tag);
uint8_t val_tag(val_t value);

INLINE size_t object_align(size_t n) { return (n + 7u) & ~7u; }

INLINE size_t object_size(size_t nfields) {
  return object_align(sizeof(struct object) + nfields * sizeof(val_t));
}

INLINE size_t str_len(const void *ref) {
  return obj_size(ref) - sizeof(struct str) - 1;
}

INLINE size_t str_size(size_t len) {
  return object_align(sizeof(struct str) + len + 1);
}

INLINE size_t closure_size(size_t nfree) {
  return object_align(sizeof(struct closure) + nfree * sizeof(val_t));
}

void object_init(struct object *obj, uint16_t tag, size_t nfields);
void str_init(struct str *str, uint16_t tag, size_t len);
void closure_init(struct closure *clos, struct function *fn, size_t nfree);

void obj_set_forward(void *from_ref, size_t size, void *to_ref);
void *obj_forwardee(const void *ref);

void obj_print(FILE *out, val_t value);

#endif
