#ifndef QK_TRAP_H
#define QK_TRAP_H

#define TRAPS(_)                                                               \
  _(T_UNDEFINED, "undefined")                                                  \
  _(T_DIVERGE, "diverge")                                                      \
  _(T_HALT, "halt")                                                            \
  _(T_UNUSEDEXTA, "unused-args")                                               \
  _(T_PRINTREGS, "print-regs")                                                 \
  _(T_PRINTREGSX, "print-regs-hex")                                            \
  _(T_ASSERT_EQ, "assert-eq")                                                  \
  _(T_PRINTOBJ, "print-obj")                                                   \
  _(T_HEAPSTAT, "heap-stat")

typedef enum {
#define TLIST(t, desc) t,
  TRAPS(TLIST)
#undef TLIST
} trap_t;

static inline const char *trap_name(trap_t t) {
  switch (t) {
#define TLIST(t, desc)                                                         \
  case t:                                                                      \
    return desc;
    TRAPS(TLIST)
#undef TLIST
  default:
    return nullptr;
  }
}

#endif
