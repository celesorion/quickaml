#ifndef QK_DYNSTR_H
#define QK_DYNSTR_H

#include <stdint.h>

enum {
  DYNSTR_6,
  DYNSTR_16,
  DYNSTR_32,
  DYNSTR_64,
  DYNSTR_MASK = 0x4,
};

struct [[gnu::packed]] dynstr_header_6 {
  uint8_t flags;
  char buf[];
};

struct [[gnu::packed]] dynstr_header_16 {
  uint16_t size;
  uint16_t capacity;
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

static inline size_t dynstr_length(const dynstr_t s) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_6:
    return flags >> 2;
  case DYNSTR_16:
    return DS_HD(16, s)->size;
  case DYNSTR_32:
    return DS_HD(32, s)->size;
  case DYNSTR_64:
    return DS_HD(32, s)->size;
  default:
    return 0;
  }
}

static inline size_t dynstr_available(const dynstr_t s) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_16: {
    DS_HD_LET(16, s->buf);
    return ds->capacity - ds->size;
  }
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

static inline void dynstr_set_size(const dynstr_t s, size_t size) {
  uint8_t flags = s->buf[-1];
  switch (flags & DYNSTR_MASK) {
  case DYNSTR_6:
    s->buf[-1] = (uint8_t)(DYNSTR_6 | (size << 2));
    break;
  case DYNSTR_16:
    DS_HD(16, s->buf)->size = size;
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
  case DYNSTR_16:
    return DS_HD(16, s)->capacity;
  case DYNSTR_32:
    return DS_HD(32, s)->capacity;
  case DYNSTR_64:
    return DS_HD(64, s)->capacity;
  default:
    return 0;
  }
}

static inline uint8_t dynstr_required_type(size_t size) {
  if (size < 1u<<6)
    return DYNSTR_6; 
  if (size < 1u<<16)
    return DYNSTR_16;
  if (size < 1llu<<32)
    return DYNSTR_32;
  return DYNSTR_64;
}

static inline uint8_t dynstr_type(const dynstr_t s) {
  return s->buf[-1] & DYNSTR_MASK;
}

static inline size_t dynstr_header_size(uint8_t ty) {
  switch (ty & DYNSTR_MASK) {
  case DYNSTR_6:
    return DS_HD_SIZE(6);
  case DYNSTR_16:
    return DS_HD_SIZE(16);
  case DYNSTR_32:
    return DS_HD_SIZE(32);
  case DYNSTR_64:
    return DS_HD_SIZE(64);
  default:
    return 0;
  }
}

static inline dynstr_t dynstr_new_with_size(const char *init, size_t len) {
  uint8_t *s;
  uint8_t ty = dynstr_required_type(len);
  size_t hdsz = dynstr_header_size(ty);

  void *p = malloc(hdsz + len + 1);
  memset(p, 0, hdsz + len + 1);
  
  s = (uint8_t *)p + hdsz;
  s[-1] = ty;
  switch (ty) {
  case DYNSTR_6:
    s[-1] = (uint8_t)(DYNSTR_6 | (len << 2));
    break;
  case DYNSTR_16:
    ((DS_HD_TY(16) *)p)->size = len;
    ((DS_HD_TY(16) *)p)->capacity = len;
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

  return (dynstr_t) s;
}

static inline dynstr_t dynstr_new_empty(void) {
  return dynstr_new_with_size(nullptr, 0);
}

static inline dynstr_t dynstr_from_cstr(const char *s) {
  return dynstr_new_with_size(s, strlen(s));
}

static inline char *dynstr_to_cstr(const dynstr_t ds) {
  return ds->buf;
}

static inline dynstr_t dynstr_dup(const dynstr_t ds) {
  return dynstr_new_with_size(dynstr_to_cstr(ds), dynstr_length(ds));
}

static inline void dynstr_free(dynstr_t ds) {
  if (ds) {
    free(ds->buf - dynstr_header_size(ds->buf[-1]));
  }
}

static inline void dynstr_clear(dynstr_t s) {
    dynstr_set_size(s, 0);
    s->buf[0] = '\0';
}

#endif

