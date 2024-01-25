#ifndef QK_OBJ_H
#define QK_OBJ_H

#include "def.h"
#include "frame.h"
#include "layout.h"
#include "lowptr.h"
#include "trace.h"

#include <stdio.h>

struct framedesc;
struct layoutdesc;

struct function {
  struct framedesc *desc;
  bc_t *oplimit;
  bc_t ops[];
};

#define function_size(n) (sizeof(struct function) + (n) * sizeof(bc_t))

// consider to align this with 64 bytes to save bits
struct objectdesc {
  struct layoutdesc layout;
};

struct object {
  metainfo hd;
  val_t fields[];
};

struct closure {
  metainfo hd;
  val_t fp;
  val_t args;
};

INLINE struct objectdesc *to_object_desc(metainfo hd) {
  return declowptr(hd).ptr;
}

INLINE size_t object_get_size(metainfo hd) {
  return to_object_desc(hd)->layout.size;
}

INLINE struct layoutdesc *object_get_layout(metainfo hd) {
  return &to_object_desc(hd)->layout;
}

INLINE metainfo object_make_header(struct objectdesc *x) {
  if (!islowptr(x)) {
    exit(exit_with_status(S_INVALID_OBJ_DESC));
  }
  return cutlowptr(enclowptr(x, 0));
}

INLINE void object_print(struct state *st, struct object *o) {
  (void)st;
  fprintf(stderr, "object %p\n", o);
  fprintf(stderr, "  layout: %p\n", object_get_layout(o->hd));
  fprintf(stderr, "  size: %zu\n", object_get_size(o->hd));
  fprintf(stderr, "  length: %u\n", object_get_layout(o->hd)->length);
  fprintf(stderr, "  kind: %u\n", object_get_layout(o->hd)->kind);
}

#endif
