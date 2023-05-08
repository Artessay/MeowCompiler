CC 		= g++
LEX 	= flex
YACC 	= bison

SRC		= main.cpp

LEXER_CPP = lexer.cpp
PARSER_CPP = parser.cpp
PARSER_HPP = parser.hpp

TARGET = test.exe
TEST_FILE = test.c

all: $(TARGET)
	$(YACC) --yacc -dv -o $(PARSER_CPP) parser.y
	$(LEX) -o lexer.cpp lexer.l
	$(CC) -o $(TARGET) $(LEXER_CPP) $(PARSER_CPP) $(SRC)
	./$(TARGET) < $(TEST_FILE)

run:
	./$(TARGET) < $(TEST_FILE)

clean:
	-rm -f *.exe
	-rm $(LEXER_CPP)
	-rm $(PARSER_HPP)
	-rm $(PARSER_CPP)
	-rm parser.output