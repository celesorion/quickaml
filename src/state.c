#include "state.h"

#include <unistd.h>

bool state_init(struct state *restrict state, struct heap *restrict heap,
                struct runtime_args *restrict rtargs) {
  state->heap = heap;
  state->rtargs = rtargs;
  for (size_t i = 0; i < STATE_FILES; i++)
    state->files[i] = -1;
  return true;
}

void state_deinit(struct state *restrict state) {
  for (size_t i = 0; i < STATE_FILES; i++)
    if (state->files[i] >= 0)
      close(state->files[i]);
}
