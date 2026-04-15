#ifndef QK_STATE_H
#define QK_STATE_H

#include "def.h"
#include "object.h"

struct state {
  struct heap *heap;
  struct function *entry;
  struct function **fns;
  size_t numfn;
  size_t numobject;
  val_t *ctbl;
  val_t *stk;
  val_t *stklimit;
  const char *msg;
  struct runtime_args *rtargs;
  bool sc_jump;
};

bool state_init(struct state *restrict s, struct heap *restrict heap,
                struct runtime_args *restrict rtargs);

#endif
