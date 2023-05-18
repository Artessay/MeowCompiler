#ifndef _SYMBOL_H_
#define _SYMBOL_H_

typedef struct S_symbol_ *S_symbol;

struct S_symbol_ {
    char *name;
    S_symbol next;
};

S_symbol S_Symbol(char *name);

char *S_name(S_symbol symbol);



#endif