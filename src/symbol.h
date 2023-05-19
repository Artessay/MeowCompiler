#ifndef _SYMBOL_H_
#define _SYMBOL_H_

#include "table.h"
#include <llvm-c/Types.h>

typedef struct S_symbol_ *S_symbol;

struct S_symbol_ {
    char *name;
    S_symbol next;
};

S_symbol S_Symbol(char *name);

char *S_name(S_symbol symbol);

typedef struct TAB_table_ *S_table;

S_table S_empty();

void S_enter(S_table t, S_symbol sym, LLVMValueRef value);

LLVMValueRef S_look(S_table t, S_symbol sym);

#endif