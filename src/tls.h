#ifndef QK_TLS_H
#define QK_TLS_H

#include "alloc.h"

struct tls_data {
  bool is_mutator;
  struct block_queue *non_empty_reusable;
  struct block_queue_list empty_reusable;
  struct block_queue_list full_reusable;
};

extern thread_local struct tls_data tlsd;

#endif
