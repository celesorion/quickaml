#ifndef QK_NATIVE_H
#define QK_NATIVE_H

#include "def.h"
#include "state.h"

/* A member the VM implements in C. It reads its arguments from the frame it
 * is applied in and either produces a result or returns the panic message. */
typedef const char *native_fn(struct fiber_segment *fiber, val_t *args,
                              val_t *out);

struct native {
  const char *name;
  uint8_t arity;
  native_fn *fn;
};

extern const struct native natives[];
extern const size_t nnatives;

#endif
