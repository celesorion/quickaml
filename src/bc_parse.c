#include "bc_parse.h"
#include "bc.h"
#include "dynstr.h"
#include "hashtbl.h"
#include "ptrdesc.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

static bool is_empty(char x) { return x == ' ' || x == '\t' || x == '\r'; }

static void skip_space(char **restrict p) {
  char *q = *p;
  while (*q && is_empty(*q))
      q++;
  *p = q;
}

static int read_symbol(char **restrict p, char *restrict id, int limit) {
  bool f = true;
  char *q = *p;
  
  for (int i = 0; i < limit - 1; ++i) {
    if (*q == '\n' || is_empty(*q)) {
      f = false;
      id[i] = 0;
      break;
    }
    id[i] = *q++;
  }

  if (f) return S_LIMIT;

  *p = q;
  return S_OK;
}

static int read_symbol_until(char **restrict p, char c, char *restrict id, int limit) {
  bool f = true;
  char *q = *p;
  
  for (int i = 0; i < limit - 1; ++i) {
    if (*q == c || *q == '\n' || is_empty(*q)) {
      f = false;
      id[i] = 0;
      break;
    }
    id[i] = *q++;
  }

  if (f) return S_LIMIT;

  *p = q;
  return S_OK;
}

static int read_integer(char **restrict p, long *n) {
  char *q = *p;
  *n = strtol(q, &q, 0);

  if (q == *p) return S_NOT_A_INT;

  *p = q;
  return S_OK;
}

static int read_line(dynstr_t *pds, FILE *fp) {
  dynstr_t ds = *pds;
  dynstr_clear(ds);

  char buf[128];

  for (;;) {
    char *p = fgets(buf, sizeof(buf), fp);

    if (!p) {
      if (feof(fp)) return S_EOF;
      return S_READ_ERR;
    }
    
    size_t sz = strlen(buf);
    ds = dynstr_concat_with_size(ds, buf, sz);
    if (buf[sz - 1] == '\n') break;
  }
  
  *pds = ds;
  return S_OK;
}

#define OP_EQ(a, b) (strcmp(*(const char**)(a), (b)->key)==0)
#define OP_HASH(x) (hashtbl_default_hash(*(const char**)(x), strlen(*(const char**)(x))))
HASHMAP_NEW_KIND(opmap, const char *, op_t, 8, DEFAULT_ALLOC, DEFAULT_COPY, DEFAULT_DEL, OP_EQ, DEFAULT_FREE, DEFAULT_GET, OP_HASH, DEFAULT_INIT, DEFAULT_MOVE)

static struct opmap *opmap;

void init_op_table() {
  if (opmap) return;
  opmap = opmap_new(128);
#define OPINSERT(op, name, n, a1, a2, a3)                                \
  do {                                                                   \
    const char *s = name;                                                \
    struct opmap_insert ins = opmap_deferred_insert(&opmap, &s);         \
    opmap_entry_t *entry = opmap_iter_get(&ins.iter);                    \
    entry->val = op;                                                     \
    entry->key = s;                                                      \
  } while (0);

  OPS(OPINSERT)
}

int bc_scan(FILE *fp, dynstr_t *pds, struct state *st) {
  bool in_fn = false;
  unsigned bcid = 0;
  unsigned fid = 0;
  bool has_numfn = false;
  unsigned entryid = 0;
  struct function *curfn;
 
  char id[64];
  long n;
  int r;
  for (;;) {
    r = read_line(pds, fp);
    if (r == S_EOF) {
      if (in_fn) return S_UNPAIRED;
      break;
    }

    char *p = (*pds)->buf;
    skip_space(&p);

    switch (*p) {
    case '.': {
      p++;

      r = read_symbol(&p, id, sizeof(id));
      if (r != S_OK) return r;
      if (strcmp(id, "fn") == 0) {
        if (in_fn) return S_UNPAIRED;
        in_fn = true;

        skip_space(&p);

        r = read_integer(&p, &n);
        if (r != S_OK) return r;

        if (!has_numfn || st->numfn <= fid) return S_INVALID_FNID;
        if (n < 0) return S_INVALID_NUMBC;

        st->fns[fid] = malloc(function_size(n));
        curfn = st->fns[fid];
        curfn->oplimit = curfn->ops + n;

      } else if (strcmp(id, "endfn") == 0) {
        if (!in_fn) return S_UNPAIRED;
        bcid = 0;
        in_fn = false;
        fid += 1;
        curfn = nullptr;
      } else if (strcmp(id, "ptrdesc") == 0) {
        if (!in_fn) return S_UNPAIRED;

        skip_space(&p);

        struct ptrdesc *desc = malloc(sizeof(struct ptrdesc));

        for (unsigned i = 0; i < 4; i++) {
          r = read_integer(&p, &n);
          if (r != S_OK) return r;
          desc->ptrmap[i] = n;
        }

        curfn->desc = desc;
      } else if (strcmp(id, "numfn") == 0) {
        skip_space(&p);
        
        r = read_integer(&p, &n);
        if (r != S_OK) return r;

        if (!has_numfn && n > 0) {
          st->fns = calloc(n, sizeof(struct function));
          st->numfn = n;
          has_numfn = true;
        } else {
          return S_INVALID_NUMFN;
        }
      } else if (strcmp(id, "entry") == 0) {
        skip_space(&p);

        r = read_integer(&p, &n);
        if (r != S_OK) return r;

        if (has_numfn && n >= 0 && st->numfn > (size_t)n)
          entryid = n;
        else
          return S_INVALID_FNID;
      } else if (strcmp(id, "stack") == 0) {
        skip_space(&p);

        r = read_integer(&p, &n);
        if (r != S_OK) return r;

        n = n > 0 ? n : 1024;
        st->stk = aligned_alloc(sizeof(val_t), sizeof(val_t) * (size_t)n); 
        st->stklimit = st->stk + n;
      } 
      break;
    }
    case '#':
    case '\n':
      break;

    default:
      if (in_fn) {
        skip_space(&p);

        r = read_symbol(&p, id, sizeof(id));
        if (r != S_OK) return r;

        const char *s = id;
        struct opmap_iterator iter = opmap_find(opmap, &s);
        opmap_entry_t *entry = opmap_iter_get(&iter);
        if (!entry)
          return S_BAD_OP;

        struct [[gnu::packed]] {
          union {
            struct [[gnu::packed]] {
              uint8_t A;
              uint8_t B;
              uint8_t C;
            } ABC;
            struct [[gnu::packed]] {
              uint8_t A;
              int16_t sB;
            } AsB;
          };
        } bcinfo = { 0 };

        for (;;) {
          skip_space(&p);
          if (*p == 0 || *p == '\n')
            break;

          r = read_symbol_until(&p, ':', id, sizeof(id));
          if (r != S_OK) return S_NOT_AN_OPERAND;

          if (*p++ != ':') return S_NOT_AN_OPERAND;

          r = read_integer(&p, &n);
          if (r != S_OK) return S_NOT_AN_OPERAND;

          if (strcmp(id, "a") == 0 || strcmp(id, "y") == 0) {
            bcinfo.ABC.A = (uint8_t)n;
          } else if (strcmp(id, "b") == 0 || strcmp(id, "x") == 0) {
            bcinfo.ABC.B = (uint8_t)n;
          } else if (strcmp(id, "c") == 0 || strcmp(id, "z") == 0) {
            bcinfo.ABC.C = (uint8_t)n;
          } else if (strcmp(id, "sb") == 0) {
            bcinfo.AsB.sB = (int16_t)n;
          } else {
            return S_NOT_AN_OPERAND;
          }
        }
        curfn->ops[bcid] = make3ABC(entry->val, bcinfo.ABC.A, bcinfo.ABC.B, bcinfo.ABC.C); 
        bcid += 1;
      }
    }
  }

  st->entry = st->fns[entryid];
  return S_OK;
}

int bc_parse(FILE *fp, struct state *st) {
  init_op_table();
  dynstr_t line = dynstr_new_empty();
  int r = bc_scan(fp, &line, st);
  dynstr_free(line);
  return r;
}


