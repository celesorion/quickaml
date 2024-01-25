#ifndef QK_TRACE_H
#define QK_TRACE_H

#include "def.h"

struct state;

void trace(struct state *restrict st, trace_level_t tl, const char *restrict fmt, ...);

#endif