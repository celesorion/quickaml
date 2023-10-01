#include "bc_parse.h"
#include "hashtbl.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <assert.h>

#define BUFLEN  128
#define SYMLEN  64
#define LINELEN 256

struct fill_status {
  char *p;
  bool eof;
};

struct label {
  char name[SYMLEN];
  int pos;
};

#define LABEL_EQ(x, y) (strcmp(((struct label *)(x))->name, ((struct label *)(y))->name)==0)
#define LABEL_HASH(x)  (hashtbl_default_hash(((struct label *)(x))->name, strlen(((struct label *)(x))->name)))

#define LABEL_NAME_EQ(x, y) (strcmp((x), ((struct label *)(y))->name)==0)
#define LABEL_NAME_HASH(x)  (hashtbl_default_hash((x), strlen((x))))

HASHSET_NEW_KIND(lblset, struct label, 8, DEFAULT_ALLOC, DEFAULT_COPY, DEFAULT_DEL, LABEL_EQ, DEFAULT_FREE, DEFAULT_GET, LABEL_HASH, DEFAULT_INIT, DEFAULT_MOVE)
HASHTBL_NEW_LOOKUP_KIND_WITH_DEFAULTS(lblset, char, name, LABEL_NAME_EQ, LABEL_NAME_HASH)

struct fn_info {
  struct lblset *labels;
  int bccnt;
  char name[SYMLEN];
};

#define FUNC_EQ(x, y) (strcmp(((struct fn_info *)(x))->name, ((struct fn_info *)(y))->name)==0)
#define FUNC_HASH(x)  (hashtbl_default_hash(((struct fn_info *)(x))->name, strlen(((struct fn_info *)(x))->name)))

#define FUNC_NAME_EQ(x, y) (strcmp((x), ((struct fn_info *)(y))->name)==0)
#define FUNC_NAME_HASH(x)  (hashtbl_default_hash((x), strlen((x))))

HASHSET_NEW_KIND(fnset, struct fn_info, 8, DEFAULT_ALLOC, DEFAULT_COPY, DEFAULT_DEL, FUNC_EQ, DEFAULT_FREE, DEFAULT_GET, FUNC_HASH, DEFAULT_INIT, DEFAULT_MOVE)
HASHTBL_NEW_LOOKUP_KIND_WITH_DEFAULTS(fnset, char, name, FUNC_NAME_EQ, FUNC_NAME_HASH)

struct scan_info {
  int cbase;
  int ccnt;
  struct fnset *fns;
};

enum {
  OPR_SLOT,
  OPR_LABEL,
  OPR_IMM,
  OPR_NAME,
};

struct operand_info {
  unsigned kind;
  int label;
  int imm;
  int slot;
  char name[SYMLEN];
};

struct bc_info {
  char operator[SYMLEN];
  unsigned n;
  struct operand_info operand[3];
};

struct bc_desc {
  const char *name;
  op_t op;
  unsigned n;
  unsigned a[3];
};

#define BC_EQ(x, y) (strcmp(((struct bc_desc *)(x))->name, ((struct bc_desc *)(y))->name)==0)
#define BC_HASH(x)  (hashtbl_default_hash(((struct bc_desc *)(x))->name, strlen(((struct bc_desc *)(x))->name)))

#define BC_NAME_EQ(x, y) (strcmp((x), ((struct bc_desc *)(y))->name)==0)
#define BC_NAME_HASH(x)  (hashtbl_default_hash((x), strlen((x))))

HASHSET_NEW_KIND(bcset, struct bc_desc, 8, DEFAULT_ALLOC, DEFAULT_COPY, DEFAULT_DEL, BC_EQ, DEFAULT_FREE, DEFAULT_GET, BC_HASH, DEFAULT_INIT, DEFAULT_MOVE)
HASHTBL_NEW_LOOKUP_KIND_WITH_DEFAULTS(bcset, char, name, BC_NAME_EQ, BC_NAME_HASH)

enum read_status {
  S_OK,
  S_REFILLED,
  S_EOF,
  S_ERROR,
  S_LIMIT,
  S_NOTAINT,
  S_NOTALBL,
  S_NOTASYM,
  S_NOTAOPR,
  S_NOTABC,
  S_NOTFOUND,
  S_XNUM,
  S_XARG,
  S_XARG1,
  S_XARG2,
  S_XARG3,
};

static bool is_status_good(int st) {
  return st <= S_EOF;
}

static bool is_status_ok(int st) {
  return st <= S_REFILLED;
}

static struct fill_status fillbuf(FILE *fp) {
  static char buf[2][BUFLEN] = {0};
  static unsigned cur = 1;
  
  cur = 1 - cur;
  char *p = fgets(buf[cur], BUFLEN, fp);
  return (struct fill_status){ p, feof(fp) };
}

static int fill_check(FILE *restrict fp, char **restrict p) {
  struct fill_status fs;
  if (**p == 0) {
    fs = fillbuf(fp);
    if (fs.eof) return S_EOF;
    if (!fs.p) return S_ERROR;
    *p = fs.p;
    return S_REFILLED;
  }
  return S_OK;
}

static bool is_empty(char x) { return x == ' ' || x == '\t' || x == '\r'; }

static bool is_alpha(char x) { return (x >= 'a' && x <= 'z') || (x >= 'A' && x <= 'Z'); }

static int skip_space(FILE *restrict fp, char **restrict p) {
  char *q = *p;
  for (;;) {
    while (*q && is_empty(*q))
      q++;

    int r = fill_check(fp, &q);
    if (r == S_OK) break; // *q != ' '
    if (r != S_REFILLED) return r;
  }

  *p = q;
  return S_OK;
}

static int skip_line(FILE *restrict fp, char **restrict p) {
  char *q = *p;

  for (;;) {
    while (*q && *q != '\n')
      q++;

    int r = fill_check(fp, &q);
    if (r == S_OK) break; // *q == '\n'
    if (r != S_REFILLED) return r;
  }

  *p = q+1;
  return S_OK;
}

static int skip_symbol(FILE *restrict fp, char **restrict p, int limit) {
  bool f = true;
  bool eof = false;
  char *q = *p;
  
  for (int i = 0; i < limit - 1; ++i) {
    int r = fill_check(fp, &q);
    if (r == S_EOF) {
      f = false;
      eof = true;
      break;
    } else if (r == S_ERROR)
      return S_NOTASYM;

    if (*q == '\n' || is_empty(*q)) {
      f = false;
      break;
    }
  }

  if (f) return S_LIMIT;

  *p = q;
  if (eof) return S_EOF;
  return S_OK;
}

static int read_symbol(FILE *restrict fp, char **restrict p, char *restrict id, int limit) {
  bool f = true;
  bool eof = false;
  char *q = *p;
  
  for (int i = 0; i < limit - 1; ++i) {
    int r = fill_check(fp, &q);
    if (r == S_EOF) {
      f = false;
      eof = true;
      id[i] = 0;
      break;
    } else if (r == S_ERROR)
      return r;
    if (*q == '\n' || is_empty(*q)) {
      f = false;
      id[i] = 0;
      break;
    }
    id[i] = *q++;
  }

  if (f) return S_LIMIT;

  *p = q;
  if (eof) return S_EOF;
  return S_OK;
}

static int read_symbol_until(FILE *restrict fp, char **restrict p, char *restrict id, int limit, char c) {
  bool f = true;
  bool eof = false;
  char *q = *p;
  
  for (int i = 0; i < limit - 1; ++i) {
    int r = fill_check(fp, &q);
    if (r == S_EOF) {
      f = false;
      eof = true;
      id[i] = 0;
      break;
    } else if (r == S_ERROR)
      return r;
    if (*q == c || *q == '\n' || is_empty(*q)) {
      f = false;
      id[i] = 0;
      break;
    }
    id[i] = *q++;
  }

  if (f) return S_LIMIT;

  *p = q;
  if (eof) return S_EOF;
  return S_OK;
}

static int read_line(FILE *restrict fp, char **restrict p, char *restrict buf, int limit) {
  bool f = true;
  bool eof = false;
  char *q = *p;

  for (int i = 0; i < limit - 1; ++i) {
    int r = fill_check(fp, &q);
    if (r == S_EOF) {
      f = false;
      eof = true;
      buf[i] = 0;
      break;
    } else if (r == S_ERROR)
      return r;

    if (*q == '\n') {
      f = false;
      buf[i] = 0;
      break;
    }

    buf[i] = *q++;
  }

  if (f) return S_LIMIT;

  *p = q;
  if (eof) return S_EOF;
  return S_OK;
}

static int read_integer(FILE *restrict fp, char **restrict p, int *n) {
  char buf[13] = {0};
  bool f = true;
  bool eof = false;
  char *q = *p;

  for (unsigned i = 0; i < sizeof(buf) - 1; ++i) {
    int r = fill_check(fp, &q);
    if (r == S_EOF) {
      f = false;
      eof = true;
      buf[i] = 0;
      break;
    } else if (r == S_ERROR)
      return S_NOTAINT;

    if (*q < '0' || *q > '9') {
      f = false;
      buf[i] = 0;
      break;
    }

    buf[i] = *q++;
  }

  if (f) return S_LIMIT;
  if (strlen(buf) == 0) return S_NOTAINT;

  *p = q;
  *n = (int)strtol(buf, NULL, 10);

  if (eof) return S_EOF;
  return S_OK;
}

static int read_label(FILE *restrict fp, char **restrict p, char *restrict id, int limit) {
  char *q = *p;
  if (*q != '-')
    return S_NOTALBL;

  q++;

  int r = fill_check(fp, &q);
  if (!is_status_ok(r)) return S_NOTALBL;

  if (*q != '>')
    return S_NOTALBL;

  q++;

  *p = q;

  r = read_symbol_until(fp, p, id, limit, ':');
  if (!is_status_ok(r)) return S_NOTALBL;

  return S_OK;
}

static void skip_space_in_line(char **restrict p) {
  char *q = *p;
  while (*q && is_empty(*q))
    ++q;
  *p = q;
}

static int get_operator(char **restrict p, struct bc_info *restrict bci) { 
  skip_space_in_line(p);
  bool f = true; 
  char *q = *p;

  for (unsigned i = 0; i < sizeof(bci->operator) - 1; i++) {
    if (is_empty(*q)) {
      f = false;
      bci->operator[i] = 0;
      break;
    }
    bci->operator[i] = *q++;
  }

  if (f) return S_LIMIT;
  assert(strlen(bci->operator) != 0);

  *p = q;
  return S_OK;
}

static bool has_operand(char **restrict p) {
  skip_space_in_line(p);
  switch (**p) {
  case '%':
  case '-': case '+':
  case '0' ... '9':
  case 'a' ... 'z':
  case 'A' ... 'Z':
    return true;
  default:
    return false;
  }
}

static struct bcset *bctbl;

static void init_bc_table() {
  if (bctbl == nullptr) {
    bctbl = bcset_new(64);

#define OPINIT(op_, name_, n_, a1_, a2_, a3_)   \
    bcset_insert(&bctbl, &(struct bc_desc){     \
        .name = name_,                          \
        .op = op_,                              \
        .n = n_,                                \
        .a = {a1_, a2_, a3_},                   \
    });

    OPS(OPINIT)

  }
}

static bool bc_scan1(FILE *restrict fp, struct scan_info *restrict info) {
  info->ccnt = 0;
  info->cbase = 0;
  info->fns = fnset_new(0);

  struct fill_status fs;
  fs = fillbuf(fp);

  if (fs.eof) return false;
  if (!fs.p) return true;

  char *p = fs.p;
  bool in_fn = false;
  struct fn_info *curfn;
  unsigned bcid = 0;

  for (;;) {
    int x = skip_space(fp, &p);
    if (x == S_EOF) break;
    if (!is_status_ok(x)) return true;

    char id[BUFLEN];
    switch (*p) {
    case '.': {
      p++;

      int r = read_symbol(fp, &p, id, sizeof(id));
      if (!is_status_good(r)) return true;

      if (strcmp(id, "c") == 0) {
        info->ccnt += 1;
      } else if (strcmp(id, "cbase") == 0) {
        info->cbase = info->ccnt;
      } else if (strcmp(id, "fn") == 0) {
        if (in_fn) return true;
        in_fn = true;

        x = skip_space(fp, &p);
        if (x != S_OK) return true;

        struct fn_info fi = { .bccnt = 0 };
        r = read_symbol(fp, &p, fi.name, sizeof(fi.name));
        if (!is_status_good(r)) return true;
        
        struct fnset_insert ins = fnset_insert(&info->fns, &fi);
        if (!ins.inserted) return true;
        curfn = fnset_iter_get(&ins.iter);
        curfn->labels = lblset_new(0);

      } else if (strcmp(id, "endfn") == 0) {
        if (!in_fn) return true;
        curfn->bccnt = bcid;
        bcid = 0;
        in_fn = false;
        curfn = nullptr;
      }
      
      break;
    }
    case '-': {
      struct label lbl = { 0 };
      int r = read_label(fp, &p, lbl.name, sizeof(lbl.name));
      if (!is_status_good(r)) return true;

      if (!in_fn) return true;
      
      lbl.pos = bcid;
      
      struct lblset_insert ins = lblset_insert(&curfn->labels, &lbl);
      if (!ins.inserted) return true;

      break;
    }
    case '#':
    case '\n':
      break;
    
    default:
      if (in_fn) {
        bcid += 1;
      }
    }

    skip_line(fp, &p);
  }

  return false;
}

static bool bc_scan2(FILE *restrict fp, struct scan_info *restrict info) {
  struct fill_status fs;
  fs = fillbuf(fp);

  if (fs.eof) return false;
  if (!fs.p) return true;

  char *p = fs.p;
  bool in_fn = false;
  struct fn_info *curfn;
  unsigned bcid = 0;

  for (;;) {
    int x = skip_space(fp, &p);
    if (x == S_EOF) break;
    if (!is_status_ok(x)) return true;

    char id[BUFLEN];
    switch (*p) {
    case '.': {
      p++;

      int r = read_symbol(fp, &p, id, sizeof(id));
      if (!is_status_good(r)) return true;

      if (strcmp(id, "fn") == 0) {
        if (in_fn) return true;
        in_fn = true;

        x = skip_space(fp, &p);
        if (x != S_OK) return true;

        char fname[SYMLEN];
        r = read_symbol(fp, &p, fname, sizeof(fname));
        if (!is_status_good(r)) return true;
        
        struct fnset_iterator it = fnset_find_by_name(&info->fns, fname);
        curfn = fnset_iter_get(&it);
      } else if (strcmp(id, "endfn") == 0) {
        if (!in_fn) return true;
        bcid = 0;
        in_fn = false;
        curfn = nullptr;
      }
      
      break;
    }
    case '-':
    case '#':
    case '\n':
      break;
    
    default:
      if (in_fn) {
        bcid += 1;
      }
    }

    skip_line(fp, &p);
  }

  return false;
}

int bc_parse(FILE *fp, struct state *st) {
  struct scan_info si;
  
  bool failed = bc_scan1(fp, &si);
  if (failed) {
    printf("scan1 failed\n");
    return 1;
  }
  rewind(fp);
  
  size_t fncnt = fnset_size(si.fns);
  printf("ccnt: %u, cbase: %u, fncnt: %lu\n", si.ccnt, si.cbase, fncnt);
  struct fn_info *fn;
  for (struct fnset_iterator it = fnset_iter(si.fns);
      (fn = fnset_iter_get(&it));
      fnset_iter_next(&it)) {
    size_t lblcnt = lblset_size(fn->labels);
    printf("lblcnt, bccnt, name - %zu, %d, %s\n", lblcnt, fn->bccnt, fn->name);

    struct label *lbl;
    for (struct lblset_iterator it2 = lblset_iter(fn->labels);
        (lbl = lblset_iter_get(&it2));
        lblset_iter_next(&it2)) {
        printf(" lbl %s at %d\n", lbl->name, lbl->pos);
    }
  }
  
  return 0;
}
