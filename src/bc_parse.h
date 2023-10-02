#ifndef QK_BC_PARSE_H
#define QK_BC_PARSE_H

#include "bc.h"
#include "obj.h"

#include <stdio.h>

enum {
  S_OK,
  S_EOF,
  S_LIMIT,
  S_READ_ERR,
  S_UNPAIRED,
  S_INVALID_FNID,
  S_INVALID_NUMFN,
  S_INVALID_NUMBC,
  S_NOT_AN_OPERAND,
  S_NOT_A_INT,
  S_BAD_OP,
};

int bc_parse(FILE *fp, struct state *st);

#endif

