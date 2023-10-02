#ifndef QK_DYNSTR_H
#define QK_DYNSTR_H

#include <stdint.h>

enum {
  DYNSTR_6,
  DYNSTR_32,
  DYNSTR_64,
  DYNSTR_MASK = 0x3,
};

struct [[gnu::packed]] dynstr_header_6 {
  uint8_t flags;
  char buf[];
};

struct [[gnu::packed]] dynstr_header_32 {
  uint32_t size;
  uint32_t capacity;
  uint8_t flags;
  char buf[];
};

struct [[gnu::packed]] dynstr_header_64 {
  uint64_t size;
  uint64_t capacity;
  uint8_t flags;
  char buf[];
};


typedef struct {
  char buf[1];
} *dynstr_t;

#define DS_HD_TY(x_)      struct dynstr_header_##x_
#define DS_HD_LET(x_, s_) struct dynstr_header_##x_ *ds = (void*)((s_)-(sizeof(struct dynstr_header_##x_)))
#define DS_HD(x_, s_)     ((struct dynstr_header_##x_ *)((s_)-(sizeof(struct dynstr_header_##x_))))
#define DS_HD_SIZE(x_)    (sizeof(struct dynstr_header_##x_))

static inline size_t dynstr_size(const dynstr_t s) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_6:
    return flags >> 2;
  case DYNSTR_32:
    return DS_HD(32, s)->size;
  case DYNSTR_64:
    return DS_HD(32, s)->size;
  default:
    return 0;
  }
}

static inline uint8_t dynstr_type(const dynstr_t s) {
  return s->buf[-1] & DYNSTR_MASK;
}

static inline size_t dynstr_available(const dynstr_t s) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_32: {
    DS_HD_LET(32, s->buf);
    return ds->capacity - ds->size;
  }
  case DYNSTR_64: {
    DS_HD_LET(64, s->buf);
    return ds->capacity - ds->size;
  }
  default:
    return 0;
  }
}

static inline void dynstr_set_size(dynstr_t s, size_t size) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_6:
    s->buf[-1] = (uint8_t)(DYNSTR_6 | (size << 2));
    break;
  case DYNSTR_32:
    DS_HD(32, s->buf)->size = size;
    break;
  case DYNSTR_64:
    DS_HD(64, s->buf)->size = size;
    break;
  default:
    break;
  }
}

static inline size_t dynstr_capacity(const dynstr_t s) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_6:
    return flags >> 2;
  case DYNSTR_32:
    return DS_HD(32, s)->capacity;
  case DYNSTR_64:
    return DS_HD(64, s)->capacity;
  default:
    return 0;
  }
}

static inline void dynstr_set_capacity(dynstr_t s, size_t capacity) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_6:
    break;
  case DYNSTR_32:
    DS_HD(32, s->buf)->capacity = capacity;
    break;
  case DYNSTR_64:
    DS_HD(64, s->buf)->capacity = capacity;
    break;
  default:
    break;
  }
}

static inline uint8_t dynstr_required_type(size_t size, bool need_append) {
  if (size < 1u<<6 && !need_append)
    return DYNSTR_6; 
  if (size < 1llu<<32)
    return DYNSTR_32;
  return DYNSTR_64;
}

static inline size_t dynstr_header_size(uint8_t ty) {
  switch (ty & DYNSTR_MASK) {
  case DYNSTR_6:
    return DS_HD_SIZE(6);
  case DYNSTR_32:
    return DS_HD_SIZE(32);
  case DYNSTR_64:
    return DS_HD_SIZE(64);
  default:
    return 0;
  }
}

static inline size_t dynstr_update_size(dynstr_t ds) {
  size_t sz = strlen(ds->buf);
  dynstr_set_size(ds, sz);
  return sz;
}

static inline char *dynstr_to_cstr(const dynstr_t ds) {
  return ds->buf;
}

static inline dynstr_t dynstr_new_with_size(const char *init, size_t len) {
  uint8_t *s;
  uint8_t ty = dynstr_required_type(len, false);
  size_t hdsz = dynstr_header_size(ty);

  void *p = malloc(hdsz + len + 1);
  memset(p, 0, hdsz + len + 1);
  
  s = (uint8_t *)p + hdsz;
  s[-1] = ty;
  switch (ty) {
  case DYNSTR_6:
    s[-1] = (uint8_t)(DYNSTR_6 | (len << 2));
    break;
  case DYNSTR_32:
    ((DS_HD_TY(32) *)p)->size = len;
    ((DS_HD_TY(32) *)p)->capacity = len;
    break;
  case DYNSTR_64:
    ((DS_HD_TY(64) *)p)->size = len;
    ((DS_HD_TY(64) *)p)->capacity = len;
    break;
  default:
    return nullptr;
  }

  if (init)
    memcpy(s, init, len);

  s[len] = 0;

  return (dynstr_t)s;
}

static inline dynstr_t dynstr_new_empty(void) {
  return dynstr_new_with_size(nullptr, 0);
}

static inline dynstr_t dynstr_from_cstr(const char *s) {
  return dynstr_new_with_size(s, strlen(s));
}

static inline dynstr_t dynstr_dup(const dynstr_t ds) {
  return dynstr_new_with_size(dynstr_to_cstr(ds), dynstr_size(ds));
}

static inline char *dynstr_get_header(const dynstr_t ds) {
  return ds->buf - dynstr_header_size(ds->buf[-1]);
}

static inline void dynstr_free(dynstr_t ds) {
  if (ds) {
    free(dynstr_get_header(ds));
  }
}

static inline void dynstr_clear(dynstr_t ds) {
  dynstr_set_size(ds, 0);
  ds->buf[0] = '\0';
}

static inline dynstr_t dynstr_reserve(dynstr_t ds, size_t size) {
  size_t cap = dynstr_capacity(ds);
  if (cap >= size)
    return ds;

  uint8_t oldty = dynstr_type(ds);
  size_t oldlen = dynstr_size(ds);
  char *hd = dynstr_get_header(ds);
  char *newhd;
  
  uint8_t newty = dynstr_required_type(size, true);
  
  size_t newhdsz = dynstr_header_size(newty);
  if (newhdsz + size + 1 <= size) return ds;

  if (oldty == newty) {
    newhd = realloc(hd, newhdsz + size + 1);
    ds = (dynstr_t)(newhd + newhdsz);
  } else {
    newhd = malloc(newhdsz + size + 1);
    memcpy(newhd + newhdsz, ds->buf, oldlen + 1);
    free(hd);
    ds = (dynstr_t)(newhd + newhdsz);
    ds->buf[-1] = newty;
    dynstr_set_size(ds, oldlen);
  }
  dynstr_set_capacity(ds, size);
  return ds;
}

static inline dynstr_t dynstr_concat_with_size(dynstr_t ds1, const char *s2, size_t size) {
  size_t cursz = dynstr_size(ds1);

  size_t newcap = cursz + size;
  newcap += newcap / 2;

  ds1 = dynstr_reserve(ds1, newcap);
  memcpy(ds1->buf + cursz, s2, size);
  dynstr_set_size(ds1, cursz + size);
  ds1->buf[cursz + size] = 0;

  return ds1;
}

static inline dynstr_t dynstr_concat(dynstr_t ds1, const dynstr_t ds2) {
  return dynstr_concat_with_size(ds1, ds2->buf, dynstr_size(ds2));
}

static inline dynstr_t dynstr_concat_cstr(dynstr_t ds1, const char *s2) {
  return dynstr_concat_with_size(ds1, s2, strlen(s2));
}

static inline bool dynstr_eq(const dynstr_t s1, const dynstr_t s2) {
  size_t l1 = dynstr_size(s1);
  size_t l2 = dynstr_size(s2);
  return l1 == l2 && 0 == memcmp(s1, s2, l1);
}

static inline int dynstr_compare(const dynstr_t s1, const dynstr_t s2) {
  size_t l1 = dynstr_size(s1);
  size_t l2 = dynstr_size(s2);
  size_t minlen = (l1 < l2) ? l1 : l2;
  int cmp = memcmp(s1, s2, minlen);
  if (cmp == 0) return l1 > l2 ? 1 : (l1 < l2 ? -1: 0);
  return cmp;
}

#endif

