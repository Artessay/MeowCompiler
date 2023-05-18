/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ADD = 258,                     /* ADD  */
    SUB = 259,                     /* SUB  */
    MUL = 260,                     /* MUL  */
    DIV = 261,                     /* DIV  */
    MOD = 262,                     /* MOD  */
    SHL = 263,                     /* SHL  */
    SHR = 264,                     /* SHR  */
    BAND = 265,                    /* BAND  */
    BOR = 266,                     /* BOR  */
    BXOR = 267,                    /* BXOR  */
    BNOT = 268,                    /* BNOT  */
    NOT = 269,                     /* NOT  */
    AND = 270,                     /* AND  */
    OR = 271,                      /* OR  */
    DADD = 272,                    /* DADD  */
    DSUB = 273,                    /* DSUB  */
    ASSIGN = 274,                  /* ASSIGN  */
    ADDAS = 275,                   /* ADDAS  */
    SUBAS = 276,                   /* SUBAS  */
    MULAS = 277,                   /* MULAS  */
    DIVAS = 278,                   /* DIVAS  */
    MODAS = 279,                   /* MODAS  */
    SHLAS = 280,                   /* SHLAS  */
    SHRAS = 281,                   /* SHRAS  */
    BANDAS = 282,                  /* BANDAS  */
    BORAS = 283,                   /* BORAS  */
    BXORAS = 284,                  /* BXORAS  */
    NEQ = 285,                     /* NEQ  */
    GT = 286,                      /* GT  */
    LT = 287,                      /* LT  */
    GE = 288,                      /* GE  */
    LE = 289,                      /* LE  */
    EQ = 290,                      /* EQ  */
    LPAREN = 291,                  /* LPAREN  */
    RPAREN = 292,                  /* RPAREN  */
    LBRACK = 293,                  /* LBRACK  */
    RBRACK = 294,                  /* RBRACK  */
    LBRACE = 295,                  /* LBRACE  */
    RBRACE = 296,                  /* RBRACE  */
    COMMA = 297,                   /* COMMA  */
    SEMICOLON = 298,               /* SEMICOLON  */
    COLON = 299,                   /* COLON  */
    DOT = 300,                     /* DOT  */
    ARW = 301,                     /* ARW  */
    SQUOTE = 302,                  /* SQUOTE  */
    DQUOTE = 303,                  /* DQUOTE  */
    POUND = 304,                   /* POUND  */
    NIL = 305,                     /* NIL  */
    IF = 306,                      /* IF  */
    ELSE = 307,                    /* ELSE  */
    WHILE = 308,                   /* WHILE  */
    FOR = 309,                     /* FOR  */
    BREAK = 310,                   /* BREAK  */
    CONTINUE = 311,                /* CONTINUE  */
    RETURN = 312,                  /* RETURN  */
    DEFINE = 313,                  /* DEFINE  */
    CONST = 314,                   /* CONST  */
    TYPE_INT = 315,                /* TYPE_INT  */
    TYPE_DOUBLE = 316,             /* TYPE_DOUBLE  */
    TYPE_CHAR = 317,               /* TYPE_CHAR  */
    TYPE_VOID = 318,               /* TYPE_VOID  */
    TYPE_STRING = 319,             /* TYPE_STRING  */
    ID = 320,                      /* ID  */
    INT = 321,                     /* INT  */
    DOUBLE = 322,                  /* DOUBLE  */
    CHAR = 323,                    /* CHAR  */
    STRING = 324                   /* STRING  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ADD 258
#define SUB 259
#define MUL 260
#define DIV 261
#define MOD 262
#define SHL 263
#define SHR 264
#define BAND 265
#define BOR 266
#define BXOR 267
#define BNOT 268
#define NOT 269
#define AND 270
#define OR 271
#define DADD 272
#define DSUB 273
#define ASSIGN 274
#define ADDAS 275
#define SUBAS 276
#define MULAS 277
#define DIVAS 278
#define MODAS 279
#define SHLAS 280
#define SHRAS 281
#define BANDAS 282
#define BORAS 283
#define BXORAS 284
#define NEQ 285
#define GT 286
#define LT 287
#define GE 288
#define LE 289
#define EQ 290
#define LPAREN 291
#define RPAREN 292
#define LBRACK 293
#define RBRACK 294
#define LBRACE 295
#define RBRACE 296
#define COMMA 297
#define SEMICOLON 298
#define COLON 299
#define DOT 300
#define ARW 301
#define SQUOTE 302
#define DQUOTE 303
#define POUND 304
#define NIL 305
#define IF 306
#define ELSE 307
#define WHILE 308
#define FOR 309
#define BREAK 310
#define CONTINUE 311
#define RETURN 312
#define DEFINE 313
#define CONST 314
#define TYPE_INT 315
#define TYPE_DOUBLE 316
#define TYPE_CHAR 317
#define TYPE_VOID 318
#define TYPE_STRING 319
#define ID 320
#define INT 321
#define DOUBLE 322
#define CHAR 323
#define STRING 324

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "parser.y"

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

    struct A_funcImplment_ *block;

    struct A_varType_ *varType;
    struct A_basicType_ *basicType;
    struct A_pointType_ *pointType;
    struct A_arrayType_ *arrayType;

    struct A_field_ *field;
    struct A_fieldList_ *fieldList;
    
    struct A_exp_ *exp;
    struct A_expList_ *expList;
    struct A_stmt_ *stmt;
    struct A_stmtList_ *stmtList;

#line 237 "parser.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_H_INCLUDED  */
