#ifndef _SYMBOL_H_
#define _SYMBOL_H_

typedef struct S_symbol_ *S_symbol;

struct S_symbol_ {
    char *name;
}

S_symbol S_Symbol(char *name);

#endif