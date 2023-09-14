#ifndef QK_OBJ_H
#define QK_OBJ_H

#include "def.h"

struct function {
  bc_t *oplimit;
  bc_t ops[];
};

struct state {
  struct function *entry;
  struct function **fns;
  val_t *stk;
  val_t *stklimit;
};

struct object {
  obj_header hd;
  val_t fields[];
};

struct closure {
  obj_header hd;
  val_t fp;
  val_t args;
  val_t env[];  
};

#define closure_size(n) (sizeof(struct closure) + sizeof(val_t)*(n))

#endif

