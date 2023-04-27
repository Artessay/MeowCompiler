%option noyywrap
%{
#include <stdio.h>
#include <iostream>
#include <string>
#include "y.tab.h"
#include "ast.h"
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
extern "C"{
    //int yywrap(void);
	int yylex(void);
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
"["                         {/*cout << "[\n";*/ return LBRACK;}
"]"                         {/*cout << "]\n";*/ return RBRACK;}
"{"                         {return LBRACE;}
"}"                         {return RBRACE;}

","                         {return COMMA;}
";"                         {return SEMICOLON;}
":"                         {return COLON;}
"."                         {return DOT;}
"->"                        {return ARW;}
"\'"                        {return SQUOTE;}
"\""                        {return DQUOTE;}
"#"                         {return POUND;}

"NULL"                      {return NIL;}
"if"                        {return IF;}
"else"                      {return ELSE;}
"while"                     {return WHILE;}
"for"                       {return FOR;}
"break"                     {return BREAK;}
"continue"                  {return CONTINUE;}
"return"                    {return RETURN;}
"define"                    {return DEFINE;}
"const"                     {return CONST;}

"int"                       {return TYPE_INT;}
"double"                    {return TYPE_DOUBLE;}
"char"                      {return TYPE_CHAR;}
"void"                      {return TYPE_VOID;}
"string"                    {return TYPE_STRING;}


[a-zA-Z\_][a-zA-Z0-9\_]*    {/*yylval.sVal = string(yytext);*/ yylval.node = new Node(string(yytext), Declarator_); /*cout << "ID\n";*/ return ID;}              //��������������
"-"?[0-9]+                  {/*yylval.iVal = atoi(yytext);*/ yylval.node = new Node(atoi(yytext), INT_); return INT;}               //����ֵ
"-"?[0-9]+\.[0-9]+          {/*yylval.dVal = atof(yytext);*/ yylval.node = new Node(atof(yytext), DOUBLE_); return DOUBLE;}            //������ֵ
"\'"[^\\']"\'"              {/*yylval.cVal = yytext[1];*/ yylval.node = new Node(yytext[1],CHAR_); return CHAR;}                 //������ת���ַ�ֵ
"\'"\\."\'"                 {/*yylval.cVal = charConvert(yytext[2]);*/ yylval.node = new Node(charConvert(yytext[2]),CHAR_); return CHAR;}    //����ת���ַ�ֵ
"\""(\\.|[^"\\])*"\""	    {                                                       //�ַ���ֵ
							/*yylval.sVal = new string();
                            for (int i = 1; i < yyleng - 1; i++)
                                if (yytext[i] == '\\'){                             //ת���ַ�
                                    i++;
                                    yylval.sVal->push_back(charConvert(yytext[i]));
                                }else{                                              //��ת���ַ�
                                    yylval.sVal->push_back(yytext[i]);
                                }*/
                            string sVal;
                            for (int i = 1; i < yyleng - 1; i++)
                                if (yytext[i] == '\\'){                             //ת���ַ�
                                    i++;
                                    sVal.append(1, charConvert(yytext[i]));
                                }else{                                              //��ת���ַ�
                                    sVal.append(1, yytext[i]);
                                }
                            yylval.node = new Node(sVal,STRING_);
                            //cout << "STRING\n";
                            return STRING;
}

"//"[^\n]*                  {}                                                      //����ע��
[ \t\n\r]                   {}                                                      //�ո��뻻��
.                           {}
%%
