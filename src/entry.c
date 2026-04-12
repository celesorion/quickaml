#include "alloc.h"
#include "state.h"
#include "trace.h"
#include "vm.h"

status_t exec(struct state *state) { return vm_entry(state); }

int main(int argc, const char *const argv[]) {
  (void)argv;
  if (argc <= 1)
    return exit_with_status(S_INSUFFICIENT_ARGS);

  char *tls = getenv("QUICKAML_TRACE_LEVEL");
  trace_level_t tl = tls ? strtoul(tls, nullptr, 10) : TRACE_ALL;

  struct runtime_args rargs = {.align = 8,
                               .base_size = 1024 * 1024,
                               .descspace_size = 4 * 4 * 4096,
                               .trace_level = tl};
  struct state st;

  trace(&st, TRACE_0, "trace level is set to %u", rargs.trace_level);

  if (!heap_init(&global_heap, &rargs))
    return S_HEAP_INIT_FAILED;
  if (!state_init(&st, &global_heap, &rargs))
    return S_STATE_INIT_FAILED;

  return exit_with_status(exec(&st));
}
