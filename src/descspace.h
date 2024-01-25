#ifndef QK_DESCSPACE_H
#define QK_DESCSPACE_H

#include "lowptr.h"
#include "def.h"

#define DESCUNIT_SIZE 64

struct descunit {
  union {
    uint8_t _dummy[DESCUNIT_SIZE];
    struct descunit *next;
  };
};

struct descspace {
  void *start;
  size_t size;
  struct descunit *free;
};

bool descspace_init(struct descspace *restrict space, struct runtime_args *restrict rargs);
void *descspace_alloc(struct descspace *space);
void descspace_free(struct descspace *space, void *ptr);

#endif