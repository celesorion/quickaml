#ifndef QK_OBJ_H
#define QK_OBJ_H

#include "def.h"
#include "trace.h"

#include <stdio.h>

struct framedesc;
struct layoutdesc;

struct function {
  bc_t *oplimit;
  bc_t ops[];
};

#define function_size(n) (sizeof(struct function) + (n) * sizeof(bc_t))

struct object {
  metainfo hd;
  val_t fields[];
};

struct closure {
  metainfo hd;
  val_t fp;
  val_t args;
};

#endif
