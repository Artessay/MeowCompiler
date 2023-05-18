CC 		= gcc
LEX 	= flex
YACC 	= bison

SRC		= main.c \
		  ErrorMessage.c ParseTree.c symbol.c table.c utility.c

LEXER_CPP = lexer.c
PARSER_CPP = parser.c
PARSER_HPP = parser.h

TARGET = test.exe
TEST_FILE = test.c

all:
	$(YACC) --yacc -dv -o $(PARSER_CPP) parser.y
	$(LEX) -o $(LEXER_CPP) lexer.l
	$(CC) -o $(TARGET) $(LEXER_CPP) $(PARSER_CPP) $(SRC)
	./$(TARGET) $(TEST_FILE)

run:
	./$(TARGET) $(TEST_FILE)

clean:
	-rm -f *.exe
	-rm $(LEXER_CPP)
	-rm $(PARSER_HPP)
	-rm $(PARSER_CPP)
	-rm parser.output