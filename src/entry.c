#include "alloc.h"
#include "bc.h"
#include "state.h"
#include "trap.h"
#include "trace.h"
#include "vm.h"

#include <inttypes.h>

status_t exec(struct state *state) { return vm_entry(state); }

struct function *vm_alloc_function(const bc_t *ops, size_t nops) {
  struct function *fn = malloc(function_size(nops));
  if (fn == nullptr)
    return nullptr;

  fn->oplimit = fn->ops + nops;
  for (size_t i = 0; i < nops; i++)
    fn->ops[i] = ops[i];
  return fn;
}

void vm_free_function(struct function *fn) { free(fn); }

struct function *vm_make_wrapper(size_t top_idx) {
  if (top_idx > UINT16_MAX)
    return nullptr;

  bc_t ops[] = {
      mk2(Call, 0, (uint16_t)top_idx),
      mk3(Trap, T_HALT, 0, 0),
  };
  return vm_alloc_function(ops, sizeof(ops) / sizeof(ops[0]));
}

bool vm_const_from_i64(int64_t value, val_t *out) {
  if (value < INT32_MIN || value > INT32_MAX || out == nullptr)
    return false;
  *out = val_from_i32((int32_t)value);
  return true;
}

bool vm_const_from_f64(double value, val_t *out) {
  if (out == nullptr)
    return false;
  *out = val_from_f64(value);
  return true;
}

bool vm_format_result(val_t value, char *buf, size_t len) {
  int n = 0;

  if (buf == nullptr || len == 0)
    return false;

  if (val_is_null(value))
    n = snprintf(buf, len, "()");
  else if (val_is_bool(value))
    n = snprintf(buf, len, "%s", val_as_bool(value) ? "true" : "false");
  else if (val_is_int(value))
    n = snprintf(buf, len, "%" PRId32, val_as_i32(value));
  else if (val_is_float(value))
    n = snprintf(buf, len, "%.17g", val_as_f64(value));
  else
    return false;

  return n >= 0 && (size_t)n < len;
}

const char *vm_status_name(status_t status) {
  const char *name = status_str(status);
  return name ? name : "unknown";
}

status_t vm_exec(struct function *entry, struct function **fns, size_t numfn,
                 size_t numobject, val_t *ctbl, size_t stack_slots,
                 val_t *result) {
  struct runtime_args rargs = {.align = 8,
                               .base_size = 1024 * 1024,
                               .descspace_size = 4 * 4 * 4096,
                               .trace_level = TRACE_0};
  struct state st;
  val_t *stk = calloc(stack_slots, sizeof(val_t));

  if (stk == nullptr)
    return S_LIMIT;
  if (!heap_init(&global_heap, &rargs)) {
    free(stk);
    return S_HEAP_INIT_FAILED;
  }
  if (!state_init(&st, &global_heap, &rargs)) {
    free(global_heap.from_base);
    free(global_heap.to_base);
    free(stk);
    return S_STATE_INIT_FAILED;
  }

  st.entry = entry;
  st.fns = fns;
  st.numfn = numfn;
  st.numobject = numobject;
  st.ctbl = ctbl;
  st.stk = stk;
  st.stklimit = stk + stack_slots;
  st.msg = nullptr;

  status_t status = vm_entry(&st);
  if (result != nullptr) {
    val_t *bp = next_bp(st.stk, 2);
    *result = bp[0];
  }

  free(global_heap.from_base);
  free(global_heap.to_base);
  free(stk);
  return status;
}

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
