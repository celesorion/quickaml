#include "vm.h"
#include "state.h"
#include "alloc.h"
#include "descspace.h"

status_t exec(struct state *state) {
  return vm_entry(state);
}

#include "bc_parse.h"

#ifdef DEBUG
#include "utest/utest.h"
UTEST_STATE();
#endif

int main(int argc, const char *const argv[]) {
#ifdef DEBUG
  // return utest_main(argc, argv);
#endif

  if (argc <= 1)
    return exit_with_status(S_INSUFFICIENT_ARGS);

  char *tls = getenv("QUICKAML_TRACE_LEVEL");
  trace_level_t tl = tls ? strtoul(tls, nullptr, 10) : TRACE_ALL;

  struct runtime_args rargs = { .align = 8, .base_size = 1024 * 1024, .descspace_size = 4 * 4 * 4096, .trace_level = tl};
  struct descspace dspace;
  struct state st;

  trace(&st, TRACE_0, "trace level is set to %u", rargs.trace_level);

  if (!descspace_init(&dspace, &rargs)) return S_DESCSPACE_INIT_FAILED;
  if (!heap_init(&global_heap, &rargs)) return S_HEAP_INIT_FAILED;
  if (!state_init(&st, &dspace, &global_heap, &rargs)) return S_STATE_INIT_FAILED;

  FILE *fp = fopen(argv[1], "rb");

  status_t r = bc_parse(fp, &st);
  if (r != S_OK) return exit_with_status(r);

  fclose(fp);

  return  exit_with_status(exec(&st));
}

