#include <stdio.h>
#include <stdlib.h>

struct A_basicType_ {
    enum A_BasicType_ {
        A_intType, A_floatType, A_charType, A_boolType, A_stringType
    } kind;
};

struct A_basicType_ *A_BasicType(enum A_BasicType_ type) {
    printf("%d\n", type);
    struct A_basicType_ *p = malloc(sizeof(*p));
    p->kind = type;
    return p;
}

int main() {
    struct A_basicType_ *t;
    t = A_BasicType(A_intType);
    printf("%d\n", t->kind);
    t = A_BasicType(A_floatType);
    printf("%d\n", t->kind);
    return 0;
}