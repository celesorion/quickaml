#include "object.h"

#include <assert.h>
#include <inttypes.h>
#include <string.h>

struct forwarded {
  metainfo hd;
  void *to_ref;
};

val_t val_from_tag(uint8_t tag) {
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
  default:
    assert(0 && "val_from_tag: unhandled tag");
    return VAL_EMPTY;
  }
}

uint8_t val_tag(val_t value) {
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

void object_init(struct object *obj, uint16_t tag, size_t nfields) {
  obj->hd = obj_meta_pack((uint32_t)object_size(nfields), tag, OBJ_WORDS, 0);
}

void string_init(struct string *str, uint16_t tag, size_t len) {
  str->hd = obj_meta_pack((uint32_t)string_size(len), tag, OBJ_STRING, 0);
  str->len = (uint32_t)len;
  str->pad = 0;
  str->bytes[len] = '\0';
}

void closure_init(struct closure *clos, struct function *fn, size_t nfree) {
  clos->hd = obj_meta_pack((uint32_t)closure_size(nfree), OBJ_TAG_CLOSURE,
                           OBJ_CLOSURE, 0);
  clos->fn = fn;
  clos->nfree = (uint32_t)nfree;
  clos->pad = 0;
}

void obj_set_forward(void *from_ref, size_t size, void *to_ref) {
  struct forwarded *fwd = from_ref;
  fwd->hd = obj_meta_pack((uint32_t)size, 0, OBJ_FORWARD, 0);
  fwd->to_ref = to_ref;
}

void *obj_forwardee(const void *ref) {
  const struct forwarded *fwd = ref;
  assert(obj_kind_of(ref) == OBJ_FORWARD);
  return fwd->to_ref;
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
    fprintf(out, "<obj tag=%u fields=%zu>", obj_layout_tag(obj), nfields);
    break;
  }
  case OBJ_STRING: {
    struct string *str = ref;
    fprintf(out, "<str len=%" PRIu32 " \"%s\">", str->len, str->bytes);
    break;
  }
  case OBJ_CLOSURE: {
    struct closure *clos = ref;
    fprintf(out, "<closure fn=%p free=%" PRIu32 ">", (void *)clos->fn,
            clos->nfree);
    break;
  }
  case OBJ_FORWARD:
    fprintf(out, "<forward %p>", obj_forwardee(ref));
    break;
  }
}
