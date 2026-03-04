#ifndef QK_BC_H
#define QK_BC_H

// clang-format off
#define OPS(_) \
  _(Trap,    "trap",     "trap",               3) \
  _(Nop,     "nop",      "nop",                0) \
  _(Move,    "mov",      "move",               2) \
  _(Exta,    "exta",     "ext-arg",            3) \
  _(LoadI,   "lsi16",    "load-sext-imm16",    2) \
  _(LoaduI,  "lzi16",    "load-zext-imm16",    2) \
  _(LoadC,   "lc",       "load-const",         2) \
  _(Apply,   "app",      "apply-n",            1) \
  _(Call,    "call",     "call-n",             2) \
  _(Jmp,     "jmp",      "jump",               1) \
  _(Jr,      "jr",       "jump-register",      1) \
  _(Disp,    "disp",     "dispatch",           2) \
  _(Retu,    "retu",     "return-unit",        0) \
  _(Ret,     "ret",      "return",             1) \
  _(Retn,    "retn",     "return-n",           2) \
  \
  _(MkObj,   "mobj",     "make-object",        3) \
  _(Clos,    "mclos",    "make-closure",       3)
// clang-format on

typedef enum {
#define OPLIST(op, mnemonic, longname, n) op,
  OPS(OPLIST)
#undef OPLIST
      LIMIT
} op_t;

static_assert(LIMIT <= 256);

#define insn(i) ((i))
#define gOP(i) ((i) & 0xff)
#define g3A(i) (((i) >> 8) & 0xff)
#define g3B(i) (((i) >> 16) & 0xff)
#define g3C(i) ((i) >> 24)
#define g2A(i) g3A(i)
#define g2B(i) ((i) >> 16)
#define g2sB(i) ((int32_t)(i) >> 16)
#define g1A(i) ((uint32_t)(i) >> 8)
#define g1sA(i) ((int32_t)(i) >> 8)
#define g3B_of_2B(i) (((uint32_t)(i)) & 0xff)
#define g3C_of_2B(i) ((((uint32_t)(i)) >> 8) & 0xff)

#define insnP(ip) (*(ip))
#define gpOP(ip) (((uint8_t *)(ip))[0])
#define gp3A(ip) (((uint8_t *)(ip))[1])
#define gp3B(ip) (((uint8_t *)(ip))[2])
#define gp3C(ip) (((uint8_t *)(ip))[3])
#define gp2A(ip) gp3A(ip)
#define gp2B(ip) (((uint16_t *)(ip))[1])
#define gp2sB(ip) (((int16_t *)(ip))[1])
#define gp1sA(ip) ((int32_t)(*(ip)) >> 8)
#define gp1A(ip) ((uint32_t)(*(ip)) >> 8)

#define vOP(x_) (((bc_t)(x_)) & 0xff)
#define v3A(x_) ((((bc_t)(x_)) & 0xff) << 8)
#define v3B(x_) ((((bc_t)(x_)) & 0xff) << 16)
#define v3C(x_) ((((bc_t)(x_)) & 0xff) << 24)
#define v2A(x_) ((((bc_t)(x_)) & 0xff) << 8)
#define v2B(x_) ((((bc_t)(x_)) & 0xffff) << 16)
#define v1A(x_) ((((bc_t)(x_)) & 0xffffff) << 8)

#define mk3(op, a, b, c) (vOP(op) | v3A(a) | v3B(b) | v3C(c))
#define mk2(op, a, b) (vOP(op) | v2A(a) | v2B(b))
#define mk2A(op, a) mk2(op, a, 0)
#define mk2B(op, b) mk2(op, 0, b)
#define mk1(op, a) (vOP(op) | v1A(a))

// clang-format off
/*

          MSB               24                16                8               LSB
          +-----------------+-----------------+-----------------+-----------------+
  T3      |      3C(X)      |      3B(Z)      |      3A(Y)      |       OP        |
          +-----------------+-----------------+-----------------+-----------------+

          MSB                                                                   LSB
          +-----------------------------------+-----------------+-----------------+
  T2      |              2(s)B                |        2A       |       OP        |
          +-----------------------------------+-----------------+-----------------+

          MSB                                                                   LSB
          +-----------------------------------------------------+-----------------+
  T1      |                       1(s)A                         |       OP        |
          +-----------------------------------------------------+-----------------+

*/
// clang-format on

#endif
