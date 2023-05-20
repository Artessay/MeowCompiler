%{
#include <stdio.h>
#include <string.h>

#include "ParseTree.h"
// #include "parser.h"

extern int yylex();

void yyerror(char *str){ fprintf(stderr,"error: %s\n",str); }
        
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

%type <varType> Type_Specifier Basic_Type_Specifier

/* %type <basicType>  */

%type <arg> Param

%type <argList> Params

/* %type <block> Block */

%type <var>  L_Value Var_Def;

%type <exp> Expression Binary_Exp Call_Exp

%type <expList> Expression_List Nonempty_Exp_List

%type <stmt> Statement Exp_Stmt Selection_Stmt Iteration_Stmt Return_Stmt

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
        : Type_Specifier Var_List { $$ = A_VarDeclaration(7, $1, $2); }
        ;
Var_List 
        : Var_Init COMMA Var_List { $$ = A_VarDecList($1, $3); }
        | Var_Init { $$ = A_VarDecList($1, NULL); } 
        ;
Var_Init 
        : Var_Def { $$ = A_VarDec(7, $1, NULL); }
        | Var_Def ASSIGN Expression { $$ = A_VarDec(7, $1, $3); }
        ;
Var_Def 
        : Var_Def LBRACK Expression RBRACK { $$ = A_SubscriptVar(7, $1, $3); }
        | MUL Var_Def { $$ = A_PointVar(7, $2); }
        | IDENTITY { $$ = A_SimpleVar(7, $1); } 
        ;

Fun_Declaration
        : Type_Specifier IDENTITY LPAREN Params RPAREN SEMICOLON { $$ = A_FuncDeclaration(7, $1, $2, $4, NULL, A_getVarArgFlag()); }
        | Type_Specifier IDENTITY LPAREN Params RPAREN Block { $$ = A_FuncDeclaration(7, $1, $2, $4, $6, A_getVarArgFlag()); }
        ;
Params 
        : Param COMMA Params { $$ = A_ArgList($1, $3); }
        | Param { $$ = A_ArgList($1, NULL); }
        | /* empty */ { $$ = A_ArgList(NULL, NULL); }
        ;
Param 
        : Type_Specifier Var_Def { $$ = A_Arg(7, $1, $2); }
        | DOT DOT DOT  { $$ = NULL; A_setVarArgFlag(); }
        ;
IDENTITY
        : ID { $$ = S_Symbol($1); printf("Identity: %s\n", $1); }
        ;

Type_Specifier 
        : Basic_Type_Specifier { $$ = $1; }
        ;
Basic_Type_Specifier 
        : TYPE_VOID   { $$ = A_VarTypeBasic(7, A_voidType); }
        | TYPE_INT    { $$ = A_VarTypeBasic(7, A_intType); }
        | TYPE_CHAR   { $$ = A_VarTypeBasic(7, A_charType); }
        | TYPE_STRING { $$ = A_VarTypeBasic(7, A_stringType); }
        | TYPE_DOUBLE { $$ = A_VarTypeBasic(7, A_doubleType); }
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
        | Block { $$ = A_CompoundStmt(7, $1); }
        | Selection_Stmt { $$ = $1; }
        | Iteration_Stmt { $$ = $1; }
        | Return_Stmt { $$ = $1; }
        | BREAK SEMICOLON { $$ = A_BreakStmt(7); }
        | CONTINUE SEMICOLON { $$ = A_ContinueStmt(7); }
        ;

Exp_Stmt 
        : Expression SEMICOLON { $$ = A_ExprStmt(7, $1); }   
        ;
Selection_Stmt 
        : IF LPAREN Expression RPAREN Statement ELSE Statement { $$ = A_IfStmt(7, $3, $5, $7); } 
        | IF LPAREN Expression RPAREN Statement { $$ = A_IfStmt(7, $3, $5, NULL); }
        ;
Iteration_Stmt 
        : FOR LPAREN Var_Declaration SEMICOLON Expression SEMICOLON Expression RPAREN Statement { $$ = A_ForStmt(7, $3, $5, $7, $9); }
        | FOR LPAREN Expression SEMICOLON Expression SEMICOLON Expression RPAREN Statement { $$ = A_ForStmt(7, A_ExprStmt(7, $3), $5, $7, $9); }
        | WHILE LPAREN Expression RPAREN Statement { $$ = A_WhileStmt(7, $3, $5); }
        ;
Return_Stmt 
        : RETURN SEMICOLON { $$ = NULL; printf("TODO: return void type\n"); }
        | RETURN Expression SEMICOLON { $$ = A_ReturnStmt(7, $2); }
        ;

Expression 
        : L_Value ASSIGN Expression { $$ = A_AssignExp(7, $1, $3); }
        /* | L_Value ADDAS Expression { $$ = new Node(ADDAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-2" << endl; }
        | L_Value SUBAS Expression { $$ = new Node(SUBAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-3" << endl; }
        | L_Value MULAS Expression { $$ = new Node(MULAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-4" << endl; }
        | L_Value DIVAS Expression { $$ = new Node(DIVAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-5" << endl; }
        | L_Value MODAS Expression { $$ = new Node(MODAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-6" << endl; }
        | L_Value SHLAS Expression { $$ = new Node(SHLAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-7" << endl; }
        | L_Value SHRAS Expression { $$ = new Node(SHRAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-8" << endl; }
        | L_Value BANDAS Expression { $$ = new Node(BANDAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-9" << endl; }
        | L_Value BORAS Expression { $$ = new Node(BORAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-10" << endl; }
        | L_Value BXORAS Expression { $$ = new Node(BXORAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-11" << endl; } */
        | L_Value { $$ = A_VarExp(7, $1); }
        | Call_Exp { $$ = $1; }
        | Binary_Exp { $$ = $1; }
        /* | Uni_Exp { $$ = $1; cout << "25-15" << endl; } */
        | LPAREN Expression RPAREN { $$ = $2; }
        | INT { $$ = A_IntExp(7, $1); }
        | CHAR { $$ = A_CharExp(7, $1); }
        | DOUBLE { $$ = A_DoubleExp(7, $1); }
        | STRING { $$ = A_StringExp(7, $1); }
        ;
Expression_List
        : /* empty */ { $$ = NULL; }
        | Nonempty_Exp_List { $$ = $1; }
        ;
Nonempty_Exp_List
        : Expression { $$ = A_ExpList($1, NULL); }
        | Expression COMMA Expression_List { $$ = A_ExpList($1, $3); }
        ;
/* Uni_Exp : LUOP Declarator { $$ = new Node(LUOP_); $$->children.push_back($1); $$->children.push_back($2); cout << "26-1" << endl; }
        | Declarator RUOP { $$ = new Node(RUOP_); $$->children.push_back($1); $$->children.push_back($2); cout << "26-2" << endl; }
        ;
LUOP : NOT { $$ = new Node(NOT_); cout << "27-1" << endl; }
     | DADD { $$ = new Node(DADD_); cout << "27-2" << endl; }
     | DSUB { $$ = new Node(DSUB_); cout << "27-3" << endl; }
     ;
RUOP : DADD { $$ = new Node(DADD_); cout << "28-1" << endl; }
     | DSUB { $$ = new Node(DSUB_); cout << "28-2" << endl; }
     ; */

Call_Exp 
        : IDENTITY LPAREN Expression_List RPAREN { $$ = A_CallExp(7, $1, $3); }
        ;

L_Value
        : IDENTITY { $$ = A_SimpleVar(7, $1); }
        | L_Value LBRACK Expression RBRACK { $$ = A_SubscriptVar(7, $1, $3); }
        /* | L_Value DOT IDENTITY {} */
        ;
Binary_Exp 
        : Expression ADD  Expression { $$ = A_OpExp(7, A_plusOp,   $1, $3); }
        | Expression SUB  Expression { $$ = A_OpExp(7, A_minusOp,  $1, $3); }
        | Expression MUL  Expression { $$ = A_OpExp(7, A_timesOp,  $1, $3); }
        | Expression DIV  Expression { $$ = A_OpExp(7, A_divideOp, $1, $3); }
        | Expression MOD  Expression { $$ = A_OpExp(7, A_modOp,    $1, $3); }
        | Expression EQ   Expression { $$ = A_OpExp(7, A_eqOp,     $1, $3); }
        | Expression NEQ  Expression { $$ = A_OpExp(7, A_neqOp,    $1, $3); }
        | Expression LT   Expression { $$ = A_OpExp(7, A_ltOp,     $1, $3); }
        | Expression LE   Expression { $$ = A_OpExp(7, A_leOp,     $1, $3); }
        | Expression GT   Expression { $$ = A_OpExp(7, A_geOp,     $1, $3); }
        | Expression GE   Expression { $$ = A_OpExp(7, A_gtOp,     $1, $3); }
        | Expression SHL  Expression { $$ = A_OpExp(7, A_shlOp,    $1, $3); }
        | Expression SHR  Expression { $$ = A_OpExp(7, A_shrOp,    $1, $3); }
        | Expression BAND Expression { $$ = A_OpExp(7, A_bAndOp,   $1, $3); }
        | Expression BOR  Expression { $$ = A_OpExp(7, A_bOrOp,    $1, $3); }
        | Expression BXOR Expression { $$ = A_OpExp(7, A_bXorOp,   $1, $3); }
        /* | Expression BNOT Expression { $$ = A_OpExp(7, A_bNotOp,   $1, $3); } */
        /* | Expression NOT  Expression { $$ = A_OpExp(7, A_notOp,    $1, $3); } */
        | Expression AND  Expression { $$ = A_OpExp(7, A_andOp,    $1, $3); }
        | Expression OR   Expression { $$ = A_OpExp(7, A_orOp,     $1, $3); }
        ;
/* 


Declarator : MUL ID { $$ = $2; $$->setPointer(); cout << "7-1" << endl; }
           | BAND ID { $$ = $2; $$->setPointer(); cout << "7-2" << endl; }
           | LPAREN Basic_Type_Specifier RPAREN ID { $$ = new Node(TYPE_CHANGE_); $$->children.push_back($2); $$->children.push_back($4); cout << "7-3" << endl; }
           | ID { $$ = $1; cout << "7-4" << endl; }
           ;
*/

%%

// int main()
// {
//     yyparse();
//     root->print(0);
// }
