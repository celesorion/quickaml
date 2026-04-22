#include "state.h"

bool state_init(struct state *restrict state, struct heap *restrict heap,
                struct runtime_args *restrict rtargs) {
  state->heap = heap;
  state->rtargs = rtargs;
  state->gc_poll_not_required = true;
  return true;
}
