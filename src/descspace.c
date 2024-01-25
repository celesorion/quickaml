#include "descspace.h"
#include "assert_assume.h"

bool descspace_init(struct descspace *space, struct runtime_args *rargs) {
  size_t size = rargs->descspace_size;
  space->size = size;
  void *p = alloclowptr(size, MEM_RW);
  if (p == nullptr)
    return false;
  space->start = p;
  assert_assume(size % sizeof(struct descunit) == 0);
  struct descunit *unit;
  for (size_t i = 0; i < size; i += sizeof(struct descunit)) {
    unit = (struct descunit *)((uint8_t *)p + i);
    unit->next = unit + 1;
  }
  unit->next = nullptr;
  space->free = (struct descunit *)p;
  return true;
}

void *descspace_alloc(struct descspace *space) {
  struct descunit *unit = space->free;
  if (unit == nullptr)
    return nullptr;
  space->free = unit->next;
  return unit;
}

void descspace_free(struct descspace *space, void *p) {
  struct descunit *unit = (struct descunit *)p;
  unit->next = space->free;
  space->free = unit;
}

