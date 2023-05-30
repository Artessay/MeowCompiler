%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #ifdef __cplusplus
    extern "C" {

        #include "parser.hpp"

        int yylex(void);
        int yywrap(void);

    }
    #else

        #include "parser.h"

        int yylex(void);
        int yywrap(void);

    #endif

    

    #include "ErrorMessage.h"
    #include "ParseTree.h"

    // #define BUFFER_SIZE 1024
    
    // char lexer_buffer[BUFFER_SIZE];

    char charConvert(char ch) {
        switch(ch) {
            case 'a': return '\a';
            case 'b': return '\b';
            case 'f': return '\f';
            case 'n': return '\n';
            case 'r': return '\r';
            case 't': return '\t';
            case 'v': return '\v';
            default:
                return ch;
        }
    }

    int charPos=1;

    int yywrap(void) {
        charPos = 1;
        return 1;
    }

    void adjust() {
        EM_setTokenPos(charPos);
        charPos += yyleng;
    }

%}

/* 空白符和注释 */
WhiteSpace    [ \t]*
LineComment   "//"[^\n]*
NewLine       (\n|\r\n)

%%

{LineComment}               { adjust(); /* 忽略, 不做任何操作 */ }
{WhiteSpace}                { adjust(); /* 忽略, 不做任何操作 */ }
{NewLine}                   { adjust(); EM_newline(); /* 忽略, 不做任何操作 */ }

"+"							{ adjust(); return ADD;}
"-"							{ adjust(); return SUB;}
"*"							{ adjust(); return MUL;}
"/"							{ adjust(); return DIV;}
"%"                         { adjust(); return MOD;}

"<<"                        { adjust(); return SHL;}
">>"                        { adjust(); return SHR;}

"&"                         { adjust(); return BAND;}
"|"                         { adjust(); return BOR;}
"^"                         { adjust(); return BXOR;}
"~"                         { adjust(); return BNOT;}

"!"                         { adjust(); return NOT;}
"&&"                        { adjust(); return AND;}
"||"                        { adjust(); return OR;}

"++"                        { adjust(); return DADD;}
"--"                        { adjust(); return DSUB;}

"="                         { adjust(); return ASSIGN;}
"+="                        { adjust(); return ADDAS;}
"-="                        { adjust(); return SUBAS;}
"*="                        { adjust(); return MULAS;}
"/="                        { adjust(); return DIVAS;}
"%="                        { adjust(); return MODAS;}
"<<="                       { adjust(); return SHLAS;}
">>="                       { adjust(); return SHRAS;}
"&="                        { adjust(); return BANDAS;}
"|="                        { adjust(); return BORAS;}
"^="                        { adjust(); return BXORAS;}

"!="                        { adjust(); return NEQ;}
">"                         { adjust(); return GT;}
"<"                         { adjust(); return LT;}
">="                        { adjust(); return GE;}
"<="                        { adjust(); return LE;}
"=="                        { adjust(); return EQ;}

"("                         { adjust(); return LPAREN;}
")"                         { adjust(); return RPAREN;}
"["                         { adjust(); return LBRACK;}
"]"                         { adjust(); return RBRACK;}
"{"                         { adjust(); return LBRACE;}
"}"                         { adjust(); return RBRACE;}

","                         { adjust(); return COMMA;}
";"                         { adjust(); return SEMICOLON;}
":"                         { adjust(); return COLON;}
"."                         { adjust(); return DOT;}
"->"                        { adjust(); return ARW;}
"\'"                        { adjust(); return SQUOTE;}
"\""                        { adjust(); return DQUOTE;}
"#"                         { adjust(); return POUND;}

"NULL"                      { adjust(); return NIL;}
"if"                        { adjust(); return IF;}
"else"                      { adjust(); return ELSE;}
"while"                     { adjust(); return WHILE;}
"for"                       { adjust(); return FOR;}
"break"                     { adjust(); return BREAK;}
"continue"                  { adjust(); return CONTINUE;}
"return"                    { adjust(); return RETURN;}
"define"                    { adjust(); return DEFINE;}
"const"                     { adjust(); return CONST;}

"int"                       { adjust(); return TYPE_INT;}
"double"                    { adjust(); return TYPE_DOUBLE;}
"char"                      { adjust(); return TYPE_CHAR;}
"void"                      { adjust(); return TYPE_VOID;}
"string"                    { adjust(); return TYPE_STRING;}


[a-zA-Z\_][a-zA-Z0-9\_]*    { adjust(); yylval.sVal = yytext; return ID; }
"-"?[0-9]+                  { adjust(); yylval.iVal = atoi(yytext); return INT; } 
"-"?[0-9]+\.[0-9]+          { adjust(); yylval.dVal = atof(yytext); return DOUBLE; }
"\'"[^\\']"\'"              { adjust(); yylval.cVal = yytext[1]; return CHAR; }
"\'"\\."\'"                 { adjust(); yylval.cVal = charConvert(yytext[2]); return CHAR; }
"\""(\\.|[^"\\])*"\""	    { adjust();
                                yylval.sVal = malloc(yyleng);

                                int index = 0;
                                for (int i = 1; i < yyleng - 1; i++) {
                                    if (yytext[i] == '\\') {
                                        i++;
                                        yylval.sVal[index++] = charConvert(yytext[i]);
                                    } else {
                                        yylval.sVal[index++] = yytext[i];
                                    }
                                }
                                yylval.sVal[index] = 0;
                                
                                return STRING;
                            }

.                           { adjust(); EM_error(EM_tokPos, "illegal token"); }
%%
