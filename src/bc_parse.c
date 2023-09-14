#include "bc_parse.h"

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

struct fn_info {
  int lblcnt;
  int bccnt;
  char name[SYMLEN];
  int *lblpos; 
};

struct scan_info {
  int cbase;
  int ccnt;
  int fncnt;
  struct fn_info *fni;
  struct function **fns;
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

static int read_label(FILE *restrict fp, char **restrict p, int *n) {
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

  r = read_integer(fp, p, n);
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

static int get_operand(char **restrict p, struct bc_info *restrict bci, int n) {
  skip_space_in_line(p);
  char *q = *p;

  switch (*q) {
  case '%': {
    q++;

    int x = (int)strtol(q, &q, 10);;
    if (x < 0) return S_NOTAOPR;
    if (q == NULL) return S_NOTAOPR;

    bci->operand[n] = (struct operand_info) { .kind = OPR_SLOT, .slot = x }; 
    break;
  }

  case '-': {
    if (q[1] == '>') {
      q += 2;
      int x = (int)strtol(q, &q, 10);
      if (q == NULL) return S_NOTAOPR;

      bci->operand[n] = (struct operand_info) { .kind = OPR_LABEL, .label = x };
      break;
    }

    [[fallthrough]];
  }
  case '+':
  case '0' ... '9': {
    int x = (int)strtol(q, &q, 10);
    if (q == NULL) return S_NOTAOPR;

    bci->operand[n] = (struct operand_info) { .kind = OPR_IMM, .imm = x };
    break;
  }

  default: {
    if (is_alpha(*q)) {
      bool f = true;
      for (unsigned i = 0; i < sizeof(bci->operand[n].name) - 1; i++) {
        if (is_empty(*q)) {
          f = false;
          bci->operand[n].name[i] = 0;
          break;
        }
        bci->operand[n].name[i] = *q++;
      }
      
      if (f) return S_LIMIT;
      break;
    }

    return S_NOTAOPR;
  }
  }

  *p = q;
  return S_OK;
}

const char *bc_lookup[] = {
#define OPLOOKUP(op, name, n, a1, a2, a3) name,
  OPS(OPLOOKUP)
};

unsigned bc_info[][5] = {
#define OPINFO(op, name, n, a1, a2, a3) { n, a1, a2, a3, op },
  OPS(OPINFO)
};

static int check_operand_compatible(struct operand_info *opi, int kind) {
  switch (kind) {
    case N: return S_OK;
    case I: {
      if ((opi->kind == OPR_IMM && INT8_MIN <= opi->imm && opi->imm <= INT8_MAX)
          || opi->kind == OPR_LABEL)
        return S_OK;
      return S_XARG;
    }
    case J: {
      if ((opi->kind == OPR_IMM && INT16_MIN <= opi->imm && opi->imm <= INT16_MAX)
          || opi->kind == OPR_LABEL)
        return S_OK;
      return S_XARG;
    }
    case A: {
      if ((opi->kind == OPR_IMM && (~0x7fffff) <= opi->imm && opi->imm <= 0x7fffff)
          || opi->kind == OPR_LABEL)
        return S_OK;
      return S_XARG;
    }
    case F:
    case L:
      if (opi->kind == OPR_SLOT && opi->slot >= 0 && opi->slot <= 255)
        return S_OK;
      return S_XARG;
    case C:
      return S_ERROR;
    case P:
      if (opi->kind == OPR_SLOT && opi->slot >= 0 && opi->slot <= 255)
        return S_OK;
      return S_XARG;
    case X:
      if (opi->kind == OPR_NAME)
        return S_OK;
      return S_XARG;
    case K: 
      if (opi->kind == OPR_SLOT && opi->slot >= 0 && opi->slot <= 255)
        return S_OK;
      return S_XARG;
    default:
      return S_ERROR;
  }
}

static int encode_bc(struct bc_info *bci, bc_t *bc) {
  bool found = false;
  for (unsigned i = 0; i < sizeof(bc_lookup)/sizeof(*bc_lookup); i++) {
    bool f = strcmp(bc_lookup[i], bci->operator) == 0;
    if (f) {
      if (bci->n != bc_info[i][0])
        return S_XNUM;
       
    }
  }
  if (!found) return S_NOTFOUND;
}

static int read_bytecode(FILE *restrict fp, char **restrict p, bc_t *restrict bc) {
  char line[LINELEN] = {};

  int r = read_line(fp, p, line, sizeof(line));
  if (!is_status_ok(r)) return S_NOTABC;

  char *q = line;
  struct bc_info bci = {};
  
  r = get_operator(&q, &bci);
  if (!is_status_ok(r)) return S_NOTABC;

  int x = 0;
  if (has_operand(&q)) {
    r = get_operand(&q, &bci, 0);
    if (!is_status_good(r)) return S_NOTABC;

    x += 1;
    if (has_operand(&q)) {
      r = get_operand(&q, &bci, 1);
      if (!is_status_good(r)) return S_NOTABC;

      x += 1;
      if (has_operand(&q)) {
        r = get_operand(&q, &bci, 2);
        if (!is_status_good(r)) return S_NOTABC;
        
        x += 1;
      }
    }
  }
 
  bci.n = x;

  printf("bc: %s %d ", bci.operator, bci.n);
  for (int i = 0; i < x; ++i) {
    struct operand_info *info = bci.operand + i;
    printf("[kind: %d, label: %d, slot: %d, imm: %d, name: %s] ",
        info->kind, info->label, info->slot, info->imm, info->name);
  }
  printf("\n");

  return S_OK;
}

static bool bc_scan1(FILE *restrict fp, struct scan_info *restrict info) {
  info->ccnt = 0;
  info->cbase = 0;
  info->fncnt = 0;
  info->fni = NULL;

  struct fill_status fs;
  fs = fillbuf(fp);

  if (fs.eof) return false;
  if (!fs.p) return true;

  char *p = fs.p;

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
        info->fncnt += 1;
      }      
      break;
    }
    default:
    }

    skip_line(fp, &p);
  }

  return false;
}

static bool bc_scan2(FILE *restrict fp, struct scan_info *restrict info) {
  if (info->fni == NULL)
    return true; 

  struct fill_status fs;
  fs = fillbuf(fp);

  if (fs.eof) return false;
  if (!fs.p) return true;

  char *p = fs.p;
  int fid = 0;
  bool in_fn = false;

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
        fid += 1;
        in_fn = true;

        x = skip_space(fp, &p);
        if (x != S_OK) return true;

        r = read_symbol(fp, &p, info->fni[fid-1].name,
              sizeof(info->fni[fid-1].name));
        if (!is_status_good(r)) return true;

      } else if (strcmp(id, "endfn") == 0) {
        if (!in_fn) return true;
        in_fn = false;
      }
      
      break;
    }
    case '-': {
      int lbl = 0;
      int r = read_label(fp, &p, &lbl);
      if (!is_status_good(r)) return true;

      if (!in_fn) return true;

      if (lbl <= 0) return true;
      int old = info->fni[fid-1].lblcnt;

      info->fni[fid-1].lblcnt = old > lbl ? old : lbl;
      
      break;
    }
    case '#':
    case '\n':
      break;
    
    default:
      if (in_fn)
        info->fni[fid-1].bccnt += 1;
    }
    skip_line(fp, &p);
  }

  return false;
}

static bool bc_scan3(FILE *restrict fp, struct scan_info *restrict info, struct state* st) {
  if (info->fni == NULL)
    return true;

  struct fill_status fs;
  fs = fillbuf(fp);

  if (fs.eof) return false;
  if (!fs.p) return true;

  char *p = fs.p;
  int fid = 0;
  bool in_fn = false;
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
        fid += 1;
        in_fn = true;
      } else if (strcmp(id, "endfn") == 0) {
        if (!in_fn) return true;
        in_fn = false;
        bcid = 0;
      }
      break;
    }
    case '-': {
      int lbl = 0;
      int r = read_label(fp, &p, &lbl);
      if (!is_status_good(r)) return true;

      if (!in_fn) return true;

      if (lbl <= 0) return true;
      
      info->fni[fid-1].lblpos[lbl-1] = bcid;
      
      break;
    }

    case '#':
    case '\n':
      break;

    default:
      if (in_fn) {
        int f = fid;
        int b = bcid;

        int r = read_bytecode(fp, &p, nullptr);
        if (!is_status_good(r)) return true;

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
  
  si.fni = malloc(sizeof(struct fn_info) * si.fncnt);
  if (!si.fni) {
    printf("malloc failed\n");
    return 1;
  }

  failed = bc_scan2(fp, &si);
  if (failed) {
    printf("scan2 failed\n");
    return 1;
  }
  rewind(fp);

  for (int i = 0; i < si.fncnt; ++i) {
    size_t len = sizeof(*si.fni[i].lblpos) * si.fni[i].lblcnt;

    si.fni[i].lblpos = malloc(len);
    if (!si.fni[i].lblpos) {
      printf("malloc failed\n");
      return 1;
    }

    si.fns = malloc(sizeof(struct function *) * si.fncnt);
    if (!si.fns) {
      printf("malloc failed\n");
      return 1;
    }

    si.fns[i] = malloc(si.fni[i].bccnt * sizeof(bc_t) + sizeof(struct function));

  }

  failed = bc_scan3(fp, &si, st);
  if (failed) {
    printf("scan3 failed\n");
    return 1;
  }
  
  printf("ccnt: %u, cbase: %u, fncnt: %u\n", si.ccnt, si.cbase, si.fncnt);
  for (int i = 0; i < si.fncnt; ++i) {
    printf("lblcnt, bccnt, name of %d - %u, %u, %s\n", i, si.fni[i].lblcnt, si.fni[i].bccnt, si.fni[i].name);
    for (int j = 0; j < si.fni[i].lblcnt; ++j) {
      int pos = si.fni[i].lblpos[j];
      if (pos != -1)
        printf(" lbl %d at %d\n", j+1, pos);
    }
  } 
  return 0;
}
