#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "y64asm.h"

line_t *line_head = NULL;
line_t *line_tail = NULL;
int lineno = 0;

#define err_print(_s, _a ...) do { \
  if (lineno < 0) \
    fprintf(stderr, "[--]: "_s"\n", ## _a); \
  else \
    fprintf(stderr, "[L%d]: "_s"\n", lineno, ## _a); \
} while (0);


int64_t vmaddr = 0;    /* vm addr */

/* register table */
const reg_t reg_table[REG_NONE] = {
        {"%rax", REG_RAX, 4},
        {"%rcx", REG_RCX, 4},
        {"%rdx", REG_RDX, 4},
        {"%rbx", REG_RBX, 4},
        {"%rsp", REG_RSP, 4},
        {"%rbp", REG_RBP, 4},
        {"%rsi", REG_RSI, 4},
        {"%rdi", REG_RDI, 4},
        {"%r8",  REG_R8,  3},
        {"%r9",  REG_R9,  3},
        {"%r10", REG_R10, 4},
        {"%r11", REG_R11, 4},
        {"%r12", REG_R12, 4},
        {"%r13", REG_R13, 4},
        {"%r14", REG_R14, 4}
};
const reg_t* find_register(char *name)
{
    int i;
    for (i = 0; i < REG_NONE; i++)
        if (strncmp(name, reg_table[i].name, reg_table[i].namelen) == 0)
            return &reg_table[i];
    return NULL;
}


/* instruction set */
instr_t instr_set[] = {
        {"nop", 3,   HPACK(I_NOP, F_NONE), 1 },
        {"halt", 4,  HPACK(I_HALT, F_NONE), 1 },
        {"rrmovq", 6,HPACK(I_RRMOVQ, F_NONE), 2 },
        {"cmovle", 6,HPACK(I_RRMOVQ, C_LE), 2 },
        {"cmovl", 5, HPACK(I_RRMOVQ, C_L), 2 },
        {"cmove", 5, HPACK(I_RRMOVQ, C_E), 2 },
        {"cmovne", 6,HPACK(I_RRMOVQ, C_NE), 2 },
        {"cmovge", 6,HPACK(I_RRMOVQ, C_GE), 2 },
        {"cmovg", 5, HPACK(I_RRMOVQ, C_G), 2 },
        {"irmovq", 6,HPACK(I_IRMOVQ, F_NONE), 10 },
        {"rmmovq", 6,HPACK(I_RMMOVQ, F_NONE), 10 },
        {"mrmovq", 6,HPACK(I_MRMOVQ, F_NONE), 10 },
        {"addq", 4,  HPACK(I_ALU, A_ADD), 2 },
        {"subq", 4,  HPACK(I_ALU, A_SUB), 2 },
        {"andq", 4,  HPACK(I_ALU, A_AND), 2 },
        {"xorq", 4,  HPACK(I_ALU, A_XOR), 2 },
        {"jmp", 3,   HPACK(I_JMP, C_YES), 9 },
        {"jle", 3,   HPACK(I_JMP, C_LE), 9 },
        {"jl", 2,    HPACK(I_JMP, C_L), 9 },
        {"je", 2,    HPACK(I_JMP, C_E), 9 },
        {"jne", 3,   HPACK(I_JMP, C_NE), 9 },
        {"jge", 3,   HPACK(I_JMP, C_GE), 9 },
        {"jg", 2,    HPACK(I_JMP, C_G), 9 },
        {"call", 4,  HPACK(I_CALL, F_NONE), 9 },
        {"ret", 3,   HPACK(I_RET, F_NONE), 1 },
        {"pushq", 5, HPACK(I_PUSHQ, F_NONE), 2 },
        {"popq", 4,  HPACK(I_POPQ, F_NONE),  2 },
        {".byte", 5, HPACK(I_DIRECTIVE, D_DATA), 1 },
        {".word", 5, HPACK(I_DIRECTIVE, D_DATA), 2 },
        {".long", 5, HPACK(I_DIRECTIVE, D_DATA), 4 },
        {".quad", 5, HPACK(I_DIRECTIVE, D_DATA), 8 },
        {".pos", 4,  HPACK(I_DIRECTIVE, D_POS), 0 },
        {".align", 6,HPACK(I_DIRECTIVE, D_ALIGN), 0 },
        {NULL, 1,    0   , 0 } //end
};

instr_t *find_instr(char *name)
{
    int i;
    for (i = 0; instr_set[i].name; i++)
        if (strncmp(instr_set[i].name, name, instr_set[i].len) == 0)
            return &instr_set[i];
    return NULL;
}

/* symbol table (don't forget to init and finit it) */
symbol_t *symtab = NULL;

/*
 * find_symbol: scan table to find the symbol
 * args
 *     name: the name of symbol
 *
 * return
 *     symbol_t: the 'name' symbol
 *     NULL: not exist
 */
symbol_t *find_symbol(char *name)
{
    symbol_t *p = NULL;

    p = symtab->next;
    while (p != NULL) {
        if (strncmp(p->name, name, strlen(p->name)) == 0)
            return p;
        p = p->next;
    }

    return NULL;
}

/*
 * add_symbol: add a new symbol to the symbol table
 * args
 *     name: the name of symbol
 *
 * return
 *     0: success
 *     -1: error, the symbol has exist
 */
int add_symbol(char *name)
{
    /* check duplicate */
    if (find_symbol(name) != NULL) {
        err_print("Dup symbol:%s", name)
        return -1;
    }

    /* create new symbol_t (don't forget to free it)*/
    symbol_t *tmp = (symbol_t *) malloc(sizeof(symbol_t));
    memset(tmp, 0, sizeof(symbol_t));
    tmp->name = name;
    tmp->addr = vmaddr;
    tmp->next = symtab->next;

    /* add the new symbol_t to symbol table */
    symtab->next = tmp;

    return 0;
}

/* relocation table (don't forget to init and finit it) */
reloc_t *reltab = NULL;

/*
 * add_reloc: add a new relocation to the relocation table
 * args
 *     name: the name of symbol
 */
void add_reloc(char *name, bin_t *bin)
{
    /* create new reloc_t (don't forget to free it)*/
    reloc_t *tmp = (reloc_t *)malloc(sizeof(reloc_t)); // free in finit
    memset(tmp, 0, sizeof(reloc_t));
    tmp->name = name;
    tmp->y64bin = bin;
    tmp->next = reltab->next;

    /* add the new reloc_t to relocation table */
    reltab->next = tmp;
}


/* macro for parsing y64 assembly code */
#define IS_DIGIT(s) ((*(s)>='0' && *(s)<='9') || *(s)=='-' || *(s)=='+')
#define IS_LETTER(s) ((*(s)>='a' && *(s)<='z') || (*(s)>='A' && *(s)<='Z'))
#define IS_COMMENT(s) (*(s)=='#')
#define IS_REG(s) (*(s)=='%')
#define IS_IMM(s) (*(s)=='$')

#define IS_BLANK(s) (*(s)==' ' || *(s)=='\t')
#define IS_END(s) (*(s)=='\0')

#define SKIP_BLANK(s) do {  \
  while(!IS_END(s) && IS_BLANK(s))  \
    (s)++;    \
} while(0);

/* return value from different parse_xxx function */
typedef enum { PARSE_ERR=-1, PARSE_REG, PARSE_DIGIT, PARSE_SYMBOL,
    PARSE_MEM, PARSE_DELIM, PARSE_INSTR, PARSE_LABEL} parse_t;

/*
 * parse_instr: parse an expected data token (e.g., 'rrmovq')
 * args
 *     ptr: point to the start of string
 *     inst: point to the inst_t within instr_set
 *
 * return
 *     PARSE_INSTR: success, move 'ptr' to the first char after token,
 *                            and store the pointer of the instruction to 'inst'
 *     PARSE_ERR: error, the value of 'ptr' and 'inst' are undefined
 */
parse_t parse_instr(char **ptr, instr_t **inst)
{
    /* skip the blank */
    SKIP_BLANK(*ptr)

    /* find_instr and check end */
    int pos = 0;
    if (**ptr == '.') pos++;
    while (IS_LETTER(*ptr + pos)) pos++;
    (*ptr)[pos] = '\0';
    *inst = find_instr(*ptr);
    if (*inst == NULL || (!IS_BLANK((*ptr) + (*inst)->len) && !IS_END((*ptr) + (*inst)->len)))
        return PARSE_ERR;

    /* set 'ptr' and 'inst' */
    (*ptr) += pos;
    **ptr = ' ';

    return PARSE_INSTR;
}

/*
 * parse_delim: parse an expected delimiter token (e.g., ',')
 * args
 *     ptr: point to the start of string
 *
 * return
 *     PARSE_DELIM: success, move 'ptr' to the first char after token
 *     PARSE_ERR: error, the value of 'ptr' and 'delim' are undefined
 */
parse_t parse_delim(char **ptr, char delim)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)
    if (**ptr != delim) return PARSE_ERR;

    /* set 'ptr' */
    (*ptr)++;

    return PARSE_DELIM;
}

/*
 * parse_reg: parse an expected register token (e.g., '%rax')
 * args
 *     ptr: point to the start of string
 *     regid: point to the regid of register
 *
 * return
 *     PARSE_REG: success, move 'ptr' to the first char after token,
 *                         and store the regid to 'regid'
 *     PARSE_ERR: error, the value of 'ptr' and 'regid' are undefined
 */
parse_t parse_reg(char **ptr, regid_t *regid)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)
    if (!IS_REG(*ptr)) {
        err_print("Invalid REG")
        return PARSE_ERR;
    }
    char tmp;

    /* find register */
    int pos = 1;
    while (IS_LETTER(*ptr + pos) || IS_DIGIT(*ptr + pos)) pos++;
    tmp = (*ptr)[pos];
    (*ptr)[pos] = '\0';
    const reg_t *reg = find_register(*ptr);
    if (reg == NULL || (!IS_BLANK((*ptr) + reg->namelen) && !IS_END((*ptr) + reg->namelen))){
        err_print("Invalid REG")
        return PARSE_ERR;
    }

    /* set 'ptr' and 'regid' */
    (*ptr) += pos;
    **ptr = tmp;
    *regid = reg->id;

    return PARSE_REG;
}

/*
 * parse_symbol: parse an expected symbol token (e.g., 'Main')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *
 * return
 *     PARSE_SYMBOL: success, move 'ptr' to the first char after token,
 *                               and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr' and 'name' are undefined
 */
parse_t parse_symbol(char **ptr, char **name)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)

    /* allocate name and copy to it */
    int pos = 0;
    while (IS_LETTER(*ptr) || IS_DIGIT(*ptr))
        (*name)[pos++] = *((*ptr)++);
    (*name)[pos] = '\0';

    /* set 'ptr' and 'name' */
    return PARSE_SYMBOL;
}

/*
 * parse_digit: parse an expected digit token (e.g., '0x100')
 * args
 *     ptr: point to the start of string
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, move 'ptr' to the first char after token
 *                            and store the value of digit to 'value'
 *     PARSE_ERR: error, the value of 'ptr' and 'value' are undefined
 */
parse_t parse_digit(char **ptr, long *value)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)
    if (**ptr == '$') (*ptr)++;
    int pos = 0;
    if (**ptr == '-') pos++;
    if ((*ptr)[pos] == '0' && ((*ptr)[pos + 1] == 'x' || (*ptr)[pos + 1] == 'X')) {
        pos += 2;
        while (!IS_END(*ptr + pos) && !IS_BLANK(*ptr + pos) && (*ptr)[pos] != ',') {
            if (((*ptr)[pos] >= '0' && (*ptr)[pos] <= '9') ||
                ((*ptr)[pos] >= 'a' && (*ptr)[pos] <= 'f') ||
                ((*ptr)[pos] >= 'A' && (*ptr)[pos] <= 'F'))
            {pos++; continue;}
            return PARSE_ERR;
        }
    } else {
        while (!IS_END(*ptr + pos) && !IS_BLANK(*ptr + pos) && (*ptr)[pos] != ',') {
            if (((*ptr)[pos] >= '0' && (*ptr)[pos] <= '9'))
            {pos++; continue;}
            return PARSE_ERR;
        }
    }

    /* calculate the digit, (NOTE: see strtoll()) */
    *value = strtoull(*ptr, NULL, 0);

    /* set 'ptr' and 'value' */
    while (IS_DIGIT(*ptr) || IS_LETTER(*ptr)) (*ptr)++;

    return PARSE_DIGIT;
}

/*
 * parse_imm: parse an expected immediate token (e.g., '$0x100' or 'STACK')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, the immediate token is a digit,
 *                            move 'ptr' to the first char after token,
 *                            and store the value of digit to 'value'
 *     PARSE_SYMBOL: success, the immediate token is a symbol,
 *                            move 'ptr' to the first char after token,
 *                            and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr', 'name' and 'value' are undefined
 */
parse_t parse_imm(char **ptr, char **name, long *value)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)

    /* if IS_IMM, then parse the digit */
    if (IS_IMM(*ptr)) return parse_digit(ptr, value);

    /* if IS_LETTER, then parse the symbol */
    if (IS_LETTER(*ptr)) return parse_symbol(ptr, name);

    /* set 'ptr' and 'name' or 'value' */
    return PARSE_ERR;
}

/*
 * parse_mem: parse an expected memory token (e.g., '8(%rbp)')
 * args
 *     ptr: point to the start of string
 *     value: point to the value of digit
 *     regid: point to the regid of register
 *
 * return
 *     PARSE_MEM: success, move 'ptr' to the first char after token,
 *                          and store the value of digit to 'value',
 *                          and store the regid to 'regid'
 *     PARSE_ERR: error, the value of 'ptr', 'value' and 'regid' are undefined
 */
parse_t parse_mem(char **ptr, long *value, regid_t *regid)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)

    /* calculate the digit and register, (ex: (%rbp) or 8(%rbp)) */
    *value = strtoll(*ptr, NULL, 0);
    while (IS_DIGIT(*ptr)) (*ptr)++;
    if (parse_delim(ptr, '(') == PARSE_ERR) {
        err_print("Invalid MEM")
        return PARSE_ERR;
    }
    regid_t reg;
    if (parse_reg(ptr, &reg) == PARSE_ERR) return PARSE_ERR;
    *regid = reg;
    if (parse_delim(ptr, ')') == PARSE_ERR) {
        err_print("Invalid MEM")
        return PARSE_ERR;
    }

    /* set 'ptr', 'value' and 'regid' */

    return PARSE_MEM;
}

/*
 * parse_data: parse an expected data token (e.g., '0x100' or 'array')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, data token is a digit,
 *                            and move 'ptr' to the first char after token,
 *                            and store the value of digit to 'value'
 *     PARSE_SYMBOL: success, data token is a symbol,
 *                            and move 'ptr' to the first char after token,
 *                            and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr', 'name' and 'value' are undefined
 */
parse_t parse_data(char **ptr, char **name, long *value)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)

    /* if IS_DIGIT, then parse the digit */
    if (IS_DIGIT(*ptr)) {
        int pos = 0;
        if (**ptr == '-') pos++;
        if ((*ptr)[pos] != '0' && ((*ptr)[pos + 1] != 'x' && (*ptr)[pos + 1] != 'X')) {
            err_print("Invalid DEST")
            return PARSE_ERR;
        }
        return parse_digit(ptr, value);
    }

    /* if IS_LETTER, then parse the symbol */
    if (IS_LETTER(*ptr)) return parse_symbol(ptr, name);

    /* set 'ptr', 'name' and 'value' */
    return PARSE_ERR;
}

/*
 * parse_label: parse an expected label token (e.g., 'Loop:')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *
 * return
 *     PARSE_LABEL: success, move 'ptr' to the first char after token
 *                            and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr' is undefined
 */
parse_t parse_label(char **ptr, char **name)
{
    /* skip the blank and check */
    SKIP_BLANK(*ptr)

    /* allocate name and copy to it */
    int pos = 0;
    while (**ptr != ':') (*name)[pos++] = *((*ptr)++);
    (*name)[pos] = '\0';

    /* set 'ptr' and 'name' */
    (*ptr)++;
    return PARSE_LABEL;
}

/*
 * parse_line: parse a line of y64 code (e.g., 'Loop: mrmovq (%rcx), %rsi')
 * (you could combine above parse_xxx functions to do it)
 * args
 *     line: point to a line_t data with a line of y64 assembly code
 *
 * return
 *     TYPE_XXX: success, fill line_t with assembled y64 code
 *     TYPE_ERR: error, try to print err information
 */
type_t parse_line(line_t *line)
{

/* when finish parse an instruction or lable, we still need to continue check
* e.g.,
*  Loop: mrmovl (%rbp), %rcx
*           call SUM  #invoke SUM function */

    /* skip blank and check IS_END */
    char *ptr = line->y64asm;
    int char_size = 10;
    char *name = (char *)malloc(sizeof(char) * char_size);
    memset(name, 0, sizeof(char) * char_size);
    instr_t *ins = NULL;
    SKIP_BLANK(ptr)
    if (IS_END(ptr)) return TYPE_COMM;

    /* is a comment ? */
    if (IS_COMMENT(ptr)) return TYPE_COMM;

    /* is a label ? */
    int pos = 0;
    while (IS_LETTER(ptr + pos) || IS_DIGIT(ptr + pos)) pos++;
    if (ptr[pos] == ':') {
        if (parse_label(&ptr, &name) == PARSE_ERR) return TYPE_ERR;
        if (add_symbol(name) == -1) return TYPE_ERR;
        ptr++;
    }

    /* is an instruction ? */
    SKIP_BLANK(ptr)
    if (IS_END(ptr) || IS_COMMENT(ptr)) {
        line->type = TYPE_COMM;
        line->y64bin.addr = vmaddr;
        line->y64bin.bytes = 0;
        return line->type;
    }
    if (parse_instr(&ptr, &ins) == PARSE_ERR) return TYPE_ERR;

    /* set type and y64bin */
    line->type = TYPE_INS;
    line->y64bin.addr = vmaddr;
    line->y64bin.bytes = ins->bytes;
    line->y64bin.codes[0] = ins->code;

    /* update vmaddr */
    if (HIGH(ins->code) != I_DIRECTIVE) vmaddr++;

    /* parse the rest of instruction according to the itype */
    int regs = 0xff;
    regid_t regA;
    regid_t regB;
    int64_t val;
    parse_t type;
    char *name_t = (char *)malloc(sizeof(char) * char_size);
    memset(name_t, 0, sizeof(char) * char_size);
    switch (HIGH(ins->code)) {
        case I_RRMOVQ: case I_ALU:
            if (parse_reg(&ptr, &regA) == PARSE_ERR) return TYPE_ERR;
            if (parse_delim(&ptr, ',') == PARSE_ERR) {
                err_print("Invalid ','")
                return TYPE_ERR;
            }
            if (parse_reg(&ptr, &regB) == PARSE_ERR) return TYPE_ERR;
            regs &= (regA << 4);
            regs |= regB;
            line->y64bin.codes[1] = regs;
            vmaddr++;
            break;

        case I_IRMOVQ:
            type = parse_imm(&ptr, &name_t, &val);
            if (type == PARSE_ERR) {
                err_print("Invalid Immediate")
                return TYPE_ERR;
            }
            if (parse_delim(&ptr, ',') == PARSE_ERR) {
                err_print("Invalid ','")
                return TYPE_ERR;
            }
            if (parse_reg(&ptr, &regB) == PARSE_ERR) return TYPE_ERR;
            regs = 0xF0 | regB;
            line->y64bin.codes[1] = regs;
            if (type == PARSE_DIGIT)
                for (int i = 2; i < 10; ++i, val >>= 8)
                    line->y64bin.codes[i] = val & 0xFF;
            else add_reloc(name_t,&(line->y64bin));
            vmaddr += 9;
            break;

        case I_RMMOVQ:
            if (parse_reg(&ptr, &regA) == PARSE_ERR) return TYPE_ERR;
            if (parse_delim(&ptr, ',') == PARSE_ERR) {
                err_print("Invalid ','")
                return TYPE_ERR;
            }
            if (parse_mem(&ptr, &val, &regB) == PARSE_ERR) return TYPE_ERR;
            regs &= (regA << 4);
            regs |= regB;
            line->y64bin.codes[1] = regs;
            for (int i = 2; i < 10; ++i, val >>= 8)
                line->y64bin.codes[i] = val & 0xFF;
            vmaddr += 9;
            break;

        case I_MRMOVQ:
            if (parse_mem(&ptr, &val, &regB) == PARSE_ERR) return TYPE_ERR;
            if (parse_delim(&ptr, ',') == PARSE_ERR) {
                err_print("Invalid ','")
                return TYPE_ERR;
            }
            if (parse_reg(&ptr, &regA) == PARSE_ERR) return TYPE_ERR;
            regs &= (regA << 4);
            regs |= regB;
            line->y64bin.codes[1] = regs;
            for (int i = 2; i < 10; ++i, val >>= 8)
                line->y64bin.codes[i] = val & 0xFF;
            vmaddr += 9;
            break;

        case I_JMP: case I_CALL:
            type = parse_data(&ptr, &name_t, &val);
            if (type == PARSE_ERR) return TYPE_ERR;
            if (type == PARSE_DIGIT)
                for (int i = 1; i < 9; ++i, val >>= 8)
                    line->y64bin.codes[i] = val & 0xFF;
            else add_reloc(name_t,&(line->y64bin));
            vmaddr += 8;
            break;

        case I_PUSHQ: case I_POPQ:
            if (parse_reg(&ptr, &regA) == PARSE_ERR) return TYPE_ERR;
            regs = 0x0F | (regA << 4);
            line->y64bin.codes[1] = regs;
            vmaddr += 1;
            break;

        case I_DIRECTIVE:
            switch (LOW(ins->code)) {
                case D_POS:
                    if (parse_digit(&ptr, &val) == PARSE_ERR) return TYPE_ERR;
                    vmaddr = val;
                    line->y64bin.addr = vmaddr;
                    line->type = TYPE_COMM;
                    break;

                case D_ALIGN:
                    if (parse_digit(&ptr, &val) == PARSE_ERR) return TYPE_ERR;
                    while (vmaddr % val != 0) vmaddr++;
                    line->y64bin.addr = vmaddr;
                    line->type = TYPE_COMM;
                    break;

                case D_DATA:
                    type = parse_data(&ptr, &name_t, &val);
                    if (type == PARSE_ERR) return TYPE_ERR;
                    if (type == PARSE_DIGIT)
                        for (int i = 0; i < ins->bytes; ++i, val >>= 8)
                            line->y64bin.codes[i] = val & 0xFF;
                    else add_reloc(name_t,&(line->y64bin));
                    vmaddr += ins->bytes;
                    break;
            }
            break;
        case I_NOP: case I_HALT: case I_RET:
            break;
    }

    return line->type;
}

/*
 * assemble: assemble an y64 file (e.g., 'asum.ys')
 * args
 *     in: point to input file (an y64 assembly file)
 *
 * return
 *     0: success, assmble the y64 file to a list of line_t
 *     -1: error, try to print err information (e.g., instr type and line number)
 */
int assemble(FILE *in)
{
    static char asm_buf[MAX_INSLEN]; /* the current line of asm code */
    line_t *line;
    int slen;
    char *y64asm;

    /* read y64 code line-by-line, and parse them to generate raw y64 binary code list */
    while (fgets(asm_buf, MAX_INSLEN, in) != NULL) {
        slen  = strlen(asm_buf);
        while ((asm_buf[slen-1] == '\n') || (asm_buf[slen-1] == '\r')) {
            asm_buf[--slen] = '\0'; /* replace terminator */
        }

        /* store y64 assembly code */
        y64asm = (char *)malloc(sizeof(char) * (slen + 1)); // free in finit
        strcpy(y64asm, asm_buf);

        line = (line_t *)malloc(sizeof(line_t)); // free in finit
        memset(line, '\0', sizeof(line_t));

        line->type = TYPE_COMM;
        line->y64asm = y64asm;
        line->next = NULL;

        line_tail->next = line;
        line_tail = line;
        lineno ++;

        if (parse_line(line) == TYPE_ERR) {
            return -1;
        }
    }

    lineno = -1;
    return 0;
}

/*
 * relocate: relocate the raw y64 binary code with symbol address
 *
 * return
 *     0: success
 *     -1: error, try to print err information (e.g., addr and symbol)
 */
int relocate(void)
{
    reloc_t *rtmp = NULL;
    symbol_t *stmp = NULL;
    int64_t addr;
    int start;

    rtmp = reltab->next;
    while (rtmp) {
        /* find symbol */
        stmp = find_symbol(rtmp->name);
        if (stmp == NULL) {
            fprintf(stderr, "[--]: Unknown symbol:'%s'\n", rtmp->name);
            return -1;
        }
        addr = stmp->addr;

        /* relocate y64bin according itype */
        if (HIGH(rtmp->y64bin->codes[0]) == I_IRMOVQ) start = 2;
        else if (HIGH(rtmp->y64bin->codes[0]) == I_DIRECTIVE) start = 0;
        else start = 1;
        for (int i = start; i < start + 8; ++i, addr >>= 8)
            rtmp->y64bin->codes[i] = addr & 0xFF;

        /* next */
        rtmp = rtmp->next;
    }

    return 0;
}

/*
 * binfile: generate the y64 binary file
 * args
 *     out: point to output file (an y64 binary file)
 *
 * return
 *     0: success
 *     -1: error
 */
int binfile(FILE *out)
{
    /* prepare image with y64 binary code */

    /* binary write y64 code to output file (NOTE: see fwrite()) */
    int64_t pos = 0;
    byte_t zero[] = {0};
    line_t *p = line_head->next;
    while (p != NULL) {
        if (p->type == TYPE_COMM) {
            p = p->next;
            continue;
        }

        while (pos++ < p->y64bin.addr)
            fwrite(zero, 1, 1, out);
        fwrite(p->y64bin.codes, 1, p->y64bin.bytes, out);
        pos += p->y64bin.bytes - 1;
        p = p->next;
    }

    return 0;
}


/* whether print the readable output to screen or not ? */
bool_t screen = TRUE;

static void hexstuff(char *dest, int value, int len)
{
    int i;
    for (i = 0; i < len; i++) {
        char c;
        int h = (value >> 4*i) & 0xF;
        c = h < 10 ? h + '0' : h - 10 + 'a';
        dest[len-i-1] = c;
    }
}

void print_line(line_t *line)
{
    char buf[64];

    /* line format: 0xHHH: cccccccccccc | <line> */
    if (line->type == TYPE_INS) {
        bin_t *y64bin = &line->y64bin;
        int i;

        strcpy(buf, "  0x000:                      | ");

        hexstuff(buf+4, y64bin->addr, 3);
        if (y64bin->bytes > 0)
            for (i = 0; i < y64bin->bytes; i++)
                hexstuff(buf+9+2*i, y64bin->codes[i]&0xFF, 2);
    } else {
        strcpy(buf, "                              | ");
    }

    printf("%s%s\n", buf, line->y64asm);
}

/*
 * print_screen: dump readable binary and assembly code to screen
 * (e.g., Figure 4.8 in ICS book)
 */
void print_screen(void)
{
    line_t *tmp = line_head->next;
    while (tmp != NULL) {
        print_line(tmp);
        tmp = tmp->next;
    }
}

/* init and finit */
void init(void)
{
    reltab = (reloc_t *)malloc(sizeof(reloc_t)); // free in finit
    memset(reltab, 0, sizeof(reloc_t));

    symtab = (symbol_t *)malloc(sizeof(symbol_t)); // free in finit
    memset(symtab, 0, sizeof(symbol_t));

    line_head = (line_t *)malloc(sizeof(line_t)); // free in finit
    memset(line_head, 0, sizeof(line_t));
    line_tail = line_head;
    lineno = 0;
}

void finit(void)
{
    reloc_t *rtmp = NULL;
    do {
        rtmp = reltab->next;
        if (reltab->name)
            free(reltab->name);
        free(reltab);
        reltab = rtmp;
    } while (reltab);

    symbol_t *stmp = NULL;
    do {
        stmp = symtab->next;
        if (symtab->name)
            free(symtab->name);
        free(symtab);
        symtab = stmp;
    } while (symtab);

    line_t *ltmp = NULL;
    do {
        ltmp = line_head->next;
        if (line_head->y64asm)
            free(line_head->y64asm);
        free(line_head);
        line_head = ltmp;
    } while (line_head);
}

static void usage(char *pname)
{
    printf("Usage: %s [-v] file.ys\n", pname);
    printf("   -v print the readable output to screen\n");
    exit(0);
}

int main(int argc, char *argv[])
{
    int rootlen;
    char infname[512];
    char outfname[512];
    int nextarg = 1;
    FILE *in = NULL, *out = NULL;

    if (argc < 2)
        usage(argv[0]);

    if (argv[nextarg][0] == '-') {
        char flag = argv[nextarg][1];
        switch (flag) {
            case 'v':
                screen = TRUE;
                nextarg++;
                break;
            default:
                usage(argv[0]);
        }
    }

    /* parse input file name */
    rootlen = strlen(argv[nextarg])-3;
    /* only support the .ys file */
    if (strcmp(argv[nextarg]+rootlen, ".ys"))
        usage(argv[0]);

    if (rootlen > 500) {
        err_print("File name too long");
        exit(1);
    }


    /* init */
    init();


    /* assemble .ys file */
    strncpy(infname, argv[nextarg], rootlen);
    strcpy(infname+rootlen, ".ys");
    in = fopen(infname, "r");
    if (!in) {
        err_print("Can't open input file '%s'", infname);
        exit(1);
    }

    if (assemble(in) < 0) {
        err_print("Assemble y64 code error");
        fclose(in);
        exit(1);
    }
    fclose(in);


    /* relocate binary code */
    if (relocate() < 0) {
        err_print("Relocate binary code error");
        exit(1);
    }


    /* generate .bin file */
    strncpy(outfname, argv[nextarg], rootlen);
    strcpy(outfname+rootlen, ".bin");
    out = fopen(outfname, "wb");
    if (!out) {
        err_print("Can't open output file '%s'", outfname);
        exit(1);
    }

    if (binfile(out) < 0) {
        err_print("Generate binary file error");
        fclose(out);
        exit(1);
    }
    fclose(out);

    /* print to screen (.yo file) */
    if (screen)
        print_screen();

    /* finit */
    finit();
    return 0;
}





