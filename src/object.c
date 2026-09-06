#include "object.h"
#include "def.h"

#include <assert.h>
#include <inttypes.h>
#include <string.h>

struct forwarded {
  metainfo hd;
  void *to_ref;
};

COLD_HELPER void object_init(struct object *obj, enum tag tag, size_t nfields) {
  obj->hd = obj_meta_pack((uint32_t)object_size(nfields), tag, 0);
  obj->gclist = nullptr;
}

COLD_HELPER void str_init(struct str *str, size_t len) {
  str->hd = obj_meta_pack((uint32_t)(sizeof(struct str) + len + 1), TAG_STR, 0);
  str->bytes[len] = '\0';
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

void obj_print(FILE *out, val_t value) {
  if (val_is_empty(value)) {
    fprintf(out, "<trivial empty>");
    return;
  }

  if (val_is_null(value)) {
    fprintf(out, "<trivial unit>");
    return;
  }

  if (val_is_bool(value)) {
    fprintf(out, "<trivial %s>", val_as_bool(value) ? "true" : "false");
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
  switch (obj_tag_of(ref)) {
  case TAG_ARRAY:
    fprintf(out, "<array fields=%zu>", object_nfields(ref));
    break;
  case TAG_MAP:
    fprintf(out, "<map fields=%zu>", object_nfields(ref));
    break;
  case TAG_TYPE:
    fprintf(out, "<type methods=%zu>", object_nfields(ref) - 1);
    break;
  case TAG_STRUCT:
    fprintf(out, "<struct members=%zu>", object_nfields(ref) - 1);
    break;
  case TAG_STR: {
    struct str *str = ref;
    fprintf(out, "<str len=%zu \"%s\">", str_len(str), str->bytes);
    break;
  }
  case TAG_THUNK: {
    struct thunk *thunk = ref;
    fprintf(out, "<thunk ops=%p free=%" PRIu32 ">", (void *)thunk->ops,
            thunk->nfree);
    break;
  }
  case TAG_FREE:
    fprintf(out, "<free size=%zu>", obj_size(ref));
    break;
  default:
    fprintf(out, "<object tag=%d fields=%zu>", (int)obj_tag_of(ref),
            object_nfields(ref));
    break;
  }
}
