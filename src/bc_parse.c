#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

#define BUFLEN 128

struct fill_status {
  char *p;
  bool eof;
};

struct fn_info {
  int lblcnt;
  int bccnt;
};

struct scan_info {
  int cbase;
  int ccnt;
  int fncnt;
  struct fn_info *fni;
};

enum read_status {
  S_OK,
  S_EOF,
  S_ERROR,
  S_LIMIT,
  S_NOTAINT,
};

static struct fill_status fillbuf(FILE *fp) {
  static char buf[2][BUFLEN] = {0};
  static unsigned cur = 1;
  
  cur = 1 - cur;
  char *p = fgets(buf[cur], BUFLEN, fp);
  return (struct fill_status){ p, feof(fp) };
}

static bool is_empty(char x) { return x == ' ' || x == '\t' || x == '\r'; };

static int skip_space(FILE *restrict fp, char **restrict p) {
  char *q = *p;
  struct fill_status fs;

  for (;;) {
    while (*q && is_empty(*q))
      q++;

    if (*q == 0) {
      fs = fillbuf(fp);
      if (fs.eof) return S_EOF;
      if (!fs.p) return S_ERROR;
      q = fs.p;
    } else break;
  }

  *p = q;
  return S_OK;
}

static int skip_line(FILE *restrict fp, char **restrict p) {
  char *q = *p;
  struct fill_status fs;

  for (;;) {
    while (*q && *q != '\n')
      q++;
    if (*q == 0) {
      fs = fillbuf(fp);
      if (fs.eof) return S_EOF;
      if (!fs.p) return S_ERROR;
      q = fs.p;
    } else break;
  }

  *p = q+1;
  return S_OK;
}

static int read_symbol(FILE *restrict fp, char **restrict p, char *restrict id, int limit) {
  struct fill_status fs;
  bool f = true;
  char *q = *p;
  
  for (int i = 0; i < limit - 1; ++i) {
    if (*q == 0) {
      fs = fillbuf(fp);
      if (fs.eof) {
        f = false;
        id[i] = 0;
        break;
      }
      if (!fs.p) return S_ERROR;
      q = fs.p;
    }
    if (*q == '\n' || is_empty(*q)) {
      f = false;
      id[i] = 0;
      break;
    }
    id[i] = *q++;
  }

  if (f) return S_LIMIT;

  *p = q;
  return 0;
}

static int read_integer(FILE *restrict fp, char **restrict p, int *n) {
  struct fill_status fs;
  char buf[13] = {0};
  bool f = true;
  char *q = *p;

  for (unsigned i = 0; i < sizeof(buf) - 1; ++i) {
    if (*q == 0) {
      fs = fillbuf(fp);
      if (fs.eof) {
        f = false;
        buf[i] = 0;
        break;
      }
      if (!fs.p) return S_ERROR;
      q = fs.p;
    }
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
  *n = (int)strtoul(buf, NULL, 10);

  return 0;
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
    if (x == S_ERROR) return true;

    char id[BUFLEN];
    switch (*p) {
    case '.': {
      p++;

      int r = read_symbol(fp, &p, id, sizeof(id));
      if (r != S_OK) return true;

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
    if (x == S_ERROR) return true;

    char id[BUFLEN];
    switch (*p) {
    case '.': {
      p++;

      int r = read_symbol(fp, &p, id, sizeof(id));
      if (r != S_OK) return true;

      if (strcmp(id, "fn") == 0) {
        fid += 1;
        in_fn = true;
      } else if (strcmp(id, "endfn") == 0) {
        in_fn = false;
      }
      
      break;
    }
    case '-':
      if (p[1] != '>') break;
      if (!in_fn) return true;
      info->fni[fid-1].lblcnt += 1;
      
      break;
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

int bc_parse(FILE *fp) {
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
    return 2;
  }

  failed = bc_scan2(fp, &si);
  if (failed) {
    printf("scan2 failed\n");
    return 1;
  }
  rewind(fp);

  printf("ccnt: %u, cbase: %u, fncnt: %u\n", si.ccnt, si.cbase, si.fncnt);
  for (int i = 0; i < si.fncnt; ++i)
    printf("lblcnt, bccnt: %d - %u, %u\n", i, si.fni[i].lblcnt, si.fni[i].bccnt);
  free(si.fni);
  return 0;
}
