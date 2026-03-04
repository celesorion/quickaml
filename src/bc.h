#ifndef QK_BC_H
#define QK_BC_H

// clang-format off
#define OPS(_) \
  _(TRAP,   "trap",     "trap",               3) \
  _(NOP,    "nop",      "nop",                0) \
  _(MOV,    "mov",      "move",               2) \
  _(EXTA,   "exta",     "ext-arg",            3) \
  _(LSI16,  "lsi16",    "load-sext-imm16",    2) \
  _(LZI16,  "lzi16",    "load-zext-imm16",    2) \
  _(LSI32,  "lsi32",    "load-sext-imm32",    2) \
  _(LZI32,  "lzi32",    "load-zext-imm32",    2) \
  _(LC,     "lc",       "load-const",         2) \
  _(APP,    "app",      "apply-n",            1) \
  _(CALL,   "call",     "call-n",             2) \
  _(JMP,    "jmp",      "jump",               1) \
  _(JR,     "jr",       "jump-register",      1) \
  _(DISP,   "disp",     "dispatch",           2) \
  _(RETU,   "retu",     "return-unit",        0) \
  _(RET,    "ret",      "return",             1) \
  _(RETN,   "retn",     "return-n",           2) \
  \
  _(MOBJ,   "mobj",     "make-object",        3) \
  _(MCLOS,  "mclos",    "make-closure",       3)
// clang-format on

typedef enum {
#define OPLIST(op, mnemonic, longname, n) op,
  OPS(OPLIST)
#undef OPLIST
      LIMIT
} op_t;

static_assert(LIMIT <= 256);

#define insn(i) ((i))
#define opcode(i) ((i) & 0xff)
#define arg3A(i) (((i) >> 8) & 0xff)
#define arg3B(i) (((i) >> 16) & 0xff)
#define arg3C(i) ((i) >> 24)
#define arg2A(i) arg3A(i)
#define arg2B(i) ((i) >> 16)
#define arg2sB(i) ((int32_t)(i) >> 16)
#define arg1A(i) ((uint32_t)(i) >> 8)
#define arg1sA(i) ((int32_t)(i) >> 8)
#define arg3B2B(i) (((uint32_t)(i)) & 0xff)
#define arg3C2B(i) ((((uint32_t)(i)) >> 8) & 0xff)

#define insnP(ip) (*(ip))
#define opcodeP(ip) (((uint8_t *)(ip))[0])
#define arg3AP(ip) (((uint8_t *)(ip))[1])
#define arg3BP(ip) (((uint8_t *)(ip))[2])
#define arg3CP(ip) (((uint8_t *)(ip))[3])
#define arg2AP(ip) arg3AP(ip)
#define arg2BP(ip) (((uint16_t *)(ip))[1])
#define arg2sBP(ip) (((int16_t *)(ip))[1])
#define arg1sAP(ip) ((int32_t)(*(ip)) >> 8)
#define arg1AP(ip) ((uint32_t)(*(ip)) >> 8)

#define mkOP(x_) (((bc_t)(x_)) & 0xff)
#define mk3A(x_) ((((bc_t)(x_)) & 0xff) << 8)
#define mk3B(x_) ((((bc_t)(x_)) & 0xff) << 16)
#define mk3C(x_) ((((bc_t)(x_)) & 0xff) << 24)
#define mk2A(x_) ((((bc_t)(x_)) & 0xff) << 8)
#define mk2B(x_) ((((bc_t)(x_)) & 0xffff) << 16)

#define make3ABC(op, a, b, c) (mkOP(op) | mk3A(a) | mk3B(b) | mk3C(c))
#define make2AB(op, a, b) (mkOP(op) | mk2A(a) | mk2B(b))
#define make2A(op, a) make2AB(op, a, 0)
#define make2B(op, b) make2AB(op, 0, b)

/*

MSB               24                16                8               LSB
+-----------------+-----------------+-----------------+-----------------+
|      3C(X)      |      3B(Z)      |      3A(Y)      |       OP        |
+-----------------+-----------------+-----------------+-----------------+

MSB                                                                   LSB
+-----------------------------------+-----------------+-----------------+
|              2(s)B                |        2A       |       OP        |
+-----------------------------------+-----------------+-----------------+

MSB                                                                   LSB
+-----------------------------------------------------+-----------------+
|                       1(s)A                         |       OP        |
+-----------------------------------------------------+-----------------+

*/

#endif
