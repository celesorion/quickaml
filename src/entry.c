#include "vm.h"
#include "obj.h"
#include "alloc.h"

int exec(struct state *state) {
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

  struct state st;

  heap_init(&global_heap, (struct runtime_args){ .align = 8, .base_size = 1024 * 1024 });

  if (argc <= 1)
    return 1;
  
  FILE *fp = fopen(argv[1], "rb");

  int r = bc_parse(fp, &st);
  if (r != S_OK) return r;

  return exec(&st);
}

