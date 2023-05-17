/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ADD = 258,
     SUB = 259,
     MUL = 260,
     DIV = 261,
     MOD = 262,
     SHL = 263,
     SHR = 264,
     BAND = 265,
     BOR = 266,
     BXOR = 267,
     BNOT = 268,
     NOT = 269,
     AND = 270,
     OR = 271,
     DADD = 272,
     DSUB = 273,
     ASSIGN = 274,
     ADDAS = 275,
     SUBAS = 276,
     MULAS = 277,
     DIVAS = 278,
     MODAS = 279,
     SHLAS = 280,
     SHRAS = 281,
     BANDAS = 282,
     BORAS = 283,
     BXORAS = 284,
     NEQ = 285,
     GT = 286,
     LT = 287,
     GE = 288,
     LE = 289,
     EQ = 290,
     LPAREN = 291,
     RPAREN = 292,
     LBRACK = 293,
     RBRACK = 294,
     LBRACE = 295,
     RBRACE = 296,
     COMMA = 297,
     SEMICOLON = 298,
     COLON = 299,
     DOT = 300,
     ARW = 301,
     SQUOTE = 302,
     DQUOTE = 303,
     POUND = 304,
     NIL = 305,
     IF = 306,
     ELSE = 307,
     WHILE = 308,
     FOR = 309,
     BREAK = 310,
     CONTINUE = 311,
     RETURN = 312,
     DEFINE = 313,
     CONST = 314,
     TYPE_INT = 315,
     TYPE_DOUBLE = 316,
     TYPE_CHAR = 317,
     TYPE_VOID = 318,
     TYPE_STRING = 319,
     ID = 320,
     INT = 321,
     DOUBLE = 322,
     CHAR = 323,
     STRING = 324
   };
#endif
/* Tokens.  */
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



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 12 "parser.y"

    int pos;

    int    iVal;
    double dVal;
    char   cVal;
    char * sVal;
    
    
    S_symbol sym;

    A_topClauseList topClauseList;
    A_topClause topClause;
    
    A_funcDeclare funcDeclare;
    A_varDeclare varDeclare;

    A_funcImplment block;

    A_varType varType;
    A_basicType basicType;
    A_pointType pointType;
    A_arrayType arrayType;

    A_field field;
    A_fieldList fieldList;

    A_stmt stmt;
    A_stmtList stmtList;


/* Line 2058 of yacc.c  */
#line 227 "parser.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_PARSER_H_INCLUDED  */
