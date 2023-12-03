#ifndef QK_OBJ_H
#define QK_OBJ_H

#include "def.h"
#include "ptrdesc.h"

#include <stddef.h>

struct ptrdesc;

struct function {
  struct ptrdesc *desc;
  bc_t *oplimit;
  bc_t ops[];
};

#define function_size(n) (sizeof(struct function) + (n)*sizeof(bc_t)) 

struct state {
  struct function *entry;
  struct function **fns;
  size_t numfn;
  const char *msg;
  val_t *ctbl;
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

#define object_length(hd) ((hd) & 0xffffffff)
#define object_size(hd) (sizeof(struct object) + sizeof(val_t) * object_length(hd))
#define closure_size(n) (sizeof(struct closure) + sizeof(val_t)*(n))

#endif

