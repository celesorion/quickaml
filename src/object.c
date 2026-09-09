#include "object.h"
#include "def.h"

#include <assert.h>
#include <inttypes.h>
#include <stdarg.h>
#include <string.h>

struct forwarded {
  metainfo hd;
  void *to_ref;
};

COLD_HELPER void object_init(struct object *obj, enum tag tag, size_t nfields) {
  obj->hd = obj_meta_pack((uint32_t)object_size(nfields), tag, 0);
  obj->gclist = nullptr;
}

COLD_HELPER void view_init(struct view *v, struct object *type,
                           struct object *source, const uint8_t *idx) {
  const struct type_desc *desc = type_desc_of(type);
  v->hd = obj_meta_pack((uint32_t)view_size(desc->nfields), TAG_VIEW, 0);
  v->gclist = nullptr;
  v->type = val_from_type(type);
  v->source = val_from_ptr(source);
  memcpy(v->idx, idx, desc->nfields);
}

COLD_HELPER void str_init(struct str *str, size_t len) {
  str->hd = obj_meta_pack((uint32_t)(sizeof(struct str) + len + 1), TAG_STR, 0);
  str->bytes[len] = '\0';
}

COLD_HELPER void opaque_init(struct opaque *o, size_t n,
                             finalize_fn *finalize) {
  size_t size = opaque_size(n, finalize);
  o->hd = obj_meta_pack((uint32_t)size, TAG_OPAQUE, 0);
  if (finalize != nullptr) {
    o->hd |= OBJ_FLAG_FINALIZER;
    memcpy((char *)o + size - sizeof finalize, &finalize, sizeof finalize);
  }
}

COLD_HELPER void thunk_init(struct thunk *thunk, size_t nops, size_t nconst,
                            uint8_t nregs, size_t nfree) {
  thunk->hd = obj_meta_pack((uint32_t)thunk_size(nops, nconst, nfree),
                            TAG_THUNK, 0);
  thunk->gclist = nullptr;
  thunk->ops = (bc_t *)((unsigned char *)thunk + thunk_ops_offset(nfree));
  thunk->oplimit = thunk->ops + nops;
  thunk->ctbl = nconst == 0 ? nullptr
                            : (val_t *)((unsigned char *)thunk +
                                        thunk_constants_offset(nops, nfree));
  thunk->nconst = nconst;
  thunk->nfree = (uint32_t)nfree;
  thunk->nregs = nregs;
  thunk->pad[0] = 0;
  thunk->pad[1] = 0;
  thunk->pad[2] = 0;
}

COLD_HELPER void thunk_instance_init(struct thunk *thunk,
                                     const struct thunk *template) {
  size_t nfree = template->nfree;
  thunk->hd = obj_meta_pack((uint32_t)thunk_instance_size(nfree), TAG_THUNK,
                            0);
  thunk->gclist = nullptr;
  thunk->ops = template->ops;
  thunk->oplimit = template->oplimit;
  thunk->ctbl = template->ctbl;
  thunk->nconst = template->nconst;
  thunk->nfree = template->nfree;
  thunk->nregs = template->nregs;
  thunk->pad[0] = 0;
  thunk->pad[1] = 0;
  thunk->pad[2] = 0;
  for (size_t i = 0; i < nfree; i++)
    thunk->freevars[i] = VAL_EMPTY;
}

/* Values print as the syntax that builds them, closures and type values in
 * angle brackets.  A container marks its header while its fields print, so a
 * reference back to it prints as <cycle>, the way the OCaml toplevel does;
 * a shared value that closes no cycle simply prints again. */

#define PRINT_DEPTH_MAX 256

struct printer {
  char *buf; /* null once out of memory */
  size_t len;
  size_t cap;
};

static void print_bytes(struct printer *p, const char *bytes, size_t n) {
  if (p->buf == nullptr)
    return;
  if (p->cap - p->len <= n) {
    size_t cap = p->cap;
    while (cap - p->len <= n)
      cap *= 2;
    char *buf = realloc(p->buf, cap);
    if (buf == nullptr) {
      free(p->buf);
      p->buf = nullptr;
      return;
    }
    p->buf = buf;
    p->cap = cap;
  }
  memcpy(p->buf + p->len, bytes, n);
  p->len += n;
  p->buf[p->len] = '\0';
}

static void print_text(struct printer *p, const char *text) {
  print_bytes(p, text, strlen(text));
}

[[gnu::format(printf, 2, 3)]] static void print_fmt(struct printer *p,
                                                    const char *fmt, ...) {
  char text[32];
  va_list ap;
  va_start(ap, fmt);
  int n = vsnprintf(text, sizeof text, fmt, ap);
  va_end(ap);
  assert(n >= 0 && (size_t)n < sizeof text);
  print_bytes(p, text, (size_t)n);
}

static void print_str(struct printer *p, const struct str *str) {
  print_text(p, "\"");
  for (size_t i = 0; i < str_len(str); i++) {
    unsigned char byte = (unsigned char)str->bytes[i];
    const char *escaped = nullptr;
    switch (byte) {
    case '\n':
      escaped = "\\n";
      break;
    case '\r':
      escaped = "\\r";
      break;
    case '\t':
      escaped = "\\t";
      break;
    case '\\':
      escaped = "\\\\";
      break;
    case '"':
      escaped = "\\\"";
      break;
    }
    if (escaped != nullptr)
      print_text(p, escaped);
    else if (byte < 0x20 || byte == 0x7f)
      print_fmt(p, "\\x%02x", byte);
    else
      print_bytes(p, &str->bytes[i], 1);
  }
  print_text(p, "\"");
}

/* The fields a value prints: all of a tuple or array, the declared ones of a
 * struct, the source fields of a view, which print_struct picks from through
 * the slot table.  Every other value is a leaf. */
static const val_t *print_fields(val_t value, size_t *n) {
  *n = 0;
  if (!val_is_ptr(value) || val_is_empty(value))
    return nullptr;
  const struct object *obj = val_as_ptr(value);
  switch (obj_tag_of(obj)) {
  case TAG_TUPLE:
  case TAG_ARRAY:
    *n = object_nfields(obj);
    return obj->fields;
  case TAG_STRUCT:
    *n = type_desc_of(val_as_type(obj->fields[0]))->nfields;
    return obj->fields + 1;
  case TAG_VIEW:
    *n = type_desc_of(view_type((const struct view *)obj))->nfields;
    return view_source((const struct view *)obj)->fields + 1;
  default:
    return nullptr;
  }
}


static void print_value(struct printer *p, val_t value, int depth);

static void print_list(struct printer *p, const val_t *fields, size_t n,
                       int depth) {
  for (size_t i = 0; i < n; i++) {
    if (i != 0)
      print_text(p, ", ");
    print_value(p, fields[i], depth + 1);
  }
}

/* A struct or view prints as its type name and `field = value` pairs; idx
 * maps the fields of the type to slots of fields, or is null for identity. */
static void print_struct(struct printer *p, const struct type_desc *desc,
                         const val_t *fields, const uint8_t *idx, int depth) {
  print_bytes(p, desc->name, desc->namelen);
  print_text(p, "{");
  for (size_t i = 0; i < desc->nfields; i++) {
    if (i != 0)
      print_text(p, ", ");
    print_bytes(p, desc->members[i].name, desc->members[i].len);
    print_text(p, " = ");
    print_value(p, fields[idx == nullptr ? i : idx[i]], depth + 1);
  }
  print_text(p, "}");
}

static void print_value(struct printer *p, val_t value, int depth) {
  if (val_is_empty(value)) {
    print_text(p, "<empty>");
    return;
  }
  if (val_is_null(value)) {
    print_text(p, "()");
    return;
  }
  if (val_is_bool(value)) {
    print_text(p, val_as_bool(value) ? "true" : "false");
    return;
  }
  if (val_is_int(value)) {
    print_fmt(p, "%" PRId32, val_as_i32(value));
    return;
  }
  if (val_is_float(value)) {
    print_fmt(p, "%.17g", val_as_f64(value));
    return;
  }

  struct object *obj = val_as_ptr(value);
  size_t n;
  const val_t *fields = print_fields(value, &n);
  if (fields != nullptr) {
    if (obj->hd & OBJ_FLAG_PRINT_PATH) {
      print_text(p, "<cycle>");
      return;
    }
    if (depth == PRINT_DEPTH_MAX) {
      print_text(p, "...");
      return;
    }
    obj->hd |= OBJ_FLAG_PRINT_PATH;
  }

  switch (obj_tag_of(obj)) {
  case TAG_TUPLE:
    print_text(p, "(");
    print_list(p, fields, n, depth);
    print_text(p, ")");
    break;
  case TAG_ARRAY:
    print_text(p, "[");
    print_list(p, fields, n, depth);
    print_text(p, "]");
    break;
  case TAG_MAP:
    print_text(p, object_nfields(obj) == 0 ? "{}" : "{...}");
    break;
  case TAG_STRUCT:
    print_struct(p, type_desc_of(val_as_type(obj->fields[0])), fields, nullptr,
                 depth);
    break;
  case TAG_VIEW: {
    const struct view *v = (const struct view *)obj;
    print_struct(p, type_desc_of(view_type(v)), fields, v->idx, depth);
    break;
  }
  case TAG_TYPE: {
    const struct type_desc *desc = type_desc_of(obj);
    print_text(p, "<type ");
    print_bytes(p, desc->name, desc->namelen);
    print_text(p, ">");
    break;
  }
  case TAG_STR:
    print_str(p, (const struct str *)obj);
    break;
  case TAG_THUNK:
    print_text(p, "<fn>");
    break;
  case TAG_OPAQUE:
    print_text(p, "<opaque>");
    break;
  case TAG_FREE:
    print_text(p, "<free>");
    break;
  case TAG_PAD:
    print_text(p, "<pad>");
    break;
  }

  if (fields != nullptr)
    obj->hd &= ~OBJ_FLAG_PRINT_PATH;
}

/* The text of a value, to be freed by the caller; null when out of memory. */
char *obj_format(val_t value) {
  struct printer p = {.buf = malloc(64), .cap = 64};
  if (p.buf == nullptr)
    return nullptr;
  p.buf[0] = '\0';
  print_value(&p, value, 0);
  return p.buf;
}

void obj_print(FILE *out, val_t value) {
  char *text = obj_format(value);
  fputs(text != nullptr ? text : "<out of memory>", out);
  free(text);
}
