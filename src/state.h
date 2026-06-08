#ifndef QK_STATE_H
#define QK_STATE_H

#include "def.h"
#include "object.h"

struct state;

union fiber_stklimit {
  val_t *active;
  struct {
    uint32_t allocated_slots;
    uint32_t used_slots;
  } inactive;
};

struct fiber_segment {
  struct state *state;
  struct fiber_segment *parent;
  val_t *ctbl;
  val_t sync_addr;
  val_t spawn_addr;
  val_t effect_hnd;
  union fiber_stklimit stklimit;
  bool sc_jump;
  bool gc_poll_not_required;
  val_t stk[];
};

struct state {
  struct heap *heap;
  struct thunk *entry;
  struct thunk **fns;
  size_t numfn;
  size_t numobject;
  struct runtime_args *rtargs;
};

INLINE val_t *fiber_activate_limit(struct fiber_segment *restrict fiber) {
  fiber->stklimit.active =
      fiber->stk + fiber->stklimit.inactive.allocated_slots;
  return fiber->stklimit.active;
}

INLINE void fiber_suspend(struct fiber_segment *restrict fiber,
                          val_t *restrict bp) {
  fiber->stklimit.inactive.allocated_slots =
      (uint32_t)(fiber->stklimit.active - fiber->stk);
  fiber->stklimit.inactive.used_slots = (uint32_t)(bp - fiber->stk);
}

bool state_init(struct state *restrict s, struct heap *restrict heap,
                struct runtime_args *restrict rtargs);

#endif
