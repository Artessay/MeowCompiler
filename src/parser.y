%{
#include <string.h>
#include <stdio.h>
#include <iostream>
#include <vector>
#include "ast.h"
//extern int yylex();
Node* root = new Node(Program_);
void yyerror(char *str){ fprintf(stderr,"error:%s\n",str); }
extern "C"{
    //void yyerror(const char *s);
	extern int yylex(void);
}
        
%}

%union {
    class Node* node;
    //int iVal;
    //double dVal;
    //char cVal;
    //string sVal;
}

//terminals
//binary operator    +   -   *   /   %  <<  >>   &    |   ^    ~    !  &&  ||
%token <node>       ADD SUB MUL DIV MOD SHL SHR BAND BOR BXOR BNOT NOT AND OR
//unary operator     ++   --
%token <node>       DADD DSUB
//assignment operator =     +=    -=    *=    /=    %=    <<=   >>=    &=    |=     ^=
%token <node>       ASSIGN ADDAS SUBAS MULAS DIVAS MODAS SHLAS SHRAS BANDAS BORAS BXORAS
//logic operator    !=  >  <  >= <= ==
%token <node>       NEQ GT LT GE LE EQ
//                     (      )      [     ]      {      }
%token <node>       LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE
//                    ,       ;       :    .   ->   \'     \"     #   NULL
%token <node>       COMMA SEMICOLON COLON DOT ARW SQUOTE DQUOTE POUND NIL
//keyword
%token <node>       IF ELSE WHILE FOR BREAK CONTINUE RETURN DEFINE CONST TYPE_INT TYPE_DOUBLE TYPE_CHAR TYPE_VOID TYPE_STRING
//function
%token <node>       PRINT SCAN
//ID
%token <node>       ID
//value
%token <node>       INT DOUBLE CHAR STRING

//non-terminals
//Start, Define, Declaration
%type <node> Program Define_List Declaration_List Define Declarator Declaration Basic_Type_Specifier
//variable definition
%type <node> Type_Specifier Var_Declaration Var_List Var_Init Var_Def
//function definition
%type <node> Params Param Fun_Prototype Fun_Declaration
//block definition
%type <node> Block Block_Items Block_Item
//statement definition
%type <node> Statement Exp_Stmt Selection_Stmt Iteration_Stmt Return_Stmt ELSEIF_List
//expression definition
%type <node> Expression Uni_Exp LUOP RUOP Var_Exp Call_Exp Arg_List Binary_Exp Expression_List

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

Program : Define_List Declaration_List { $$ = root; $$->children.push_back($1); $$->children.push_back($2); cout << "1-1" << endl; }
        | Declaration_List { $$ = root; $$->children.push_back($1); cout << "1-2" << endl; }
        ;
Define_List : Define_List Define { $1->children.push_back($2); $$ = $1; cout << "2-1" << endl; }
            | Define { $$->children.push_back($1); cout << "2-2" << endl; }
            ;
Define : POUND DEFINE Declarator STRING { $$ = new Node(Define_); $$->children.push_back($3); $$->children.push_back($4); cout << "3-1" << endl; }
       | POUND DEFINE Declarator INT { $$ = new Node(Define_); $$->children.push_back($3); $$->children.push_back($4); cout << "3-2" << endl; }
       ;
Declaration_List : Declaration_List Declaration { $1->children.push_back($2); $$ = $1; cout << "4-1" << endl; }
                 | Declaration { $$->children.push_back($1); cout << "4-2" << endl; }
                 ;
Declaration : Var_Declaration { $$ = $1; cout << "5-1" << endl; }
            | Fun_Declaration { $$ = $1; cout << "5-2" << endl; }
            ;
Basic_Type_Specifier : TYPE_VOID { $$ = new Node(TYPE_VOID_); cout << "6-1" << endl; }
                     | TYPE_INT { $$ = new Node(TYPE_INT_); cout << "6-2" << endl; }
                     | TYPE_CHAR { $$ = new Node(TYPE_CHAR_); cout << "6-3" << endl; }
                     | TYPE_STRING { $$ = new Node(TYPE_STRING_); cout << "6-4" << endl; }
                     | TYPE_DOUBLE { $$ = new Node(TYPE_DOUBLE_); cout << "6-5" << endl; }
                     ;
Declarator : MUL ID { $$ = $2; $$->setPointer(); cout << "7-1" << endl; }
           | BAND ID { $$ = $2; $$->setPointer(); cout << "7-2" << endl; }
           | LPAREN Basic_Type_Specifier RPAREN ID { $$ = new Node(TYPE_CHANGE_); $$->children.push_back($2); $$->children.push_back($4); cout << "7-3" << endl; }
           | ID { $$ = $1; cout << "7-4" << endl; }
           ;

Type_Specifier : Basic_Type_Specifier { $$ = $1; cout << "8-1" << endl; }
               ;
Var_Declaration : Type_Specifier Var_List SEMICOLON { $$->children.push_back($1); $$->children.push_back($2); cout << "9-1" << endl; }
                ;
Var_List : Var_List COMMA Var_Init { $1->children.push_back($3); $$ = $1; cout << "10-1" << endl; }
         | Var_Init { $$->children.push_back($1); cout << "10-2" << endl; }
         ;
Var_Init : Var_Def { $$ = $1; cout << "11-1" << endl; }
         | Var_Def ASSIGN Expression { $$ = $1; $$->children.push_back($3); cout << "11-2" << endl; }
         ;
Var_Def : Var_Def LBRACK INT RBRACK { $1->children.push_back($3); $$ = $1; cout << "12-1" << endl; }
        | Var_Def LBRACK ID RBRACK { $1->children.push_back($3); $$ = $1; cout << "12-2" << endl; }
        | Declarator { $$ = $1; cout << "12-3" << endl; }
        ;

Params : Params COMMA Param { $1->children.push_back($3); $$ = $1; cout << "13-1" << endl; }
       | Param { $$ = new Node(Params_); $$->children.push_back($1); cout << "13-2" << endl; }
       ;
Param : Type_Specifier Declarator { $$ = new Node(Param_); $$->children.push_back($1); $$->children.push_back($2); cout << "14-1" << endl; }
      | Type_Specifier Declarator LBRACK RBRACK{ $$ = new Node(Param_); $$->children.push_back($1); $2->setPointer(); $$->children.push_back($2); cout << "14-2" << endl; }
      ;
Fun_Prototype : Type_Specifier Declarator LPAREN Params RPAREN { $$ = new Node(Func_Prototype_); $$->children.push_back($1); $$->children.push_back($2); $$->children.push_back($4); cout << "15-1" << endl; }
              | Type_Specifier Declarator LPAREN Params COMMA DOT DOT DOT RPAREN { $$ = new Node(Func_Prototype_); $$->children.push_back($1); $$->children.push_back($2); $$->children.push_back($4); cout << "15-2" << endl; }
              | Type_Specifier Declarator LPAREN RPAREN { $$ = new Node(Func_Prototype_); $$->children.push_back($1); $$->children.push_back($2); cout << "15-3" << endl; }
              ;
Fun_Declaration : Fun_Prototype SEMICOLON { $$ = $1; cout << "16-1" << endl; }
                | Fun_Prototype Block { $$ = new Node(Func_Declaration_); $$->children.push_back($1); $$->children.push_back($2); cout << "16-2" << endl; }
                ;

Block : LBRACE Block_Items RBRACE { $$ = $2; cout << "17-1" << endl; }
      ;
Block_Items : Block_Items Block_Item { $1->children.push_back($2); $$=$1; cout << "18-1" << endl; }
            | Block_Item { $$=new Node(Block_Items_); $$->children.push_back($1); cout << "18-2" << endl; }
            ;
Block_Item : Var_Declaration { $$ = $1; cout << "19-1" << endl; }
           | Statement { $$ = $1; cout << "19-2" << endl; }
           ;

Statement : Selection_Stmt { $$ = $1; cout << "20-1" << endl; }
          | Iteration_Stmt { $$ = $1; cout << "20-2" << endl; }
          | Return_Stmt { $$ = $1; cout << "20-3" << endl; }
          | Exp_Stmt { $$ = $1; cout << "20-4" << endl; }
          | BREAK SEMICOLON { $$ = new Node(BREAK_); cout << "20-5" << endl; }
          | CONTINUE SEMICOLON { $$ = new Node(CONTINUE_); cout << "20-6" << endl; }
          ;
Exp_Stmt : Expression SEMICOLON { $$ = $1; cout << "21-1" << endl; }   
         ;
Selection_Stmt : IF LPAREN Expression RPAREN Block { $$ = new Node(If_Stmt_); $$->children.push_back($3); $$->children.push_back($5); cout << "22-1" << endl; }
               | IF LPAREN Expression RPAREN Block ELSE Block { $$ = new Node(IfElse_Stmt_); $$->children.push_back($3); $$->children.push_back($5); $$->children.push_back($7); cout << "22-2" << endl; }
               | IF LPAREN Expression RPAREN Block ELSEIF_List { $$ = new Node(IfElseif_Stmt_); $$->children.push_back($3); $$->children.push_back($5); $$->children.push_back($6); cout << "22-3" << endl; }
               | IF LPAREN Expression RPAREN Block ELSEIF_List ELSE Block { $$ = new Node(IfElseifElse_Stmt_); $$->children.push_back($3); $$->children.push_back($5); $$->children.push_back($6); $$->children.push_back($8); cout << "22-4" << endl; }
               ;
ELSEIF_List : ELSEIF_List ELSE IF LPAREN Expression RPAREN Block { $$ = new Node(ElseIf_); $$->children.push_back($5); $$->children.push_back($7); $$->children.push_back($1); cout << "22.5-1" << endl; }
            | ELSE IF LPAREN Expression RPAREN Block { $$ = new Node(ElseIf_); $$->children.push_back($4); $$->children.push_back($6); cout << "22.5-2" << endl; }
            ;
Iteration_Stmt : FOR LPAREN Expression SEMICOLON Expression SEMICOLON Expression RPAREN Block { $$ = new Node(For_Stmt_); $$->children.push_back($3); $$->children.push_back($5); $$->children.push_back($7); $$->children.push_back($9); cout << "23-1" << endl; }
               | FOR LPAREN Var_Declaration Expression SEMICOLON Expression RPAREN Block { $$ = new Node(For_Stmt_); $$->children.push_back($3); $$->children.push_back($4); $$->children.push_back($6); $$->children.push_back($8); cout << "23-2" << endl; }
               | WHILE LPAREN Expression_List RPAREN Block { $$ = new Node(While_Stmt_); $$->children.push_back($3); $$->children.push_back($5); cout << "23-3" << endl; }
               ;
Expression_List : Expression_List AND Expression { $$ = new Node(Expression_AND_); $$->children.push_back($1); $$->children.push_back($3); cout << "23.5-1" << endl; }
                | Expression_List OR Expression { $$ = new Node(Expression_OR_); $$->children.push_back($1); $$->children.push_back($3); cout << "23.5-2" << endl; }
                | Expression { $$ = $1; cout << "23.5-3" << endl; }
                ;
Return_Stmt : RETURN SEMICOLON { $$ = new Node(Return_Stmt_); $$->setVoid(); cout << "24-1" << endl; }
            | RETURN Expression SEMICOLON { $$ = new Node(Return_Stmt_); $$->children.push_back($2); cout << "24-2" << endl; }
            ;

Expression : Var_Exp ASSIGN Expression { $$ = new Node(ASSIGN_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-1" << endl; }
           | Var_Exp ADDAS Expression { $$ = new Node(ADDAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-2" << endl; }
           | Var_Exp SUBAS Expression { $$ = new Node(SUBAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-3" << endl; }
           | Var_Exp MULAS Expression { $$ = new Node(MULAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-4" << endl; }
           | Var_Exp DIVAS Expression { $$ = new Node(DIVAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-5" << endl; }
           | Var_Exp MODAS Expression { $$ = new Node(MODAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-6" << endl; }
           | Var_Exp SHLAS Expression { $$ = new Node(SHLAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-7" << endl; }
           | Var_Exp SHRAS Expression { $$ = new Node(SHRAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-8" << endl; }
           | Var_Exp BANDAS Expression { $$ = new Node(BANDAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-9" << endl; }
           | Var_Exp BORAS Expression { $$ = new Node(BORAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-10" << endl; }
           | Var_Exp BXORAS Expression { $$ = new Node(BXORAS_); $$->children.push_back($1); $$->children.push_back($3); cout << "25-11" << endl; }
           | Var_Exp { $$ = $1; cout << "25-12" << endl; }
           | Call_Exp { $$ = $1; cout << "25-13" << endl; }
           | Binary_Exp { $$ = $1; cout << "25-14" << endl; }
           | Uni_Exp { $$ = $1; cout << "25-15" << endl; }
           | LPAREN Expression RPAREN { $$ = $1; cout << "25-16" << endl; }
           | INT { $$ = $1; cout << "25-17" << endl; }
           | DOUBLE { $$ = $1; cout << "25-18" << endl; }
           | CHAR { $$ = $1; cout << "25-19" << endl; }
           | STRING { $$ = $1; cout << "25-20" << endl; }
           ;
Uni_Exp : LUOP Declarator { $$ = new Node(LUOP_); $$->children.push_back($1); $$->children.push_back($2); cout << "26-1" << endl; }
        | Declarator RUOP { $$ = new Node(RUOP_); $$->children.push_back($1); $$->children.push_back($2); cout << "26-2" << endl; }
        ;
LUOP : NOT { $$ = new Node(NOT_); cout << "27-1" << endl; }
     | DADD { $$ = new Node(DADD_); cout << "27-2" << endl; }
     | DSUB { $$ = new Node(DSUB_); cout << "27-3" << endl; }
     ;
RUOP : DADD { $$ = new Node(DADD_); cout << "28-1" << endl; }
     | DSUB { $$ = new Node(DSUB_); cout << "28-2" << endl; }
     ;
Var_Exp : Var_Exp LBRACK Expression RBRACK { $$ = new Node(Array_Exp_); $$->children.push_back($1); $$->children.push_back($3); cout << "29-1" << endl; }
        | Declarator { $$ = new Node(Var_Exp_); $$->children.push_back($1); cout << "29-2" << endl; }
        ;
Call_Exp : Declarator LPAREN Arg_List RPAREN { $$=new Node(Call_Exp_); $$->children.push_back($1); $$->children.push_back($3); cout << "30-1" << endl; }
         | Declarator LPAREN RPAREN { $$=new Node(Call_Exp_); $$->children.push_back($1); cout << "30-2" << endl; }
         ;
Arg_List : Arg_List COMMA Expression { $1->children.push_back($3); $$=$1; cout << "31-1" << endl; }
         | Expression { $$=new Node(Arg_); $$->children.push_back($1); cout << "31-2" << endl; }
         ;
Binary_Exp : Expression ADD Expression { $2 = new Node(ADD_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-1" << endl; }
           | Expression SUB Expression { $3 = new Node(SUB_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-2" << endl; }
           | Expression MUL Expression { $3 = new Node(MUL_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-3" << endl; }
           | Expression DIV Expression { $3 = new Node(DIV_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-4" << endl; }
           | Expression MOD Expression { $3 = new Node(MOD_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-4" << endl; }
           | Expression LE Expression { $3 = new Node(LE_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-5" << endl; }
           | Expression LT Expression { $3 = new Node(LT_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-6" << endl; }
           | Expression GT Expression { $3 = new Node(GT_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-7" << endl; }
           | Expression GE Expression { $3 = new Node(GE_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-8" << endl; }
           | Expression EQ Expression { $3 = new Node(EQ_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-9" << endl; }
           | Expression NEQ Expression { $3 = new Node(NEQ_); $2->children.push_back($1); $2->children.push_back($3); $$ = $2; cout << "32-10" << endl; }
           ;

%%

int yywrap(){
    return 1;
}
// int main()
// {
//     yyparse();
// }
