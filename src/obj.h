#ifndef QK_OBJ_H
#define QK_OBJ_H

#include "def.h"

#include <stddef.h>

struct function {
  bc_t *oplimit;
  bc_t ops[];
};

#define function_size(n_) (sizeof(struct function) + (n_)*sizeof(bc_t)) 

struct state {
  struct function *entry;
  struct function **fns;
  size_t numfn;
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

