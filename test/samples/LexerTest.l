%{
#include <stdio.h>

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

"+"							            {printf("add ");}
"-"							            {printf("sub ");}
"*"							            {printf("mul ");}
"/"							            {printf("div ");}
"%"                         {printf("mod ");}

"<<"                        {printf("shl ");}
">>"                        {printf("shr ");}

"&"                         {printf("band ");}
"|"                         {printf("bor ");}
"^"                         {printf("bxor ");}
"~"                         {printf("bnot ");}

"!"                         {printf("not ");}
"&&"                        {printf("and ");}
"||"                        {printf("or ");}

"++"                        {printf("dadd ");}
"--"                        {printf("dsub ");}

"="                         {printf("assign ");}
"+="                        {printf("addas ");}
"-="                        {printf("subas ");}
"*="                        {printf("mulas ");}
"/="                        {printf("divas ");}
"%="                        {printf("modas ");}
"<<="                       {printf("shlas ");}
">>="                       {printf("shras ");}
"&="                        {printf("bandas ");}
"|="                        {printf("boras ");}
"^="                        {printf("bxoras ");}

"!="                        {printf("neq ");}
">"                         {printf("gt ");}
"<"                         {printf("lt ");}
">="                        {printf("ge ");}
"<="                        {printf("le ");}
"=="                        {printf("eq ");}

"("                         {printf("lparen ");}
")"                         {printf("rparen ");}
"["                         {printf("lbrack ");}
"]"                         {printf("rbrack ");}
"{"                         {printf("lbrace ");}
"}"                         {printf("rbrace ");}

","                         {printf("comma ");}
";"                         {printf("semicolon ");}
":"                         {printf("colon ");}
"."                         {printf("dot ");}
"->"                        {printf("arw ");}
"\'"                        {printf("squote ");}
"\""                        {printf("dquote ");}
"#"                         {printf("pound ");}

"NULL"                      {printf("nil ");}
"if"                        {printf("if ");}
"else"                      {printf("else ");}
"while"                     {printf("while ");}
"for"                       {printf("for ");}
"break"                     {printf("break ");}
"continue"                  {printf("continue ");}
"return"                    {printf("return ");}
"define"                    {printf("define ");}
"const"                     {printf("const ");}

"int"                       {printf("typeInt ");}
"double"                    {printf("typeDouble ");}
"char"                      {printf("typeChar ");}
"void"                      {printf("typeVoid ");}
"string"                    {printf("typeString ");}

"printf"                    {printf("print ");}
"scanf"                     {printf("scan ");}

[a-zA-Z\_][a-zA-Z0-9\_]*    {printf("id=%s ", yytext);}              //��������������
"-"?[0-9]+                  {printf("int=%d ", atoi(yytext));}               //����ֵ
"-"?[0-9]+\.[0-9]+          {printf("real=%f ", atof(yytext));}             //������ֵ
"\'"[^\\']"\'"              {printf("char=%c ", yytext[1]);}                //������ת���ַ�ֵ
"\'"\\."\'"                 {printf("char=%c ", charConvert(yytext[2]));}     //����ת���ַ�ֵ
"\""(\\.|[^"\\])*"\""	    {                                                       //�ַ���ֵ
                            printf("string=");
                            for (int i = 1; i < yyleng - 1; i++)
                                if (yytext[i] == '\\'){                             //ת���ַ�
                                    i++;
                                    printf("%c", charConvert(yytext[i]));
                                }else{                                              //��ת���ַ�
                                    printf("%c", yytext[i]);
                                }
                            printf(" ");
}



"//"[^\n]*                  {}                                                      //����ע��
[ \t]                       {}                                                      //�ո��뻻��
[\n\r]                      {printf("\n");}
.                           {printf("-------ERROR-------\n");}

%%

int main(int argc, char **argv)
{
  yylex();
  yywrap();
}
int yywrap()
{
	return 1;
}