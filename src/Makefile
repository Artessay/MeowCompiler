CC 		= g++
LEX 	= flex
YACC 	= bison

all:
	bison --yacc -dv parser.y
	flex Lexer.l
	g++ -o test y.tab.c lex.yy.c

clean:
	-rm -f *.exe
	-rm lex.yy.c 
	-rm y.tab.h 
	-rm y.tab.c 
	-rm y.output