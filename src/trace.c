#include "trace.h"
#include "state.h"

#include <stdarg.h>
#include <stdio.h>

void trace(struct state *restrict st, trace_level_t tl, const char *restrict fmt, ...) {
  if (st == nullptr || st->rtargs == nullptr || tl >= st->rtargs->trace_level) return;
  va_list args;
  va_start(args, fmt);
  fprintf(stderr, "[level %u] trace: ", tl);
  vfprintf(stderr, fmt, args);
  va_end(args);
  fputc('\n', stderr);
}