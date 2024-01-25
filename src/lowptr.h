#ifndef ALLOCLOW_H
#define ALLOCLOW_H

#include <stdint.h>
enum {
  MEM_RW = 0,
  MEM_RWX = 1,
};

#if defined(_WIN32)
#if defined(_WIN64)
  // Win64
#else
  // Win32
#endif
#elif defined(__CYGWIN__) && !defined(_WIN32)
  // Cygwin, POSIX
#elif defined(__ANDROID__)
  // Android
#elif defined(__linux__)
  // Linux
#elif (defined(__unix__) || defined(__unix)) && !(defined(__APPLE__) && defined(__MACH__))
#include <sys/param.h>
#if defined(BSD)
  // BSD
#endif
#elif defined(__APPLE__) && defined(__MACH__) // Apple OSX and iOS (Darwin)
#include <TargetConditionals.h>
#if TARGET_OS_MAC == 1
  // all variants of macOS
#if !defined(TARGET_CPU_ARM64)
#else
  #include <sys/mman.h>
  struct tagged_lowptr {
    void *ptr;
    unsigned char tag;
  };
  // alloate memory between 0x300000000 and 0x100000000
  static inline void *alloclowptr(size_t size, int prot) {    
    if (prot == MEM_RWX)
      prot = PROT_READ | PROT_WRITE | PROT_EXEC;
    else if (prot == MEM_RW)
      prot = PROT_READ | PROT_WRITE;
    else
      return nullptr;
    for (unsigned long p = 0x100000000; p < 0x300000000; p += 0x1000000) {
      void *addr = mmap((void *)p, size, prot, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
      if (0x100000000 < (unsigned long)addr &&  (unsigned long)addr <= 0x300000000)
        return addr;
    }
    return nullptr;
  }
  static inline bool islowptr(void *p) {
    return 0x100000000 <= (unsigned long)p && (unsigned long)p < 0x300000000;
  }
  static inline uint32_t cutlowptr(void *p) {
    return (uint32_t)(uintptr_t)p;
  }
  static inline void *mklowptr(uint32_t p) {
    return (void *)(uintptr_t)p;
  }
  static inline void *enclowptr(void *p, uint8_t tag) {
    tag &= 0xf;
    return (void *)(((uintptr_t)p >> 2) | tag);
  }
  static inline struct tagged_lowptr declowptr(uint32_t p) {
    uint8_t tag = p & 0xf;
    return (struct tagged_lowptr){(void *)(((uintptr_t)p & ~0xful) << 2), .tag = tag};
  }
#endif
#else
#error "Unknown platform"
#endif

#endif

#endif
