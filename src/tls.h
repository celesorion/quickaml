#ifndef QK_TLS_H
#define QK_TLS_H

#include "alloc.h"

struct tls_data {
  bool _dummy;
};

extern thread_local struct tls_data tlsd;

#endif
