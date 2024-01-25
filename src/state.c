#include "state.h"

bool state_init(struct state *restrict state, struct descspace *restrict dspace,
                struct heap *restrict heap, struct runtime_args *restrict rtargs) {
  state->dspace = dspace;
  state->heap = heap;
  state->rtargs = rtargs;
  return true;
}
