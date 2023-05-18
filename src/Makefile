# CC 		= gcc
CC 		= g++
LEX 	= flex
YACC 	= bison

SRC		= main.c \
		  ErrorMessage.c ParseTree.c symbol.c table.c utility.c

LEXER_CPP = lexer.cpp
PARSER_CPP = parser.cpp
PARSER_HPP = parser.hpp

TARGET = test.exe
TEST_FILE = test.c
TEST_IR = $(TEST_FILE:.c=.ll)
TEST_AS = $(TEST_FILE:.c=.s)

all:
	$(YACC) --yacc -dv -o $(PARSER_CPP) parser.y
	$(LEX) -o $(LEXER_CPP) lexer.l
	$(CC) -o $(TARGET) $(LEXER_CPP) $(PARSER_CPP) $(SRC)
	./$(TARGET) $(TEST_FILE)

run:
	./$(TARGET) $(TEST_FILE)

show:
	clang -S -emit-llvm -o $(TEST_IR) -O0 $(TEST_FILE)
	llc $(TEST_IR) -o $(TEST_AS)
	clang $(TEST_AS)

clean:
	-rm -f *.exe
	-rm $(LEXER_CPP)
	-rm $(PARSER_HPP)
	-rm $(PARSER_CPP)
	-rm parser.output