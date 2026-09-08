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

enum capture_loc_kind {
  CAPTURE_LOC_SLOT = 0,
  CAPTURE_LOC_FREEVAR = 1,
};

struct capture_loc {
  uint16_t kind;
  uint16_t index;
};

INLINE val_t capture_loc_pack(struct capture_loc loc) {
  return ((val_t)loc.kind << 16) | loc.index;
}

INLINE uint16_t capture_loc_kind(val_t loc) { return (uint16_t)(loc >> 16); }

INLINE uint16_t capture_loc_index(val_t loc) { return (uint16_t)loc; }

struct thunk {
  metainfo hd;
  void *gclist;
  bc_t *ops;
  bc_t *oplimit;
  val_t *ctbl;
  size_t nconst;
  uint32_t nfree;
  uint8_t nregs;
  uint8_t pad[3];
  val_t freevars[];
};

/* Object tags, shared with Tag in bytecode.rs.  Words objects come first,
 * every slot of theirs is a val_t; from TAG_THUNK on the collector knows each
 * exotic layout one by one.  A negative tag marks a block that is not an
 * object at all.  Values the encoding carries itself have no tag. */
enum tag {
  TAG_TUPLE = 0,
  TAG_ARRAY = 1,
  TAG_MAP = 2,
  TAG_TYPE = 3,
  TAG_STRUCT = 4,
  TAG_THUNK = 5, /* exotic from here */
  TAG_STR = 6,
  TAG_OPAQUE = 7,
  TAG_FREE = -1, /* not an object */
};

INLINE bool obj_is_words(enum tag tag) { return (uint8_t)tag < TAG_THUNK; }

/* Words objects and thunks are scanned, so they queue on the gray list. */
INLINE bool obj_has_gclist(enum tag tag) { return (uint8_t)tag <= TAG_THUNK; }

/* Immutable, image-owned description of a struct type: its declared name and
 * the names of its fields, methods and functions, in three consecutive
 * groups. A runtime type value is a words object tagged TAG_TYPE holding the
 * description pointer in slot 0, then the closure of each method and of each
 * function; the image builds one per declaration outside the heap, see
 * vm_type_alloc. A struct instance is tagged TAG_STRUCT and holds its type
 * value in slot 0 followed by one slot per field; its methods are those of
 * the type value. */
struct member_desc {
  const char *name;
  uint32_t len;
};

struct type_desc {
  uint32_t nfields;
  uint32_t nmethods;
  uint32_t nfunctions;
  uint32_t namelen;
  const char *name;
  struct member_desc members[];
};

/*
 * NuN-boxed value layout.  A value is a double's IEEE754 bits plus 2^49 unless
 * its top 15 bits are all zero (a cell) or all one (an int).  This displaces
 * the 2^50 negative NaNs 0xfffc_0000_0000_0000..0xffff_ffff_ffff_ffff, about
 * the budget NaN boxing spends, split into two 49-bit spaces:
 *
 *   63           49 48  47                              3 2  1 0
 *  +---------------+---+---------------------------------+--+-+-+
 *  |000000000000000| 0 | object address, 8-byte aligned  |k |0|k| pointer
 *  |000000000000000| 0 |                0                |b |1|v| trivial
 *  +---------------+-----------------+--------------------------+
 *  |111111111111111|00000000000000000| int32, two's complement  | int
 *  +------------------------------------------------------------+
 *  |           otherwise: IEEE754 double bits + 2^49            | float
 *  +------------------------------------------------------------+
 *
 * pointer  bit 1 clear.  The low three bits are the kind: 000 untagged, the
 *          header decides; 001 closure; 100 type value; 101 string.  Bit 48
 *          is free.  VAL_EMPTY is the null pointer, so callers of val_is_ptr
 *          exclude it separately.
 * trivial  bit 1 (VAL_OTHER_TAG) set: VAL_NULL 0b010, then with bit 2
 *          (VAL_BOOL_TAG) VAL_FALSE 0b110 and VAL_TRUE 0b111.
 * int      val_is_int tests only the top 15 bits, so bits 48..32 are free.
 * float    val_as_f64 subtracts 2^49.  Nothing canonicalizes NaNs: a negative
 *          signalling NaN 0xfff4..0xfff7 is a legal float, but quieting it
 *          sets bit 51 and the result lands in the int space.
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
/* Pointer kinds in the alignment bits 0 and 2; bit 1 stays clear. */
#define VAL_KIND_MASK UINT64_C(0x7)
#define VAL_KIND_CLOSURE UINT64_C(0x1)
#define VAL_KIND_TYPE UINT64_C(0x4)
#define VAL_KIND_STR UINT64_C(0x5)

static_assert(sizeof(val_t) == 8, "NuN boxing requires 64-bit values");
static_assert(sizeof(metainfo) == 8, "object headers must stay 64-bit");

struct gc_header {
  metainfo hd;
  void *gclist;
};

struct object {
  metainfo hd;
  void *gclist;
  val_t fields[];
};

struct str {
  metainfo hd;
  char bytes[];
};

/* Native data the collector leaves alone.  A finalizer, when one was given,
 * fills the last word of the block and runs when the heap goes away. */
struct opaque {
  metainfo hd;
  unsigned char data[];
};

typedef void finalize_fn(void *data);

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

#define val_is_number_macro(value, tag) ((value) & (tag))

INLINE bool val_is_number(val_t value) {
  return val_is_number_macro(value, VAL_FLOAT_TAG);
}

#define val_is_int_macro(value, tag) (((value) & (tag)) == tag)

INLINE bool val_is_int(val_t value) {
  return val_is_int_macro(value, VAL_FLOAT_TAG);
}

#define val_is_float_macro(value, tag)                                         \
  val_is_number_macro(value, tag) && !val_is_int_macro(value, tag)

INLINE bool val_is_float(val_t value) {
  return val_is_float_macro(value, VAL_FLOAT_TAG);
}

/* A tagged kind is checked without touching the object; an untagged pointer
 * leaves the header to decide.  Handlers pass the pinned ft register as the
 * tag: x86-64 has no 64-bit immediate for the mask. */
#define val_is_kind_macro(value, kind, tag)                                    \
  (((value) & ((tag) + VAL_KIND_MASK)) == (kind))
#define val_is_closure_macro(value, tag)                                       \
  val_is_kind_macro(value, VAL_KIND_CLOSURE, tag)
#define val_is_type_macro(value, tag)                                          \
  val_is_kind_macro(value, VAL_KIND_TYPE, tag)
#define val_is_str_macro(value, tag)                                           \
  val_is_kind_macro(value, VAL_KIND_STR, tag)

INLINE bool val_is_closure(val_t value) {
  return val_is_closure_macro(value, VAL_FLOAT_TAG);
}

INLINE bool val_is_type(val_t value) {
  return val_is_type_macro(value, VAL_FLOAT_TAG);
}

INLINE bool val_is_str(val_t value) {
  return val_is_str_macro(value, VAL_FLOAT_TAG);
}

INLINE val_t val_from_kind(const void *ptr, val_t kind) {
  uintptr_t raw = (uintptr_t)ptr;
  assert(raw != VAL_EMPTY);
  assert((raw & (VAL_FLOAT_TAG | VAL_KIND_MASK)) == 0);
  return (val_t)raw | kind;
}

INLINE val_t val_from_ptr(void *ptr) { return val_from_kind(ptr, 0); }

INLINE val_t val_from_closure(struct thunk *thunk) {
  return val_from_kind(thunk, VAL_KIND_CLOSURE);
}

INLINE val_t val_from_type(struct object *type) {
  return val_from_kind(type, VAL_KIND_TYPE);
}

INLINE val_t val_from_str(struct str *str) {
  return val_from_kind(str, VAL_KIND_STR);
}

/* Any pointer, kind stripped. */
INLINE void *val_as_ptr(val_t value) {
  assert(val_is_ptr(value));
  return (void *)(uintptr_t)(value & ~VAL_KIND_MASK);
}

/* The kind is known here, so subtracting it folds into the field offsets. */
INLINE struct thunk *val_as_closure(val_t value) {
  assert(val_is_closure(value));
  return (struct thunk *)(uintptr_t)(value - VAL_KIND_CLOSURE);
}

INLINE struct object *val_as_type(val_t value) {
  assert(val_is_type(value));
  return (struct object *)(uintptr_t)(value - VAL_KIND_TYPE);
}

INLINE struct str *val_as_str(val_t value) {
  assert(val_is_str(value));
  return (struct str *)(uintptr_t)(value - VAL_KIND_STR);
}

#define val_from_i32_macro(num, tag) ((tag) | (uint32_t)num)

INLINE val_t val_from_i32(int32_t num) {
  return val_from_i32_macro(num, VAL_FLOAT_TAG);
}

#define val_as_i32_macro(value, _tag) ((int32_t)(uint32_t)(value))

INLINE int32_t val_as_i32(val_t value) {
  assert(val_is_int(value));
  return val_as_i32_macro(value, VAL_FLOAT_TAG);
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

#define val_from_f64_macro(num, tag) (bitcast_f64_to_val(num) - (tag))

INLINE val_t val_from_f64(double num) {
  return val_from_f64_macro(num, VAL_FLOAT_TAG);
}

#define val_as_f64_macro(value, tag) (bitcast_val_to_f64((value) + (tag)))

INLINE double val_as_f64(val_t value) {
  assert(val_is_float(value));
  return val_as_f64_macro(value, VAL_FLOAT_TAG);
}

/* Object header: tag(8) | flags(8) | spare(16) | size(32).  The tag sits in
 * the low byte so a tag test is one byte load and one compare. */
INLINE metainfo obj_meta_pack(uint32_t size, enum tag tag, uint8_t flags) {
  return (metainfo)(uint8_t)tag | ((metainfo)flags << 8) |
         ((metainfo)size << 32);
}

INLINE size_t obj_size(const void *ref) {
  const struct object *obj = ref;
  return (size_t)(obj->hd >> 32);
}

INLINE enum tag obj_tag_of(const void *ref) {
  const struct object *obj = ref;
  return (enum tag)(int8_t)obj->hd;
}

INLINE uint8_t obj_flags_of(const void *ref) {
  const struct object *obj = ref;
  return (uint8_t)(obj->hd >> 8);
}

#define OBJ_FLAG_GC_MASK (UINT64_C(0x03) << 8)
#define OBJ_FLAG_GC_WHITE (UINT64_C(0x00) << 8)
#define OBJ_FLAG_GC_GRAY (UINT64_C(0x01) << 8)
#define OBJ_FLAG_GC_BLACK (UINT64_C(0x02) << 8)

INLINE metainfo obj_gc_bits(const void *ref) {
  const struct object *obj = ref;
  return obj->hd & OBJ_FLAG_GC_MASK;
}

INLINE void obj_set_gc_bits(void *ref, metainfo bits) {
  struct object *obj = (struct object *)ref;
  obj->hd = (obj->hd & ~OBJ_FLAG_GC_MASK) | bits;
}

/* The printer marks the values it is inside, to cut cycles; the bit is
 * clear again when it returns. */
#define OBJ_FLAG_PRINT_PATH (UINT64_C(0x04) << 8)

#define OBJ_FLAG_FINALIZER (UINT64_C(0x08) << 8)

INLINE void *obj_gclist(const void *ref) {
  const struct gc_header *gc = ref;
  return gc->gclist;
}

INLINE void obj_set_gclist(void *ref, void *next) {
  struct gc_header *gc = ref;
  gc->gclist = next;
}

INLINE const struct type_desc *type_desc_of(const struct object *type) {
  return val_as_ptr(type->fields[0]);
}

INLINE size_t object_align(size_t n) { return (n + 7u) & ~7u; }

INLINE size_t thunk_instance_size(size_t nfree) {
  return object_align(sizeof(struct thunk) + nfree * sizeof(val_t));
}

INLINE size_t thunk_ops_offset(size_t nfree) {
  return thunk_instance_size(nfree);
}

INLINE size_t thunk_constants_offset(size_t nops, size_t nfree) {
  size_t ops_end = thunk_ops_offset(nfree) + nops * sizeof(bc_t);
  size_t align = _Alignof(val_t);
  return (ops_end + align - 1) & ~(align - 1);
}

INLINE size_t thunk_size(size_t nops, size_t nconst, size_t nfree) {
  return object_align(thunk_constants_offset(nops, nfree) +
                      nconst * sizeof(val_t));
}

INLINE size_t object_size(size_t nfields) {
  return object_align(sizeof(struct object) + nfields * sizeof(val_t));
}

INLINE size_t object_nfields(const void *ref) {
  return (obj_size(ref) - sizeof(struct object)) / sizeof(val_t);
}

INLINE size_t str_len(const void *ref) {
  return obj_size(ref) - sizeof(struct str) - 1;
}

INLINE size_t str_size(size_t len) {
  return object_align(sizeof(struct str) + len + 1);
}

INLINE size_t opaque_size(size_t n, finalize_fn *finalize) {
  return object_align(sizeof(struct opaque) + n) +
         (finalize == nullptr ? 0 : sizeof finalize);
}

INLINE finalize_fn *opaque_finalizer(const struct opaque *o) {
  finalize_fn *finalize = nullptr;
  if (o->hd & OBJ_FLAG_FINALIZER)
    memcpy(&finalize, (const char *)o + obj_size(o) - sizeof finalize,
           sizeof finalize);
  return finalize;
}

INLINE void opaque_finalize(struct opaque *o) {
  finalize_fn *finalize = opaque_finalizer(o);
  if (finalize != nullptr)
    finalize(o->data);
}

struct free_block {
  metainfo hd;
  struct free_block *next;
};

INLINE void free_block_init(struct free_block *blk, size_t size,
                            struct free_block *next) {
  blk->hd = obj_meta_pack((uint32_t)size, TAG_FREE, 0);
  blk->next = next;
}

COLD_HELPER void object_init(struct object *obj, enum tag tag, size_t nfields);
COLD_HELPER void str_init(struct str *str, size_t len);
COLD_HELPER void opaque_init(struct opaque *o, size_t n,
                             finalize_fn *finalize);
COLD_HELPER void thunk_init(struct thunk *thunk, size_t nops, size_t nconst,
                            uint8_t nregs, size_t nfree);
COLD_HELPER void thunk_instance_init(struct thunk *thunk,
                                     const struct thunk *template);
char *obj_format(val_t value);
COLD_HELPER void obj_print(FILE *out, val_t value);

#endif
