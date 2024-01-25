#ifndef QK_BC_H
#define QK_BC_H

enum {
  O_Nil,
  O_Imm8,
  O_Imm16,
  O_Imm24,
  O_I8S,
  O_I16S,
  O_I32S,
  O_I64S,
  O_F32S,
  O_F64S,
  O_Const,
  O_AllS,
  O_Fn,
  O_Closu,
};

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
  _(RETU,   "retu",     "return-unit",        0)\
  _(RET,    "ret",      "return",             1) \
  _(RETN,   "retn",     "return-n",           2) \
  \
  _(MOBJ,   "mobj",     "make-object",        3) \
  _(MCLOS,  "mclos",    "make-closure",       3) \
  _(SF,     "sf",       "set-field",          3) \
  _(GF,     "gf",       "get-field",          3) \
  _(SFX,    "sfx",      "set-field-ext",      2) \
  _(GFX,    "gfx",      "get-field-ext",      2) \
  _(SFXI8,  "sfxi8",    "set-field-ext-imm8", 2) \
  _(SFXI16, "sfxi16",   "set-field-ext-imm16",2) \
  _(LP8,    "lp8",      "load-ptr-u8",        3) \
  _(LP16,   "lp16",     "load-ptr-u16",       3) \
  _(LP32,   "lp32",     "load-ptr-u32",       3) \
  _(LP64,   "lp64",     "load-ptr-u64",       3) \
  _(SP8,    "sp8",      "store-ptr-u8",       3) \
  _(SP16,   "sp16",     "store-ptr-u16",      3) \
  _(SP32,   "sp32",     "store-ptr-u32",      3) \
  _(SP64,   "sp64",     "store-ptr-u64",      3) \
  \
  _(CSET,   "cset",     "conditional-set",    3) \
  \
  _(CEQZ64, "ceqz64",   "cmp-eqz-64",         1) \
  _(CEQZ32, "ceqz32",   "cmp-eqz-32",         1) \
  _(CNEZ64, "cnez64",   "cmp-nez-64",         1) \
  _(CNEZ32, "cnez32",   "cmp-nez-32",         1) \
  \
  _(CEQSI16,"ceqsi16",  "cmp-eq-s64-imm16",   2) \
  _(CNESI16,"cnesi16",  "cmp-ne-s64-imm16",   2) \
  _(CLTSI16,"cltsi16",  "cmp-lt-s64-imm16",   2) \
  _(CLESI16,"clesi16",  "cmp-le-s64-imm16",   2) \
  _(CGTSI16,"cgtsi16",  "cmp-gt-s64-imm16",   2) \
  _(CGESI16,"cgesi16",  "cmp-ge-s64-imm16",   2) \
  \
  _(CEQUI16,"cequi16",  "cmp-eq-u64-imm16",   2) \
  _(CNEUI16,"cneui16",  "cmp-ne-u64-imm16",   2) \
  _(CLTUI16,"cltui16",  "cmp-lt-u64-imm16",   2) \
  _(CLEUI16,"cleui16",  "cmp-le-u64-imm16",   2) \
  _(CGTUI16,"cgtui16",  "cmp-gt-u64-imm16",   2) \
  _(CGEUI16,"cgeui16",  "cmp-ge-u64-imm16",   2) \
  \
  _(CEQ64,  "ceq64",    "cmp-eq-64",          2) \
  _(CNE64,  "cne64",    "cmp-ne-64",          2) \
  _(CLTU64, "cltu64",   "cmp-lt-u64",         2) \
  _(CLEU64, "cleu64",   "cmp-le-u64",         2) \
  _(CLTS64, "clts64",   "cmp-lt-s64",         2) \
  _(CLES64, "cles64",   "cmp-le-s64",         2) \
  \
  _(CEQ32,  "ceq32",    "cmp-eq-32",          2) \
  _(CNE32,  "cne32",    "cmp-ne-32",          2) \
  _(CLTU32, "cltu32",   "cmp-lt-u32",         2) \
  _(CLEU32, "cleu32",   "cmp-le-u32",         2) \
  _(CLTS32, "clts32",   "cmp-lt-s32",         2) \
  _(CLES32, "cles32",   "cmp-le-s32",         2) \
  \
  _(EXTEND, "extend",   "extend",             3) \
  _(WRAP,   "wrap",     "wrap",               3) \
  \
  _(CTZ,    "ctz",      "ctz",                3) \
  _(CLZ,    "clz",      "clz",                3) \
  _(POPCNT, "popcnt",   "popcount",           3) \
  \
  _(AND64,  "and64",    "and-u64",            3) \
  _(OR64,   "or64",     "or-u64",             3) \
  _(XOR64,  "xor64",    "xor-u64",            3) \
  _(NOTA64, "nota64",   "not-add-u64",        3) \
  _(SHL64,  "shl64",    "shl-u64",            3) \
  _(SHRU64, "shru64",   "shr-u64",            3) \
  _(SHRS64, "shrs64",   "shr-s64",            3) \
  _(ROTL64, "rotl64",   "rotl-u64",           3) \
  _(ROTR64, "rotr64",   "rotr-u64",           3) \
  \
  _(AND32,  "and32",    "and-u32",            3) \
  _(OR32,   "or32",     "or-u32",             3) \
  _(XOR32,  "xor32",    "xor-u32",            3) \
  _(NOTA32, "notau32",  "not-add-u32",        3) \
  _(SHL32,  "shl32",    "shl-u32",            3) \
  _(SHRU32, "shru32",   "shr-u32",            3) \
  _(SHRS32, "shrs32",   "shr-s32",            3) \
  _(ROTL32, "rotl32",   "rotl-u32",           3) \
  _(ROTR32, "rotr32",   "rotr-u32",           3) \
  \
  _(ADD64,  "add64",    "add-u64",            3) \
  _(SUB64,  "sub64",    "sub-u64",            3) \
  _(MUL64,  "mul64",    "mul-u64",            3) \
  _(MUHS64, "muhs64",   "mul-high-s64",       3) \
  _(MUHU64, "muhu64",   "mul-high-u64",       3) \
  _(DIVS64, "divs64",   "div-s64",            3) \
  _(DIVU64, "divu64",   "div-u64",            3) \
  _(REMS64, "rems64",   "rem-s64",            3) \
  _(REMU64, "remu64",   "rem-u64",            3) \
  _(DIRU64, "diru64",   "div-rem-u64",        3) \
  _(DIRS64, "dirs64",   "div-rem-s64",        3) \
  \
  _(ADD32,  "add32",    "add-u32",            3) \
  _(SUB32,  "sub32",    "sub-u32",            3) \
  _(MUL32,  "mul32",    "mul-u32",            3) \
  _(MUHS32, "muhs32",   "mul-high-s32",       3) \
  _(MUHU32, "muhu32",   "mul-high-u32",       3) \
  _(DIVS32, "divs32",   "div-s32",            3) \
  _(DIVU32, "divu32",   "div-u32",            3) \
  _(REMS32, "rems32",   "rem-s32",            3) \
  _(REMU32, "remu32",   "rem-u32",            3) \
  _(DIRU32, "diru32",   "div-rem-u32",        3) \
  _(DIRS32, "dirs32",   "div-rem-s32",        3) \
  \
  _(ADD64I, "add64i",   "add-u64-imm8",       3) \
  _(SUB64I, "sub64i",   "sub-u64-imm8",       3) \
  _(MUL64I, "mul64i",   "mul-u64-imm8",       3) \
  \
  _(ADD32I, "add32i",   "add-u32-imm8",       3) \
  _(SUB32I, "sub32i",   "sub-u32-imm8",       3) \
  _(MUL32I, "mul32i",   "mul-u32-imm8",       3) \
  \
  _(MAXS64, "maxs64",   "max-s64",            3) \
  _(MAXU64, "maxu64",   "max-u64",            3) \
  _(MINS64, "mins64",   "min-s64",            3) \
  _(MINU64, "minu64",   "min-u64",            3) \
  \
  _(MAXS32, "maxs32",   "max-s32",            3) \
  _(MAXU32, "maxu32",   "max-u32",            3) \
  _(MINS32, "mins32",   "min-s32",            3) \
  _(MINU32, "minu32",   "min-u32",            3)


typedef enum {
#define OPLIST(op, mnemonic, longname, n) op,
OPS(OPLIST)
#undef OPLIST
  LIMIT
} op_t;

static_assert(LIMIT <= 256);

#define insn(i)     ((i))
#define opcode(i)   ((i)&0xff)
#define arg3A(i)  (((i)>>8)&0xff)
#define arg3B(i)  (((i)>>16)&0xff)
#define arg3C(i)  ((i)>>24)
#define arg2A(i)  arg3A(i)
#define arg2B(i)  ((i)>>16)
#define arg2sB(i) ((int32_t)(i)>>16)
#define arg1A(i)  ((uint32_t)(i)>>8)
#define arg1sA(i) ((int32_t)(i)>>8)
#define arg3B2B(i) (((uint32_t)(i))&0xff)
#define arg3C2B(i) ((((uint32_t)(i))>>8)&0xff)

#define insnP(ip)   (*(ip))
#define opcodeP(ip) (((uint8_t*)(ip))[0])
#define arg3AP(ip)  (((uint8_t*)(ip))[1])
#define arg3BP(ip)  (((uint8_t*)(ip))[2])
#define arg3CP(ip)  (((uint8_t*)(ip))[3])
#define arg2AP(ip)  arg3AP(ip)
#define arg2BP(ip)  (((uint16_t*)(ip))[1])
#define arg2sBP(ip) (((int16_t*)(ip))[1])
#define arg1sAP(ip) ((int32_t)(*(ip))>>8)
#define arg1AP(ip)  ((uint32_t)(*(ip))>>8)

#define mkOP(x_)  (((bc_t)(x_))&0xff)
#define mk3A(x_)  ((((bc_t)(x_))&0xff)<<8)
#define mk3B(x_)  ((((bc_t)(x_))&0xff)<<16)
#define mk3C(x_)  ((((bc_t)(x_))&0xff)<<24)
#define mk2A(x_)  ((((bc_t)(x_))&0xff)<<8)
#define mk2B(x_)  ((((bc_t)(x_))&0xffff)<<16)

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
