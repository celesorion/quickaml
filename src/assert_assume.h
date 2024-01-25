#ifndef QK_ASSERT_ASSUME_H
#define QK_ASSERT_ASSUME_H

#include <assert.h>

#define assert_assume(cond) do { bool _x = cond; assert(_x); __builtin_assume(_x); } while (0)

#endif