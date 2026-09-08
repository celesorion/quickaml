#include "native.h"
#include "alloc.h"
#include "bc.h"
#include "object.h"
#include "vm.h"

#include <fcntl.h>
#include <inttypes.h>
#include <limits.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

static struct opaque *opaque_arg(val_t value, finalize_fn *finalize) {
  if (val_is_empty(value) || !val_is_ptr(value))
    return nullptr;
  struct opaque *o = val_as_ptr(value);
  return obj_tag_of(o) == TAG_OPAQUE && opaque_finalizer(o) == finalize
             ? o
             : nullptr;
}

#define NATIVE(name)                                                           \
  static const char *name([[maybe_unused]] struct fiber_segment *fiber,        \
                          [[maybe_unused]] val_t *args, val_t *out)

NATIVE(assert_eq) {
  if (args[0] != args[1]) {
    fprintf(stderr, "0x%" PRIx64 " != 0x%" PRIx64 "\n", args[0], args[1]);
    return "assertion failed";
  }
  *out = VAL_NULL;
  return nullptr;
}

NATIVE(print_raw) {
  fprintf(stderr, "%" PRIu64 "\n", args[0]);
  *out = VAL_NULL;
  return nullptr;
}

NATIVE(print_raw_hex) {
  fprintf(stderr, "0x%" PRIx64 "\n", args[0]);
  *out = VAL_NULL;
  return nullptr;
}

NATIVE(print_object) {
  obj_print(stderr, args[0]);
  fputc('\n', stderr);
  *out = VAL_NULL;
  return nullptr;
}

NATIVE(heap_stat) {
  heap_stat_print(fiber->state->heap);
  *out = VAL_NULL;
  return nullptr;
}

static void file_finalize(void *data) {
  int fd = *(int *)data;
  if (fd >= 0)
    close(fd);
}

static const char *file_fd(val_t handle, int **fd) {
  struct opaque *file = opaque_arg(handle, file_finalize);
  if (file == nullptr)
    return "not a file";
  *fd = (int *)file->data;
  return **fd < 0 ? "file is closed" : nullptr;
}

NATIVE(file_open) {
  if (!val_is_str(args[0]))
    return "file path is not a string";
  struct opaque *file =
      vm_opaque_alloc(fiber, args, sizeof(int), file_finalize);
  if (file == nullptr)
    return "out of memory";
  int *fd = (int *)file->data;
  *fd = open(val_as_str(args[0])->bytes, O_RDWR | O_CREAT, 0666);
  if (*fd < 0)
    return "file open failed";
  *out = val_from_ptr(file);
  return nullptr;
}

NATIVE(file_size) {
  int *fd;
  const char *err = file_fd(args[0], &fd);
  if (err != nullptr)
    return err;
  off_t end = lseek(*fd, 0, SEEK_END);
  if (end < 0 || end > INT32_MAX)
    return "file size out of range";
  *out = val_from_i32((int32_t)end);
  return nullptr;
}

NATIVE(file_edit) {
  int *fd;
  const char *err = file_fd(args[0], &fd);
  if (err != nullptr)
    return err;
  if (!val_is_int(args[1]) || val_as_i32(args[1]) < 0)
    return "file offset is not a nonnegative int";
  if (!val_is_int(args[2]) || val_as_i32(args[2]) < 0 ||
      val_as_i32(args[2]) > UCHAR_MAX)
    return "file byte is not in range";
  unsigned char byte = (unsigned char)val_as_i32(args[2]);
  if (lseek(*fd, val_as_i32(args[1]), SEEK_SET) < 0 ||
      write(*fd, &byte, 1) != 1)
    return "file write failed";
  *out = VAL_NULL;
  return nullptr;
}

NATIVE(file_close) {
  int *fd;
  const char *err = file_fd(args[0], &fd);
  if (err != nullptr)
    return err;
  int closing = *fd;
  *fd = -1;
  if (close(closing) != 0)
    return "file close failed";
  *out = VAL_NULL;
  return nullptr;
}

const struct native natives[] = {
    {"assert_eq", 2, assert_eq},       {"print_raw", 1, print_raw},
    {"print_raw_hex", 1, print_raw_hex}, {"print_object", 1, print_object},
    {"heap_stat", 0, heap_stat},       {"fopen", 1, file_open},
    {"fsize", 1, file_size},           {"fedit", 3, file_edit},
    {"fclose", 1, file_close},
};
const size_t nnatives = sizeof natives / sizeof *natives;

/* Native thunks live for the whole process, one per native, made on demand. */
struct thunk *vm_native_thunk(const char *name, uint32_t len) {
  static struct thunk *thunks[sizeof natives / sizeof *natives];
  for (size_t i = 0; i < nnatives; i++) {
    if (strlen(natives[i].name) != len ||
        memcmp(natives[i].name, name, len) != 0)
      continue;
    if (thunks[i] == nullptr) {
      bc_t op = vOP(Native) | v2B(i);
      thunks[i] =
          vm_thunk_alloc(&op, 1, nullptr, 0, natives[i].arity, nullptr, 0);
    }
    return thunks[i];
  }
  return nullptr;
}
