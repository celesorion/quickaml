#include "object.h"
#include "def.h"

#include <assert.h>
#include <inttypes.h>
#include <string.h>

struct forwarded {
  metainfo hd;
  void *to_ref;
};

COLD_HELPER val_t val_from_tag(uint8_t tag) {
  switch ((enum tag)tag) {
  case TAG_UNIT:
    return val_from_null();
  case TAG_TUPLE:
    return VAL_EMPTY;
  case TAG_FALSE:
    return val_from_bool(false);
  case TAG_TRUE:
    return val_from_bool(true);
  case TAG_INT: // TODO: requires heap-backed materialization
  case TAG_STR: // TODO: requires heap-backed materialization
  case TAG_FLOAT:
  case TAG_ARRAY:
  case TAG_MAP:
  default:
    assert(0 && "val_from_tag: unhandled tag");
    return VAL_EMPTY;
  }
}

COLD_HELPER uint8_t val_tag(val_t value) {
  if (val_is_null(value))
    return TAG_UNIT;
  if (val_is_empty(value))
    return TAG_TUPLE;
  if (val_is_bool(value))
    return val_as_bool(value) ? TAG_TRUE : TAG_FALSE;
  if (val_is_ptr(value))
    return (uint8_t)obj_layout_tag(val_as_ptr(value));
  return 0xff;
}

COLD_HELPER void object_init(struct object *obj, uint16_t tag, size_t nfields) {
  obj->hd = obj_meta_pack((uint32_t)object_size(nfields), tag, OBJ_WORDS, 0);
  obj->gclist = nullptr;
}

COLD_HELPER void str_init(struct str *str, uint16_t tag, size_t len) {
  str->hd = obj_meta_pack((uint32_t)(sizeof(struct str) + len + 1), tag,
                          OBJ_STRING, 0);
  str->bytes[len] = '\0';
}

COLD_HELPER void thunk_init(struct thunk *thunk, size_t nops, size_t nconst,
                            uint8_t nregs, size_t nfree) {
  thunk->hd = obj_meta_pack((uint32_t)thunk_size(nops, nconst, nfree),
                            OBJ_TAG_THUNK, OBJ_THUNK, 0);
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
  thunk->hd = obj_meta_pack((uint32_t)thunk_instance_size(nfree),
                            OBJ_TAG_THUNK, OBJ_THUNK, 0);
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

static const char *imm_name(uint8_t tag) {
  switch ((enum tag)tag) {
  case TAG_UNIT:
    return "unit";
  case TAG_TUPLE:
    return "empty";
  case TAG_FALSE:
    return "false";
  case TAG_TRUE:
    return "true";
  default:
    return nullptr;
  }
}

void obj_print(FILE *out, val_t value) {
  if (val_is_empty(value) || val_is_null(value) || val_is_bool(value)) {
    uint8_t tag = val_tag(value);
    const char *name = imm_name(tag);
    if (name)
      fprintf(out, "<trivial %s>", name);
    else
      fprintf(out, "<trivial tag=%" PRIu8 ">", tag);
    return;
  }

  if (val_is_int(value)) {
    fprintf(out, "<int %" PRId32 ">", val_as_i32(value));
    return;
  }

  if (val_is_float(value)) {
    fprintf(out, "<float %g>", val_as_f64(value));
    return;
  }

  void *ref = val_as_ptr(value);
  switch (obj_kind_of(ref)) {
  case OBJ_WORDS: {
    struct object *obj = ref;
    size_t nfields = (obj_size(obj) - sizeof(*obj)) / sizeof(val_t);
    switch ((enum tag)obj_layout_tag(obj)) {
    case TAG_ARRAY:
      fprintf(out, "<array fields=%zu>", nfields);
      break;
    case TAG_MAP:
      fprintf(out, "<map fields=%zu>", nfields);
      break;
    case TAG_TYPE:
      fprintf(out, "<type methods=%zu>", nfields - 1);
      break;
    case TAG_STRUCT:
      fprintf(out, "<struct members=%zu>", nfields - 1);
      break;
    default:
      fprintf(out, "<object tag=%u fields=%zu>", obj_layout_tag(obj), nfields);
      break;
    }
    break;
  }
  case OBJ_STRING: {
    struct str *str = ref;
    fprintf(out, "<str len=%zu \"%s\">", str_len(str), str->bytes);
    break;
  }
  case OBJ_THUNK: {
    struct thunk *thunk = ref;
    fprintf(out, "<thunk ops=%p free=%" PRIu32 ">", (void *)thunk->ops,
            thunk->nfree);
    break;
  }
  case OBJ_FREE:
    fprintf(out, "<free size=%zu>", obj_size(ref));
    break;
  }
}
