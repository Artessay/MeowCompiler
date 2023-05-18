#ifndef _PARSE_TREE_H_
#define _PARSE_TREE_H_

#include "symbol.h"

typedef int A_pos;

typedef enum {
    A_plusOp, A_minusOp, A_timesOp, A_divideOp, A_modOp,
	A_eqOp, A_neqOp, A_ltOp, A_leOp, A_gtOp, A_geOp
} A_oper;

typedef struct A_topClause_ *A_topClause;

typedef struct A_topClauseList_ *A_topClauseList;

typedef struct A_declaration_ *A_declaration;

typedef struct A_declarationList_ *A_declarationList;

    typedef struct A_funcDeclare_ *A_funcDeclare;

    typedef struct A_varDeclare_ *A_varDeclare;

typedef struct A_var_ *A_var;

    typedef struct A_varType_ *A_varType;

    typedef struct A_basicType_ *A_basicType;

    typedef struct A_pointType_ *A_pointType;

    typedef struct A_arrayType_ *A_arrayType;

typedef struct A_exp_ *A_exp;

typedef struct A_expList_ *A_expList;

typedef struct A_stmt_ *A_stmt;

typedef struct A_stmtList_ *A_stmtList;

typedef struct A_field_ *A_field;

typedef struct A_fieldList_ *A_fieldList;

typedef struct A_funcImplment_ *A_funcImplment;

typedef struct A_define_ *A_define;

typedef struct A_defineList_ *A_defineList;

struct A_topClauseList_ {
    A_topClause value;
    A_topClauseList next;
};


struct A_topClause_ {
    enum {
        A_Preprocess, A_FunctionDeclare, A_GlobalVarDefine
    } kind;
    A_pos pos;
    union {
        A_funcDeclare function;
        A_varDeclare globalVar;
    } u;
};

struct A_funcDeclare_ {
    A_pos pos;

    A_varType returnType;
    S_symbol name;
    A_fieldList params;
    A_funcImplment body;

    char escape;
};

struct A_varDeclare_ {
    A_pos pos;
    S_symbol name;
    S_symbol type;
    A_exp init;
};

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

struct A_varType_ {
    enum {
        A_basic, A_point, A_array
    } kind;
    A_pos pos;
    union {
        A_basicType basic;
        A_pointType point;
        A_arrayType array;
    } u;
};

enum A_BasicType_ {
    A_intType, A_doubleType, A_charType, A_stringType, A_voidType
};

struct A_basicType_ {
    enum A_BasicType_ kind;
    A_pos pos;
};

struct A_field_ {
	A_pos pos;

    A_varType typ;
	S_symbol name;
	// bool escape;
};

struct A_fieldList_ {
	A_field value;
	A_fieldList next;
};

struct A_stmt_ {
    enum {
        A_expStmt, A_compoundStmt, A_ifStmt, A_whileStmt, A_forStmt, A_breakStmt, A_continueStmt, A_returnStmt
    } kind;
    A_pos pos;
    union {
        A_exp exp;
        struct {
            A_stmtList stmts;
        } compound;
        struct {
            A_exp test;
            A_stmt then;
            A_stmt elsee;
        } iff;
        struct {
            A_exp test;
            A_stmt body;
        } whilee;
        struct {
            A_exp test;
            A_stmt body;
        } forr;
        /* breakk; - need only the pos */
        /* continuee; - need only the pos */
        struct {
            A_exp exp;
        } returnn;
    } u;
};

struct A_stmtList_ {
    A_stmt value;
    A_stmtList next;
};

// struct A_declaration_ {
//     enum {
        
//     } kind;
//     A_pos pos;
//     union {
        
        
//     } u;
// };

struct A_exp_ {
    enum {
        A_varExp, 
        A_nilExp, A_intExp, A_charExp, A_doubleExp, A_stringExp, 
        A_callExp,
        A_opExp, 
        A_recordExp, A_seqExp, A_assignExp, A_ifExp,
        A_whileExp, A_forExp, A_breakExp, A_letExp, A_arrayExp
    } kind;
    A_pos pos;
    union {
        A_var var;
        
        /* nil; - needs only the pos */
        int intt;
        char charr;
        double doublee;
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
            S_symbol type;
            A_exp size, init;
        } array;
    } u;
};

// struct A_define_ {
//     A_pos pos;
//     S_symbol name;
//     A_fieldList params;
//     S_symbol result;
//     A_exp body;
// };

// struct A_defineList_ {
//     A_define value;
//     A_define next;
// };

A_topClauseList A_TopClauseList(A_topClause value, A_topClauseList next);

A_topClause A_FuncDeclare(A_funcDeclare function);

// stmt

A_stmtList A_StmtList(A_stmt value, A_stmtList next);

A_stmt A_ExprStmt(A_pos pos, A_exp exp);

A_stmt A_ReturnStmt(A_pos pos, A_exp exp);

// exp

A_exp A_AssignExp(A_pos pos, A_var var, A_exp exp);

A_exp A_NilExp(A_pos pos);

A_exp A_IntExp(A_pos pos, int i);

A_exp A_CharExp(A_pos pos, char c);

A_exp A_DoubleExp(A_pos pos, double d);

A_exp A_StringExp(A_pos pos, char *s);

A_exp A_CallExp(A_pos pos, S_symbol func, A_expList args);

A_exp A_OpExp(A_pos pos, A_oper oper, A_exp left, A_exp right);

// var

A_varType A_VarTypeBasic(A_pos pos, A_basicType type);

A_basicType A_BasicType(enum A_BasicType_ type);

A_field A_Field(A_pos pos, A_varType typ, S_symbol name);

A_fieldList A_FieldList(A_field value, A_fieldList next);

A_var A_SimpleVar(A_pos pos, S_symbol sym);

A_var A_FieldVar(A_pos pos, A_var var, S_symbol sym);

A_var A_SubscriptVar(A_pos pos, A_var var, A_exp exp);

extern A_topClauseList A_root;

#endif