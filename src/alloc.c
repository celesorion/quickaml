#include "alloc.h"
#include "obj.h"
#include "hashtbl.h"
#include "ptrdesc.h"

#include <string.h>
#include <stdlib.h>

HASHMAP_NEW_KIND_WITH_DEFAULTS(stackmap, uint32_t, void *, 8)

struct heap global_heap;

static void *heap_alloc(struct heap *h, size_t n) {
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

bool heap_init(struct heap *h, struct runtime_args rargs) {
  struct runtime_args *args = malloc(sizeof(rargs));
  size_t base_size = rargs.base_size;
  size_t align = rargs.align;
  uint8_t *s1 = aligned_alloc(align, base_size);
  uint8_t *s2 = aligned_alloc(align, base_size);
  if (!(s1 && s2)) return false;
  *args = rargs;
  *h = (struct heap) {
    .args       = args,
    .from_base  = s1,
    .from_limit = s1 + base_size,
    .to_base    = s2,
    .to_limit   = s2 + base_size,
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

static void worklist_init(struct heap *h) {
  h->scan = h->bump;
}

static bool worklist_is_empty(struct heap *h) {
  return h->scan == h->bump;
}

static size_t get_object_length(void *ref) {
  struct object *obj = ref;
  return object_length(obj->hd);
}

static size_t get_object_size(void *ref) {
  struct object *obj = ref;
  return object_size(obj->hd);
}

static void *worklist_pop(struct heap *h) {
  void *ref = h->scan;
  h->scan += get_object_size(ref);
  return ref;
}

static void **heap_forwarding_address(void *from_ref) {
  return (void **)from_ref;
}

static void *heap_copy(struct heap *h, void *from_ref) {
  void *to_ref = h->bump;
  h->bump += get_object_size(from_ref);
  memcpy(to_ref, from_ref, get_object_size(from_ref));
  *heap_forwarding_address(from_ref) = to_ref;
  return to_ref;
}

static void *heap_forward(struct heap *h, void *from_ref) {
  void *to_ref = *heap_forwarding_address(from_ref);
  if (to_ref)
    return to_ref;
  return heap_copy(h, from_ref);
}

static void heap_process_field(struct heap *h, void **field) {
  void *from_ref = *field;
  if (from_ref)
    *field = heap_forward(h, from_ref);
}

static void heap_scan_object(struct heap *h, void *ref) {
  size_t len = get_object_length(ref);
  struct object *obj = ref;
  for (size_t i = 0; i < len; ++i)
    heap_process_field(h, (void **)&obj->fields[i]);
}

void heap_collect_start(struct heap *h) {
  heap_flip(h);
  worklist_init(h);
}

void heap_collect_add_root(struct heap *h, void **root) {
  heap_process_field(h, root);
}

void heap_collect_end(struct heap *h) {
  while (!worklist_is_empty(h))
    heap_scan_object(h, worklist_pop(h)); 
}

[[gnu::noinline]]
static void *simple_malloc_fallback(size_t n, val_t *desc) {
  printf("global_heap: %p %p %p\n", global_heap.from_base, global_heap.from_limit, global_heap.bump);
  heap_collect_start(&global_heap);

  struct ptrdesc *pdesc = (void *)*desc;
  val_t *bp = desc + 2;

  struct nextptr next;
  next = frame_ptr_next(pdesc);

  while (next.found) {
    size_t offset = next.offset;
    printf("offset: %zu\n", offset);
    val_t *ptr = bp + offset;
    printf("ptr: %p\n", ptr);
    heap_collect_add_root(&global_heap, (void *)ptr);
    next = frame_ptr_next(pdesc);
  }

  heap_collect_end(&global_heap);

  return heap_alloc(&global_heap, n);
}

void *simple_malloc(size_t n, val_t *desc) {
  void *p = heap_alloc(&global_heap, n);
  if (p == nullptr)
    return simple_malloc_fallback(n, desc);
  return p;
}