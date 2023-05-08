#ifndef _ABSTRACT_SYNTAX_H_
#define _ABSTRACT_SYNTAX_H_

#include "symbol.h"

typedef int A_pos;

typedef enum {
    A_plusOp, A_minusOp, A_timesOp, A_divideOp,
	A_eqOp, A_neqOp, A_ltOp, A_leOp, A_gtOp, A_geOp
} A_oper;

typedef struct A_var_ *A_var;
struct A_var_ {
    enum {
        A_simpleVar, A_fieldVar, A_subscriptVar
    } kind;
    A_pos pos;
    union {
        S_symbol simple;
        struct {
            A_var var;
            S_symbol sym;
        } field;
        struct {
            A_var var;
            A_exp exp;
        } subscript;
    } u;
}

#endif