#ifndef _PARSE_TREE_H_
#define _PARSE_TREE_H_

#include "symbol.h"

typedef int A_pos;

typedef enum {
    A_plusOp, A_minusOp, A_timesOp, A_divideOp,
	A_eqOp, A_neqOp, A_ltOp, A_leOp, A_gtOp, A_geOp
} A_oper;

typedef struct A_var_ *A_var;

typedef struct A_exp_ *A_exp;

typedef struct A_stmt_ *A_stmt;

typedef struct A_decList_ *A_decList;

typedef struct A_expList_ *A_expList;

typedef struct A_field_ *A_field;

typedef struct A_fieldList_ *A_fieldList;

typedef struct A_funcDeclare_ *A_funcDeclare;

// typedef struct A_funcDecList_ *A_funcDecList;

typedef struct A_funcImplment_ *A_funcImplment;

// typedef struct A_funcImplmentList_ *A_funcImplmentList;

typedef struct A_define_ *A_define;

typedef struct A_defineList_ *A_defineList;

typedef struct A_topClause_ *A_topClause;

typedef struct A_topClauseList_ *A_topClauseList;

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
};

struct A_exp_ {
    enum {
        A_varExp, A_nilExp, A_intExp, A_stringExp, A_callExp,
        A_opExp, A_recordExp, A_seqExp, A_assignExp, A_ifExp,
        A_whileExp, A_forExp, A_breakExp, A_letExp, A_arrayExp
    } kind;
    A_pos pos;
    union {
        A_var var;
        /* nil; - needs only the pos */
        int intt;
        char *stringg;
        struct {
            S_symbol func;
            A_expList args;
        } call;
        struct {
            A_oper oper;
            A_exp left;
            A_exp right;
        } op;
        // struct {
        //     S_symbol type;
        //     A_efieldList fields;
        // } record;
        A_expList seq;
        struct {
            A_var var;
            A_exp exp;
        } assign;
        struct {
            A_exp test, then, elsee;
        } iff;
        struct {
            A_exp test, body;
        } whilee;
        struct {
            S_symbol var;
            A_exp lo, hi, body;
            // bool escape;
        } forr;
        /* breakk; - need only the pos */
        struct {
            A_decList decs;
            A_exp body;
        } let;
        struct {
            S_symbol type;
            A_exp size, init;
        } array;
    } u;
};

struct A_funcDeclare_ {
    A_pos pos;
    S_symbol name;
    A_fieldList params;
    S_symbol result;
};

struct A_funcImplment_ {
    A_pos pos;
    A_funcDeclare declare;
};

struct A_define_ {
    A_pos pos;
    S_symbol name;
    A_fieldList params;
    S_symbol result;
    A_exp body;
};

struct A_defineList_ {
    A_define value;
    A_define next;
};

struct A_topClause_ {
    enum {
        Preprocess, FunctionDeclare, FunctionDefine, GlobalVarDefine
    } kind;
    A_pos pos;
    union {
        ;
    } u;
};

struct A_topClauseList_ {
    A_topClause value;
    A_topClause next;
};

extern A_topClauseList A_root;

#endif