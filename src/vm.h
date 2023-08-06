#include "bc.h"
#include "obj.h"

#include <stdint.h>
#include <stdlib.h>

#define frame_rv(bp) ((bp)[-2])
#define frame_ra(bp) ((bp)[-1])
#define prev_bp(bp, fo) ((bp)-2-(fo))
#define next_bp(bp, fo) ((bp)+2+(fo))
#define add2ip(ip, off) ((bc_t *)((unsigned char*)(ip) + (ptrdiff_t)off))  

