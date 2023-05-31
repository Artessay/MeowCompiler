%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #include "ParseTree.h"
    #include "ErrorMessage.h"

    extern int yylex();

    void yyerror(char *str) { 
        EM_error(EM_tokPos, "%s", str);
        exit(0);
    }
%}

%union {
    int pos;

    int    iVal;
    double dVal;
    char   cVal;
    char * sVal;
    
    struct S_symbol_ *sym;

    struct A_topClauseList_ *topClauseList;
    struct A_topClause_ *topClause;
    
    struct A_funcDeclare_ *funcDeclare;
    struct A_varDeclare_ *varDeclare;
    struct A_varDec_ *varDec;
    struct A_varDecList_ *varDecList;
    
    struct A_var_ *var;
    struct A_varType_ *varType;
    struct A_basicType_ *basicType;
    struct A_pointType_ *pointType;
    struct A_arrayType_ *arrayType;

    struct A_field_ *field;
    struct A_fieldList_ *fieldList;
    struct A_arg_ *arg;
    struct A_argList_ *argList;
    
    struct A_exp_ *exp;
    struct A_expList_ *expList;
    struct A_stmt_ *stmt;
    struct A_stmtList_ *stmtList;
}

//terminals
//binary operator    +   -   *   /   %  <<  >>   &    |   ^   &&  ||  ~    !
%token              ADD SUB MUL DIV MOD SHL SHR BAND BOR BXOR AND OR BNOT NOT
//unary operator     ++   --
/* %token              DADD DSUB */
//assignment operator =     +=    -=    *=    /=    %=    <<=   >>=    &=    |=     ^=
%token              ASSIGN ADDAS SUBAS MULAS DIVAS MODAS SHLAS SHRAS BANDAS BORAS BXORAS
//logic operator    !=  >  <  >= <= ==
%token              NEQ GT LT GE LE EQ
//                     (      )      [     ]      {      }
%token              LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE
//                    ,       ;       .  
%token              COMMA SEMICOLON  DOT
//                   :     ->   \'     \"     #   NULL
%token              COLON ARW SQUOTE DQUOTE POUND NIL
//keyword
%token              RETURN TYPE_INT TYPE_DOUBLE TYPE_CHAR TYPE_VOID TYPE_STRING IF ELSE WHILE FOR BREAK CONTINUE CONST DEFINE
//function
// %token <node>       PRINT SCAN
//ID
%token<sVal>        ID
//value
%token<iVal>        INT
%token<dVal>        DOUBLE 
%token<cVal>        CHAR 
%token<sVal>        STRING

//non-terminals
//Start, Define, Declaration
%type <topClauseList> Program Top_Clause_List

%type <topClause> Top_Clause

%type <funcDeclare> Fun_Declaration

%type <varDeclare> Var_Declaration

%type <varDecList> Var_List

%type <varDec> Var_Init

%type <varType> Type_Specifier

/* %type <basicType>  */

%type <arg> Param

%type <argList> Params

/* %type <block> Block */

%type <var>  L_Value Var_Def;

%type <exp> Expression Binary_Exp Uni_Exp Call_Exp

%type <expList> Expression_List Nonempty_Exp_List

%type <stmt> Statement Exp_Stmt Selection_Stmt Iteration_Stmt Return_Stmt Else_Stmt

%type <stmtList> Block Statements

// terminals

%type <sym> IDENTITY

//priority
%right  ASSIGN ADDAS SUBAS MULAS DIVAS MODAS SHLAS SHRAS BANDAS BORAS BXORAS
%left   OR
%left   AND 
%left   BOR
%left   BXOR
%left   BAND
%left   NEQ EQ
%left   GT LT GE LE
%left   SHL SHR
%left   ADD SUB
%left   MUL DIV MOD
%right  DADD DSUB NOT BNOT
%left   LPAREN RPAREN
%left   LBRACK RBRACK

%%

Program 
        : Top_Clause_List { $$ = $1; A_setParseTreeRoot($$); }
        ;
Top_Clause_List
        : Top_Clause Top_Clause_List { $$ = A_TopClauseList($1, $2); }
        | Top_Clause { $$ = A_TopClauseList($1, NULL); }
        ;
Top_Clause 
        : Var_Declaration SEMICOLON { $$ = A_VarDeclare($1); }
        | Fun_Declaration { $$ = A_FuncDeclare($1); }
        ;

Var_Declaration
        : Type_Specifier Var_List { $$ = A_VarDeclaration(EM_tokPos, $1, $2); }
        ;
Var_List 
        : Var_Init COMMA Var_List { $$ = A_VarDecList($1, $3); }
        | Var_Init { $$ = A_VarDecList($1, NULL); } 
        ;
Var_Init 
        : Var_Def { $$ = A_VarDec(EM_tokPos, $1, NULL); }
        | Var_Def ASSIGN Expression { $$ = A_VarDec(EM_tokPos, $1, $3); }
        ;
Var_Def
        : Var_Def LBRACK Expression RBRACK { $$ = A_SubscriptVar(EM_tokPos, $1, $3); }
        | MUL Var_Def { $$ = A_PointVar(EM_tokPos, $2); }
        | IDENTITY { $$ = A_SimpleVar(EM_tokPos, $1); } 
        ;

Fun_Declaration
        : Type_Specifier IDENTITY LPAREN Params RPAREN SEMICOLON { $$ = A_FuncDeclaration(EM_tokPos, $1, $2, $4, NULL, A_getVarArgFlag()); }
        | Type_Specifier IDENTITY LPAREN Params RPAREN Block { $$ = A_FuncDeclaration(EM_tokPos, $1, $2, $4, $6, A_getVarArgFlag()); }
        | Type_Specifier MUL IDENTITY LPAREN Params RPAREN SEMICOLON { $$ = A_FuncDeclaration(EM_tokPos, A_VarTypePoint(EM_tokPos, $1), $3, $5, NULL, A_getVarArgFlag()); }
        | Type_Specifier MUL IDENTITY LPAREN Params RPAREN Block { $$ = A_FuncDeclaration(EM_tokPos, A_VarTypePoint(EM_tokPos, $1), $3, $5, $7, A_getVarArgFlag()); }
        ;
Params 
        : Param COMMA Params { $$ = A_ArgList($1, $3); }
        | Param { $$ = A_ArgList($1, NULL); }
        | /* empty */ { $$ = A_ArgList(NULL, NULL); }
        ;
Param 
        : Type_Specifier Var_Def { $$ = A_Arg(EM_tokPos, $1, $2); }
        | DOT DOT DOT  { $$ = NULL; A_setVarArgFlag(); }
        ;
IDENTITY
        : ID { 
                $$ = S_Symbol($1);  
                // printf("Identity: %s\n", $1);  
        }
        ;

Type_Specifier 
        : TYPE_VOID   { $$ = A_VarTypeBasic(EM_tokPos, A_voidType); }
        | TYPE_INT    { $$ = A_VarTypeBasic(EM_tokPos, A_intType); }
        | TYPE_CHAR   { $$ = A_VarTypeBasic(EM_tokPos, A_charType); }
        | TYPE_STRING { $$ = A_VarTypeBasic(EM_tokPos, A_stringType); }
        | TYPE_DOUBLE { $$ = A_VarTypeBasic(EM_tokPos, A_doubleType); }
        /* | Type_Specifier MUL { $$ = A_VarTypePoint(EM_tokPos, $1); } */
        ;
Block 
        : LBRACE Statements RBRACE { $$ = $2; /* puts("Block"); */ }
        ;
Statements  
        : Statement Statements { $$ = A_StmtList($1, $2); /* puts("Statement"); */ }
        | /* empty */  { $$ = NULL; /* puts("empty statement"); */ }
        ;
Statement 
        : Exp_Stmt { $$ = $1; }
        | Var_Declaration SEMICOLON { $$ = A_VarDecStmt($1); }
        | Block { $$ = A_CompoundStmt(EM_tokPos, $1); }
        | Selection_Stmt { $$ = $1; }
        | Iteration_Stmt { $$ = $1; }
        | Return_Stmt { $$ = $1; }
        | BREAK SEMICOLON { $$ = A_BreakStmt(EM_tokPos); }
        | CONTINUE SEMICOLON { $$ = A_ContinueStmt(EM_tokPos); }
        | Expression DADD { $$ = NULL; puts("TODO: RUOP"); }
        | Expression DSUB { $$ = NULL; puts("TODO: RUOP"); }
        ;

Exp_Stmt 
        : Expression SEMICOLON { $$ = A_ExprStmt(EM_tokPos, $1); }   
        ;
Selection_Stmt 
        : IF LPAREN Expression RPAREN Statement Else_Stmt { $$ = A_IfStmt(EM_tokPos, $3, $5, $6); }
        ;
Else_Stmt 
        : ELSE Statement { $$ = $2; }
        | /* empty */ { $$ = NULL; }
        ;
Iteration_Stmt 
        : FOR LPAREN Var_Declaration SEMICOLON Expression SEMICOLON Expression RPAREN Statement { $$ = A_ForStmt(EM_tokPos, A_VarDecStmt($3), $5, $7, $9); }
        | FOR LPAREN Expression SEMICOLON Expression SEMICOLON Expression RPAREN Statement { $$ = A_ForStmt(EM_tokPos, A_ExprStmt(EM_tokPos, $3), $5, $7, $9); }
        | WHILE LPAREN Expression RPAREN Statement { $$ = A_WhileStmt(EM_tokPos, $3, $5); }
        ;
Return_Stmt 
        : RETURN SEMICOLON { $$ = A_ReturnStmt(EM_tokPos, NULL); }
        | RETURN Expression SEMICOLON { $$ = A_ReturnStmt(EM_tokPos, $2); }
        ;

Expression 
        : L_Value ASSIGN Expression { $$ = A_AssignExp(EM_tokPos, $1, $3); }
        | L_Value ADDAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_plusOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value SUBAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_minusOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value MULAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_timesOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value DIVAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_divideOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value MODAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_modOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value SHLAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_shlOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value SHRAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_shrOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value BANDAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_bAndOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value BORAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_bOrOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value BXORAS Expression { $$ = A_AssignExp(EM_tokPos, $1, A_OpExp(EM_tokPos, A_bXorOp, A_VarExp(EM_tokPos, $1), $3)); }
        | L_Value { $$ = A_VarExp(EM_tokPos, $1); }
        | Uni_Exp { $$ = $1; }
        | LPAREN Type_Specifier RPAREN Expression { $$ = A_TypeCastExp(EM_tokPos, $2, $4); }
        | LPAREN Type_Specifier MUL RPAREN Expression { $$ = A_TypeCastExp(EM_tokPos, A_VarTypePoint(EM_tokPos, $2), $5); }
        | Call_Exp { $$ = $1; }
        | Binary_Exp { $$ = $1; }
        | LPAREN Expression RPAREN { $$ = $2; }
        | NIL { $$ = A_NilExp(EM_tokPos); }
        | INT { $$ = A_IntExp(EM_tokPos, $1); }
        | CHAR { $$ = A_CharExp(EM_tokPos, $1); }
        | DOUBLE { $$ = A_DoubleExp(EM_tokPos, $1); }
        | STRING { $$ = A_StringExp(EM_tokPos, $1); }
        ;
Expression_List
        : /* empty */ { $$ = NULL; }
        | Nonempty_Exp_List { $$ = $1; }
        ;
Nonempty_Exp_List
        : Expression { $$ = A_ExpList($1, NULL); }
        | Expression COMMA Expression_List { $$ = A_ExpList($1, $3); }
        ;

Uni_Exp 
        : NOT Expression { $$ = NULL; puts("TODO: ! NOT"); }
        | BNOT Expression { $$ = NULL; puts("TODO: ~ BNOT"); }
        | BAND L_Value { $$ = A_AmpersandExp(EM_tokPos, $2); }
        /* | MUL L_Value { $$ = A_StarExp(EM_tokPos, $2); } */
        | DADD L_Value {
                A_exp var = A_VarExp(EM_tokPos, $2);
                A_exp exp = A_OpExp(EM_tokPos, A_plusOp, var, A_IntExp(EM_tokPos, 1));
                $$ = A_AssignExp(EM_tokPos, $2, exp);
        }
        | DSUB L_Value {
                A_exp var = A_VarExp(EM_tokPos, $2);
                A_exp exp = A_OpExp(EM_tokPos, A_minusOp, var, A_IntExp(EM_tokPos, 1));
                $$ = A_AssignExp(EM_tokPos, $2, exp);
        }
        ;

Call_Exp 
        : IDENTITY LPAREN Expression_List RPAREN { $$ = A_CallExp(EM_tokPos, $1, $3); }
        ;

L_Value
        : IDENTITY { $$ = A_SimpleVar(EM_tokPos, $1); }
        | MUL L_Value { $$ = A_DerefVar(EM_tokPos, $2); }
        | L_Value LBRACK Expression RBRACK { $$ = A_SubscriptVar(EM_tokPos, $1, $3); }
        /* | L_Value DOT IDENTITY {} */
        ;
Binary_Exp 
        : Expression ADD  Expression { $$ = A_OpExp(EM_tokPos, A_plusOp,   $1, $3); }
        | Expression SUB  Expression { $$ = A_OpExp(EM_tokPos, A_minusOp,  $1, $3); }
        | Expression MUL  Expression { $$ = A_OpExp(EM_tokPos, A_timesOp,  $1, $3); }
        | Expression DIV  Expression { $$ = A_OpExp(EM_tokPos, A_divideOp, $1, $3); }
        | Expression MOD  Expression { $$ = A_OpExp(EM_tokPos, A_modOp,    $1, $3); }
        | Expression EQ   Expression { $$ = A_OpExp(EM_tokPos, A_eqOp,     $1, $3); }
        | Expression NEQ  Expression { $$ = A_OpExp(EM_tokPos, A_neqOp,    $1, $3); }
        | Expression LT   Expression { $$ = A_OpExp(EM_tokPos, A_ltOp,     $1, $3); }
        | Expression LE   Expression { $$ = A_OpExp(EM_tokPos, A_leOp,     $1, $3); }
        | Expression GT   Expression { $$ = A_OpExp(EM_tokPos, A_gtOp,     $1, $3); }
        | Expression GE   Expression { $$ = A_OpExp(EM_tokPos, A_geOp,     $1, $3); }
        | Expression SHL  Expression { $$ = A_OpExp(EM_tokPos, A_shlOp,    $1, $3); }
        | Expression SHR  Expression { $$ = A_OpExp(EM_tokPos, A_shrOp,    $1, $3); }
        | Expression BAND Expression { $$ = A_OpExp(EM_tokPos, A_bAndOp,   $1, $3); }
        | Expression BOR  Expression { $$ = A_OpExp(EM_tokPos, A_bOrOp,    $1, $3); }
        | Expression BXOR Expression { $$ = A_OpExp(EM_tokPos, A_bXorOp,   $1, $3); }
        /* | Expression BNOT Expression { $$ = A_OpExp(EM_tokPos, A_bNotOp,   $1, $3); } */
        /* | Expression NOT  Expression { $$ = A_OpExp(EM_tokPos, A_notOp,    $1, $3); } */
        | Expression AND  Expression { $$ = A_OpExp(EM_tokPos, A_andOp,    $1, $3); }
        | Expression OR   Expression { $$ = A_OpExp(EM_tokPos, A_orOp,     $1, $3); }
        ;

%%

// int main()
// {
//     yyparse();
//     root->print(0);
// }
