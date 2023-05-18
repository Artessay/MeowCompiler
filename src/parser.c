/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.y"

#include <stdio.h>
#include <string.h>

#include "ParseTree.h"
#include "parser.h"

extern int yylex();

void yyerror(char *str){ fprintf(stderr,"error:%s\n",str); }
        

#line 84 "parser.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ADD = 3,                        /* ADD  */
  YYSYMBOL_SUB = 4,                        /* SUB  */
  YYSYMBOL_MUL = 5,                        /* MUL  */
  YYSYMBOL_DIV = 6,                        /* DIV  */
  YYSYMBOL_MOD = 7,                        /* MOD  */
  YYSYMBOL_SHL = 8,                        /* SHL  */
  YYSYMBOL_SHR = 9,                        /* SHR  */
  YYSYMBOL_BAND = 10,                      /* BAND  */
  YYSYMBOL_BOR = 11,                       /* BOR  */
  YYSYMBOL_BXOR = 12,                      /* BXOR  */
  YYSYMBOL_BNOT = 13,                      /* BNOT  */
  YYSYMBOL_NOT = 14,                       /* NOT  */
  YYSYMBOL_AND = 15,                       /* AND  */
  YYSYMBOL_OR = 16,                        /* OR  */
  YYSYMBOL_DADD = 17,                      /* DADD  */
  YYSYMBOL_DSUB = 18,                      /* DSUB  */
  YYSYMBOL_ASSIGN = 19,                    /* ASSIGN  */
  YYSYMBOL_ADDAS = 20,                     /* ADDAS  */
  YYSYMBOL_SUBAS = 21,                     /* SUBAS  */
  YYSYMBOL_MULAS = 22,                     /* MULAS  */
  YYSYMBOL_DIVAS = 23,                     /* DIVAS  */
  YYSYMBOL_MODAS = 24,                     /* MODAS  */
  YYSYMBOL_SHLAS = 25,                     /* SHLAS  */
  YYSYMBOL_SHRAS = 26,                     /* SHRAS  */
  YYSYMBOL_BANDAS = 27,                    /* BANDAS  */
  YYSYMBOL_BORAS = 28,                     /* BORAS  */
  YYSYMBOL_BXORAS = 29,                    /* BXORAS  */
  YYSYMBOL_NEQ = 30,                       /* NEQ  */
  YYSYMBOL_GT = 31,                        /* GT  */
  YYSYMBOL_LT = 32,                        /* LT  */
  YYSYMBOL_GE = 33,                        /* GE  */
  YYSYMBOL_LE = 34,                        /* LE  */
  YYSYMBOL_EQ = 35,                        /* EQ  */
  YYSYMBOL_LPAREN = 36,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 37,                    /* RPAREN  */
  YYSYMBOL_LBRACK = 38,                    /* LBRACK  */
  YYSYMBOL_RBRACK = 39,                    /* RBRACK  */
  YYSYMBOL_LBRACE = 40,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 41,                    /* RBRACE  */
  YYSYMBOL_COMMA = 42,                     /* COMMA  */
  YYSYMBOL_SEMICOLON = 43,                 /* SEMICOLON  */
  YYSYMBOL_COLON = 44,                     /* COLON  */
  YYSYMBOL_DOT = 45,                       /* DOT  */
  YYSYMBOL_ARW = 46,                       /* ARW  */
  YYSYMBOL_SQUOTE = 47,                    /* SQUOTE  */
  YYSYMBOL_DQUOTE = 48,                    /* DQUOTE  */
  YYSYMBOL_POUND = 49,                     /* POUND  */
  YYSYMBOL_NIL = 50,                       /* NIL  */
  YYSYMBOL_IF = 51,                        /* IF  */
  YYSYMBOL_ELSE = 52,                      /* ELSE  */
  YYSYMBOL_WHILE = 53,                     /* WHILE  */
  YYSYMBOL_FOR = 54,                       /* FOR  */
  YYSYMBOL_BREAK = 55,                     /* BREAK  */
  YYSYMBOL_CONTINUE = 56,                  /* CONTINUE  */
  YYSYMBOL_RETURN = 57,                    /* RETURN  */
  YYSYMBOL_DEFINE = 58,                    /* DEFINE  */
  YYSYMBOL_CONST = 59,                     /* CONST  */
  YYSYMBOL_TYPE_INT = 60,                  /* TYPE_INT  */
  YYSYMBOL_TYPE_DOUBLE = 61,               /* TYPE_DOUBLE  */
  YYSYMBOL_TYPE_CHAR = 62,                 /* TYPE_CHAR  */
  YYSYMBOL_TYPE_VOID = 63,                 /* TYPE_VOID  */
  YYSYMBOL_TYPE_STRING = 64,               /* TYPE_STRING  */
  YYSYMBOL_ID = 65,                        /* ID  */
  YYSYMBOL_INT = 66,                       /* INT  */
  YYSYMBOL_DOUBLE = 67,                    /* DOUBLE  */
  YYSYMBOL_CHAR = 68,                      /* CHAR  */
  YYSYMBOL_STRING = 69,                    /* STRING  */
  YYSYMBOL_YYACCEPT = 70,                  /* $accept  */
  YYSYMBOL_Program = 71,                   /* Program  */
  YYSYMBOL_Top_Clause_List = 72,           /* Top_Clause_List  */
  YYSYMBOL_Top_Clause = 73,                /* Top_Clause  */
  YYSYMBOL_Var_Declaration = 74,           /* Var_Declaration  */
  YYSYMBOL_Fun_Declaration = 75,           /* Fun_Declaration  */
  YYSYMBOL_Params = 76,                    /* Params  */
  YYSYMBOL_Param = 77,                     /* Param  */
  YYSYMBOL_IDENTITY = 78,                  /* IDENTITY  */
  YYSYMBOL_Type_Specifier = 79,            /* Type_Specifier  */
  YYSYMBOL_Basic_Type_Specifier = 80,      /* Basic_Type_Specifier  */
  YYSYMBOL_Block = 81,                     /* Block  */
  YYSYMBOL_Statements = 82,                /* Statements  */
  YYSYMBOL_Statement = 83,                 /* Statement  */
  YYSYMBOL_Exp_Stmt = 84,                  /* Exp_Stmt  */
  YYSYMBOL_Return_Stmt = 85,               /* Return_Stmt  */
  YYSYMBOL_Expression = 86,                /* Expression  */
  YYSYMBOL_Var_Exp = 87,                   /* Var_Exp  */
  YYSYMBOL_Binary_Exp = 88                 /* Binary_Exp  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  13
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   177

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  70
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  19
/* YYNRULES -- Number of rules.  */
#define YYNRULES  54
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  87

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   324


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   140,   140,   143,   144,   147,   148,   152,   156,   157,
     158,   159,   162,   163,   164,   167,   171,   175,   178,   179,
     180,   181,   182,   185,   188,   189,   190,   193,   196,   199,
     203,   222,   223,   227,   238,   240,   242,   243,   244,   245,
     246,   265,   266,   267,   271,   272,   273,   274,   275,   276,
     277,   278,   279,   280,   281
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ADD", "SUB", "MUL",
  "DIV", "MOD", "SHL", "SHR", "BAND", "BOR", "BXOR", "BNOT", "NOT", "AND",
  "OR", "DADD", "DSUB", "ASSIGN", "ADDAS", "SUBAS", "MULAS", "DIVAS",
  "MODAS", "SHLAS", "SHRAS", "BANDAS", "BORAS", "BXORAS", "NEQ", "GT",
  "LT", "GE", "LE", "EQ", "LPAREN", "RPAREN", "LBRACK", "RBRACK", "LBRACE",
  "RBRACE", "COMMA", "SEMICOLON", "COLON", "DOT", "ARW", "SQUOTE",
  "DQUOTE", "POUND", "NIL", "IF", "ELSE", "WHILE", "FOR", "BREAK",
  "CONTINUE", "RETURN", "DEFINE", "CONST", "TYPE_INT", "TYPE_DOUBLE",
  "TYPE_CHAR", "TYPE_VOID", "TYPE_STRING", "ID", "INT", "DOUBLE", "CHAR",
  "STRING", "$accept", "Program", "Top_Clause_List", "Top_Clause",
  "Var_Declaration", "Fun_Declaration", "Params", "Param", "IDENTITY",
  "Type_Specifier", "Basic_Type_Specifier", "Block", "Statements",
  "Statement", "Exp_Stmt", "Return_Stmt", "Expression", "Var_Exp",
  "Binary_Exp", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-40)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      -1,   -40,   -40,   -40,   -40,   -40,    14,   -40,    -1,   -40,
     -40,   -39,   -40,   -40,   -40,   -40,    18,    -1,   -24,    11,
     -39,   -28,    22,    -1,   -40,    42,   -40,   -40,    30,   -40,
      64,    69,   -40,   -40,   -40,   -40,   -40,     1,    49,    42,
     -40,   -40,    -3,    36,   -40,    53,    90,   -40,     3,    64,
     -40,   -40,    64,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,   -40,    64,    64,    65,   -40,   -40,    17,
      59,    59,   -40,   -40,   -40,   143,   148,   148,   148,   148,
     143,   110,    38,    58,   -40,   -40,   -40
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       7,    19,    22,    20,    18,    21,     0,     2,     4,     5,
       6,     0,    17,     1,     3,    16,     0,    14,     0,    13,
       0,     0,     0,    14,    15,     7,     8,     9,     0,    12,
       0,     0,    37,    39,    38,    40,    29,    42,     0,     7,
      27,    28,     0,    34,    35,     0,     0,    31,     0,     0,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    30,     0,     0,     0,    36,    32,     0,
      44,    45,    46,    47,    48,    50,    53,    51,    54,    52,
      49,    33,     0,    11,    41,    43,    10
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -40,   -40,    95,   -40,   -20,   -40,    81,   -40,     5,    -6,
     -40,   -40,    67,   -40,   -40,   -40,    27,   -40,   -40
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     6,     7,     8,     9,    10,    18,    19,    37,    11,
      12,    27,    38,    39,    40,    41,    42,    43,    44
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      52,    53,    54,    55,    56,    36,    52,    53,    54,    55,
      56,    20,    25,    21,    13,    26,    16,    20,    22,    36,
      52,    53,    54,    55,    56,    24,    15,    57,    58,    59,
      60,    61,    62,    57,    58,    59,    60,    61,    62,    49,
      63,    52,    53,    54,    55,    56,    68,    57,    58,    59,
      60,    61,    62,    23,    17,    64,    84,    46,    48,     1,
       2,     3,     4,     5,    54,    55,    56,    28,    57,    58,
      59,    60,    61,    62,    65,    45,    69,    85,    30,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      50,    81,    82,    52,    53,    54,    55,    56,    66,    31,
      30,    86,    83,    14,    29,    30,    51,    15,    32,    33,
      34,    35,    47,    52,    53,    54,    55,    56,     0,     0,
      57,    58,    59,    60,    61,    62,     0,    67,     0,    15,
      32,    33,    34,    35,    15,    32,    33,    34,    35,     0,
      57,    58,    59,    60,    61,    62,    52,    53,    54,    55,
      56,    52,    53,    54,    55,    56,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    58,    59,    60,    61
};

static const yytype_int8 yycheck[] =
{
       3,     4,     5,     6,     7,    25,     3,     4,     5,     6,
       7,    17,    40,    37,     0,    43,    11,    23,    42,    39,
       3,     4,     5,     6,     7,    20,    65,    30,    31,    32,
      33,    34,    35,    30,    31,    32,    33,    34,    35,    38,
      43,     3,     4,     5,     6,     7,    43,    30,    31,    32,
      33,    34,    35,    42,    36,    19,    39,    30,    31,    60,
      61,    62,    63,    64,     5,     6,     7,    45,    30,    31,
      32,    33,    34,    35,    38,    45,    49,    39,    36,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      41,    64,    65,     3,     4,     5,     6,     7,    45,    57,
      36,    43,    37,     8,    23,    36,    39,    65,    66,    67,
      68,    69,    43,     3,     4,     5,     6,     7,    -1,    -1,
      30,    31,    32,    33,    34,    35,    -1,    37,    -1,    65,
      66,    67,    68,    69,    65,    66,    67,    68,    69,    -1,
      30,    31,    32,    33,    34,    35,     3,     4,     5,     6,
       7,     3,     4,     5,     6,     7,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    31,    32,    33,    34
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    60,    61,    62,    63,    64,    71,    72,    73,    74,
      75,    79,    80,     0,    72,    65,    78,    36,    76,    77,
      79,    37,    42,    42,    78,    40,    43,    81,    45,    76,
      36,    57,    66,    67,    68,    69,    74,    78,    82,    83,
      84,    85,    86,    87,    88,    45,    86,    43,    86,    38,
      41,    82,     3,     4,     5,     6,     7,    30,    31,    32,
      33,    34,    35,    43,    19,    38,    45,    37,    43,    86,
      86,    86,    86,    86,    86,    86,    86,    86,    86,    86,
      86,    86,    86,    37,    39,    39,    43
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    70,    71,    72,    72,    73,    73,    74,    75,    75,
      75,    75,    76,    76,    76,    77,    78,    79,    80,    80,
      80,    80,    80,    81,    82,    82,    82,    83,    83,    83,
      84,    85,    85,    86,    86,    86,    86,    86,    86,    86,
      86,    87,    87,    87,    88,    88,    88,    88,    88,    88,
      88,    88,    88,    88,    88
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     0,     6,     6,
      10,     9,     3,     1,     0,     2,     1,     1,     1,     1,
       1,     1,     1,     3,     2,     1,     0,     1,     1,     1,
       2,     2,     3,     3,     1,     1,     3,     1,     1,     1,
       1,     4,     1,     4,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Top_Clause_List  */
#line 140 "parser.y"
                          { A_root = (yyvsp[0].topClauseList); (yyval.topClauseList) = A_root; }
#line 1239 "parser.c"
    break;

  case 3: /* Top_Clause_List: Top_Clause Top_Clause_List  */
#line 143 "parser.y"
                                     { (yyval.topClauseList) = A_TopClauseList((yyvsp[-1].topClause), (yyvsp[0].topClauseList)); }
#line 1245 "parser.c"
    break;

  case 4: /* Top_Clause_List: Top_Clause  */
#line 144 "parser.y"
                     { (yyval.topClauseList) = A_TopClauseList((yyvsp[0].topClause), NULL); }
#line 1251 "parser.c"
    break;

  case 5: /* Top_Clause: Var_Declaration  */
#line 147 "parser.y"
                          { (yyval.topClause) = (yyvsp[0].varDeclare); }
#line 1257 "parser.c"
    break;

  case 6: /* Top_Clause: Fun_Declaration  */
#line 148 "parser.y"
                          { (yyval.topClause) = A_FuncDeclare((yyvsp[0].funcDeclare)); }
#line 1263 "parser.c"
    break;

  case 7: /* Var_Declaration: %empty  */
#line 152 "parser.y"
          { (yyval.varDeclare) = NULL;}
#line 1269 "parser.c"
    break;

  case 8: /* Fun_Declaration: Type_Specifier IDENTITY LPAREN Params RPAREN SEMICOLON  */
#line 156 "parser.y"
                                                                 { (yyval.funcDeclare) = A_FuncDeclaration(7, (yyvsp[-5].varType), (yyvsp[-4].sym), (yyvsp[-2].fieldList), NULL); }
#line 1275 "parser.c"
    break;

  case 9: /* Fun_Declaration: Type_Specifier IDENTITY LPAREN Params RPAREN Block  */
#line 157 "parser.y"
                                                             { (yyval.funcDeclare) = A_FuncDeclaration(7, (yyvsp[-5].varType), (yyvsp[-4].sym), (yyvsp[-2].fieldList), (yyvsp[0].block)); }
#line 1281 "parser.c"
    break;

  case 10: /* Fun_Declaration: Type_Specifier IDENTITY LPAREN Params COMMA DOT DOT DOT RPAREN SEMICOLON  */
#line 158 "parser.y"
                                                                                    { (yyval.funcDeclare) = NULL; printf("TODO\n"); }
#line 1287 "parser.c"
    break;

  case 11: /* Fun_Declaration: Type_Specifier IDENTITY LPAREN Params COMMA DOT DOT DOT RPAREN  */
#line 159 "parser.y"
                                                                         { (yyval.funcDeclare) = NULL; printf("TODO\n"); }
#line 1293 "parser.c"
    break;

  case 12: /* Params: Param COMMA Params  */
#line 162 "parser.y"
                             { (yyval.fieldList) = A_FieldList((yyvsp[-2].field), (yyvsp[0].fieldList)); }
#line 1299 "parser.c"
    break;

  case 13: /* Params: Param  */
#line 163 "parser.y"
                { (yyval.fieldList) = A_FieldList((yyvsp[0].field), NULL); }
#line 1305 "parser.c"
    break;

  case 14: /* Params: %empty  */
#line 164 "parser.y"
                      { (yyval.fieldList) = A_FieldList(NULL, NULL); }
#line 1311 "parser.c"
    break;

  case 15: /* Param: Type_Specifier IDENTITY  */
#line 167 "parser.y"
                                  { (yyval.field) = A_Field(7, (yyvsp[-1].varType), (yyvsp[0].sym)); }
#line 1317 "parser.c"
    break;

  case 16: /* IDENTITY: ID  */
#line 171 "parser.y"
             { (yyval.sym) = S_Symbol((yyvsp[0].sVal)); printf("Identity: %s\n", (yyvsp[0].sVal)); }
#line 1323 "parser.c"
    break;

  case 17: /* Type_Specifier: Basic_Type_Specifier  */
#line 175 "parser.y"
                               { (yyval.varType) = A_VarTypeBasic(7, (yyvsp[0].basicType)); }
#line 1329 "parser.c"
    break;

  case 18: /* Basic_Type_Specifier: TYPE_VOID  */
#line 178 "parser.y"
                      { (yyval.basicType) = A_BasicType(A_voidType); }
#line 1335 "parser.c"
    break;

  case 19: /* Basic_Type_Specifier: TYPE_INT  */
#line 179 "parser.y"
                      { (yyval.basicType) = A_BasicType(A_intType); }
#line 1341 "parser.c"
    break;

  case 20: /* Basic_Type_Specifier: TYPE_CHAR  */
#line 180 "parser.y"
                      { (yyval.basicType) = A_BasicType(A_charType); }
#line 1347 "parser.c"
    break;

  case 21: /* Basic_Type_Specifier: TYPE_STRING  */
#line 181 "parser.y"
                      { (yyval.basicType) = A_BasicType(A_stringType); }
#line 1353 "parser.c"
    break;

  case 22: /* Basic_Type_Specifier: TYPE_DOUBLE  */
#line 182 "parser.y"
                      { (yyval.basicType) = A_BasicType(A_doubleType); }
#line 1359 "parser.c"
    break;

  case 23: /* Block: LBRACE Statements RBRACE  */
#line 185 "parser.y"
                                   { (yyval.block) = (yyvsp[-1].stmtList); }
#line 1365 "parser.c"
    break;

  case 24: /* Statements: Statement Statements  */
#line 188 "parser.y"
                               { (yyval.stmtList) = A_StmtList((yyvsp[-1].stmt), (yyvsp[0].stmtList)); }
#line 1371 "parser.c"
    break;

  case 25: /* Statements: Statement  */
#line 189 "parser.y"
                    { (yyval.stmtList) = A_StmtList((yyvsp[0].stmt), NULL); }
#line 1377 "parser.c"
    break;

  case 26: /* Statements: %empty  */
#line 190 "parser.y"
                       { (yyval.stmtList) = A_StmtList(NULL, NULL); }
#line 1383 "parser.c"
    break;

  case 27: /* Statement: Exp_Stmt  */
#line 193 "parser.y"
                   { (yyval.stmt) = (yyvsp[0].stmt); }
#line 1389 "parser.c"
    break;

  case 28: /* Statement: Return_Stmt  */
#line 196 "parser.y"
                      { (yyval.stmt) = (yyvsp[0].stmt); }
#line 1395 "parser.c"
    break;

  case 29: /* Statement: Var_Declaration  */
#line 199 "parser.y"
                          { (yyval.stmt) = (yyvsp[0].varDeclare); }
#line 1401 "parser.c"
    break;

  case 30: /* Exp_Stmt: Expression SEMICOLON  */
#line 203 "parser.y"
                               { (yyval.stmt) = A_ExprStmt((yyvsp[-1].exp)); }
#line 1407 "parser.c"
    break;

  case 31: /* Return_Stmt: RETURN SEMICOLON  */
#line 222 "parser.y"
                           { (yyval.stmt) = NULL; printf("TODO: return void type\n"); }
#line 1413 "parser.c"
    break;

  case 32: /* Return_Stmt: RETURN Expression SEMICOLON  */
#line 223 "parser.y"
                                      { (yyval.stmt) = A_ReturnStmt((yyvsp[-1].exp)); }
#line 1419 "parser.c"
    break;

  case 33: /* Expression: Var_Exp ASSIGN Expression  */
#line 227 "parser.y"
                                    { (yyval.exp) = new Node(ASSIGN_); (yyval.exp)->children.push_back((yyvsp[-2].exp)); (yyval.exp)->children.push_back((yyvsp[0].exp)); cout << "25-1" << endl; }
#line 1425 "parser.c"
    break;

  case 34: /* Expression: Var_Exp  */
#line 238 "parser.y"
                  { (yyval.exp) = (yyvsp[0].exp); cout << "25-12" << endl; }
#line 1431 "parser.c"
    break;

  case 35: /* Expression: Binary_Exp  */
#line 240 "parser.y"
                     { (yyval.exp) = (yyvsp[0].exp); cout << "25-14" << endl; }
#line 1437 "parser.c"
    break;

  case 36: /* Expression: LPAREN Expression RPAREN  */
#line 242 "parser.y"
                                   { (yyval.exp) = (yyvsp[-1].exp); }
#line 1443 "parser.c"
    break;

  case 37: /* Expression: INT  */
#line 243 "parser.y"
              { (yyval.exp) = A_IntExp(7, (yyvsp[0].iVal)); }
#line 1449 "parser.c"
    break;

  case 38: /* Expression: CHAR  */
#line 244 "parser.y"
               { (yyval.exp) = A_CharExp(7, (yyvsp[0].cVal)); }
#line 1455 "parser.c"
    break;

  case 39: /* Expression: DOUBLE  */
#line 245 "parser.y"
                 { (yyval.exp) = A_DoubleExp(7, (yyvsp[0].dVal)); }
#line 1461 "parser.c"
    break;

  case 40: /* Expression: STRING  */
#line 246 "parser.y"
                 { (yyval.exp) = A_StringExp(7, (yyvsp[0].sVal)); }
#line 1467 "parser.c"
    break;

  case 41: /* Var_Exp: IDENTITY LBRACK Expression RBRACK  */
#line 265 "parser.y"
                                            { (yyval.exp) = A_SubscriptVar(7, A_SimpleVar((yyvsp[-3].sym)), (yyvsp[-1].exp)); }
#line 1473 "parser.c"
    break;

  case 42: /* Var_Exp: IDENTITY  */
#line 266 "parser.y"
                   { (yyval.exp) = A_SimpleVar(7, (yyvsp[0].sym)); }
#line 1479 "parser.c"
    break;

  case 43: /* Var_Exp: Var_Exp LBRACK Expression RBRACK  */
#line 267 "parser.y"
                                           { (yyval.exp) = A_SubscriptVar(7, (yyvsp[-3].exp), (yyvsp[-1].exp)); }
#line 1485 "parser.c"
    break;

  case 44: /* Binary_Exp: Expression ADD Expression  */
#line 271 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_plusOp,   (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1491 "parser.c"
    break;

  case 45: /* Binary_Exp: Expression SUB Expression  */
#line 272 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_minusOp,  (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1497 "parser.c"
    break;

  case 46: /* Binary_Exp: Expression MUL Expression  */
#line 273 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_timesOp,  (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1503 "parser.c"
    break;

  case 47: /* Binary_Exp: Expression DIV Expression  */
#line 274 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_divideOp, (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1509 "parser.c"
    break;

  case 48: /* Binary_Exp: Expression MOD Expression  */
#line 275 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_modOp,    (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1515 "parser.c"
    break;

  case 49: /* Binary_Exp: Expression EQ Expression  */
#line 276 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_eqOp,     (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1521 "parser.c"
    break;

  case 50: /* Binary_Exp: Expression NEQ Expression  */
#line 277 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_neqOp,    (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1527 "parser.c"
    break;

  case 51: /* Binary_Exp: Expression LT Expression  */
#line 278 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_ltOp,     (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1533 "parser.c"
    break;

  case 52: /* Binary_Exp: Expression LE Expression  */
#line 279 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_leOp,     (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1539 "parser.c"
    break;

  case 53: /* Binary_Exp: Expression GT Expression  */
#line 280 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_geOp,     (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1545 "parser.c"
    break;

  case 54: /* Binary_Exp: Expression GE Expression  */
#line 281 "parser.y"
                                    { (yyval.exp) = A_OpExp(7, A_gtOp,     (yyvsp[-2].exp), (yyvsp[0].exp)); }
#line 1551 "parser.c"
    break;


#line 1555 "parser.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 424 "parser.y"


/* int yywrap(){
    return 1;
} */

// int main()
// {
//     yyparse();
//     root->print(0);
// }
