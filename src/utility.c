#include "utility.h"

#include <stdlib.h>

unsigned int hash(char *s) {
    unsigned int h = 0;
    for (char *p = s; *p; ++p) {
        h = h * HASH_MAGIC + *p;
    }
    return h;
}

void *checked_malloc(int len) {
    void *p = malloc(len);
    assert(p);
    return p;
}

S_symbol S_getVarSymbol(A_var var) {
    if (var == NULL) {
        return NULL;
    }

    switch (var->kind) {
        case A_simpleVar:
            return var->u.simple;
        case A_subscriptVar:
            return S_getVarSymbol(var->u.subscript.var);
        case A_pointVar:
            return S_getVarSymbol(var->u.point);
        default:
            return NULL;
    }
}