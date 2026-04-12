#include "alloc.h"
#include "trace.h"
#include "vm.h"

#include <stdlib.h>
#include <string.h>

struct heap global_heap;

static void *heap_alloc(struct heap *restrict h, size_t n) {
  uint8_t *cur = h->bump;
  void *p = cur;
  cur += n;
  if (cur > h->from_limit)
    return nullptr;
  else {
    h->bump = cur;
    return p;
  }
}

void heap_stat_print(struct heap *restrict h) {
  fprintf(stderr, "bump: %p\n", h->bump);
  fprintf(stderr, "from_base: %p\n", h->from_base);
  fprintf(stderr, "from_limit: %p\n", h->from_limit);
  fprintf(stderr, "to_base: %p\n", h->to_base);
  fprintf(stderr, "to_limit: %p\n", h->to_limit);
  fprintf(stderr, "used %.2lf%%\n",
          (double)(h->bump - h->from_base) / (h->from_limit - h->from_base) *
              100.0);
}

bool heap_init(struct heap *restrict h, struct runtime_args *restrict rargs) {
  size_t base_size = rargs->base_size;
  size_t align = rargs->align;
  uint8_t *s1 = aligned_alloc(align, base_size);
  uint8_t *s2 = aligned_alloc(align, base_size);
  if (!(s1 && s2))
    return false;
  *h = (struct heap){
      .bump = s1,
      .args = rargs,
      .from_base = s1,
      .from_limit = s1 + base_size,
      .to_base = s2,
      .to_limit = s2 + base_size,
  };
  return true;
}

static void heap_flip(struct heap *h) {
  void *old_base = h->from_base;
  void *old_limit = h->from_limit;
  h->from_base = h->to_base;
  h->from_limit = h->to_limit;
  h->bump = h->to_base;
  h->to_base = old_base;
  h->to_limit = old_limit;
}

static void worklist_init(struct heap *h) { h->scan = h->bump; }

static bool worklist_is_empty(struct heap *h) { return h->scan == h->bump; }

static size_t get_object_size(void *ref) { return obj_size(ref); }

static void *worklist_pop(struct heap *h) {
  void *ref = h->scan;
  h->scan += get_object_size(ref);
  return ref;
}

static void *heap_copy(struct heap *h, void *from_ref) {
  size_t size = get_object_size(from_ref);
  void *to_ref = h->bump;
  h->bump += size;
  memcpy(to_ref, from_ref, size);
  obj_set_forward(from_ref, size, to_ref);
  return to_ref;
}

static void *heap_forward(struct state *st, struct heap *h, void *from_ref) {
  if (obj_kind_of(from_ref) == OBJ_FORWARD) {
    void *to_ref = obj_forwardee(from_ref);
    trace(st, TRACE_0, "heap_forward: from_ref=%p to_ref=%p", from_ref, to_ref);
    return to_ref;
  }

  return heap_copy(h, from_ref);
}

static void heap_process_field(struct state *restrict st, struct heap *h,
                               val_t *field) {
  if (!val_is_ptr(*field))
    return;

  void *from_ref = val_as_ptr(*field);
  trace(st, TRACE_0, "heap_process_field: processing field %p", from_ref);
  *field = val_from_ptr(heap_forward(st, h, from_ref));
}

static void heap_scan_object(struct state *restrict st, struct heap *h,
                             void *restrict ref) {
  switch (obj_kind_of(ref)) {
  case OBJ_WORDS: {
    struct object *obj = ref;
    size_t nfields = (obj_size(obj) - sizeof(*obj)) / sizeof(val_t);
    for (size_t i = 0; i < nfields; i++)
      heap_process_field(st, h, &obj->fields[i]);
    break;
  }
  case OBJ_CLOSURE: {
    struct closure *clos = ref;
    for (size_t i = 0; i < clos->nfree; i++)
      heap_process_field(st, h, &clos->freevars[i]);
    break;
  }
  case OBJ_STRING:
  case OBJ_FORWARD:
    break;
  }
}

void heap_collect_start(struct heap *h) {
  heap_flip(h);
  worklist_init(h);
}

void heap_collect_add_root(struct state *restrict st, struct heap *h,
                           val_t *root) {
  heap_process_field(st, h, root);
}

void heap_collect_end(struct state *restrict st, struct heap *h) {
  trace(st, TRACE_0, "heap_collect_end: start scanning, worklist is empty? %d",
        worklist_is_empty(h));
  while (!worklist_is_empty(h))
    heap_scan_object(st, h, worklist_pop(h));
}

[[gnu::noinline]] static void *alloc_object_fallback(struct state *restrict st,
                                                     size_t n, val_t *bp) {
  struct heap *heap = st->heap;
  (void)bp;
  heap_collect_start(heap);

  // TODO: do collection

  heap_collect_end(st, heap);

  return heap_alloc(heap, n);
}

void *alloc_object(size_t n, struct state *restrict st, val_t *restrict bp) {
  void *p = heap_alloc(st->heap, n);
  if (p == nullptr) {
    trace(st, TRACE_0, "alloc_object: heap is full, collecting garbage");
    heap_stat_print(st->heap);
    return alloc_object_fallback(st, n, bp);
  }
  return p;
}
