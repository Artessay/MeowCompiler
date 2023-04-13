%{
#include <stdio.h>
#include <iostream>
#include <string>
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
%}

%%

"+"							{return ADD;}
"-"							{return SUB;}
"*"							{return MUL;}
"/"							{return DIV;}
"%"                         {return MOD;}

"<<"                        {return SHL;}
">>"                        {return SHR;}

"&"                         {return BAND;}
"|"                         {return BOR;}
"^"                         {return BXOR;}
"~"                         {return BNOT;}

"!"                         {return NOT;}
"&&"                        {return AND;}
"||"                        {return OR;}

"++"                        {return DADD;}
"--"                        {return DSUB;}

"="                         {return ASSIGN;}
"+="                        {return ADDAS;}
"-="                        {return SUBAS;}
"*="                        {return MULAS;}
"/="                        {return DIVAS;}
"%="                        {return MODAS;}
"<<="                       {return SHLAS;}
">>="                       {return SHRAS;}
"&="                        {return BANDAS;}
"|="                        {return BORAS;}
"^="                        {return BXORAS;}

"!="                        {return NEQ;}
">"                         {return GT;}
"<"                         {return LT;}
">="                        {return GE;}
"<="                        {return LE;}
"=="                        {return EQ;}

"("                         {return LPAREN;}
")"                         {return RPAREN;}
"["                         {return LBRACK;}
"]"                         {return RBRACK;}
"{"                         {return LBRACE;}
"}"                         {return RBRACE;}

","                         {return COMMA;}
";"                         {return SEMICOLON;}
":"                         {return COLON;}
"."                         {return DOT;}
"->"                        {return ARW;}
"\'"                        {return SQUOTE;}
"\""                        {return DQUOTE;}


"NULL"                      {return NIL;}
"if"                        {return IF;}
"else"                      {return ELSE;}
"while"                     {return WHILE;}
"for"                       {return FOR;}
"break"                     {return BREAK;}
"continue"                  {return CONTINUE;}
"return"                    {return RETURN;}

"int"                       {return TYPE_INT;}
"float"                     {return TYPE_FLOAT;}
"char"                      {return TYPE_CHAR;}
"void"                      {return TYPE_VOID;}
"string"                    {return TYPE_STRING;}

"printf"                    {return PRINT}
"scanf"                     {return SCAN}

[a-zA-Z\_][a-zA-Z0-9\_]*    {yylval.sVal = string(yytext); return ID;}              //变量名及函数名
[0-9]+                      {yylval.iVal = atoi(yytext); return INT;}               //整数值
[0-9]+\.[0-9]+              {yylval.fVal = atof(yytext); return FLOAT;}             //浮点数值
"\'"[^\\']"\'"              {yylval.cVal = yytext[1]; return CHAR;}                 //单个非转义字符值
"\'"\\."\'"                 {yylval.cVal = charConvert(yytext[2]); return CHAR;}    //单个转义字符值
"\""(\\.|[^"\\])*"\""	    {                                                       //字符串值
							yylval.sVal = new string("");
                            for (int i = 1; i < yyleng - 1; i++)
                                if (yytext[i] == '\\'){                             //转义字符
                                    i++;
                                    yylval.sVal->push_back(charConvert(yytext[i]));
                                }else{                                              //非转义字符
                                    yylval.sVal->push_back(yytext[i]);
                                }
                            return STRING;
}

	
[ \t\n\r]                   {}                                                       //空格与换行
.                           {}
%%
