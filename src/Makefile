CC 		= clang
LEX 	= flex
YACC 	= bison

CFLAGS  = `llvm-config --cflags --ldflags --libs`

SRC		= main.c \
		  assemble.c ErrorMessage.c ParseTree.c preprocess.c semantic.c symbol.c table.c utility.c

LEXER_CPP = lexer.c
PARSER_CPP = parser.c
PARSER_HPP = parser.h

TARGET = meow.out
TEST_FILE = test.c
TEST_IR = $(TEST_FILE:.c=.ll)
TEST_AS = $(TEST_FILE:.c=.s)

all:
	$(YACC) --yacc -dv -o $(PARSER_CPP) parser.y
	$(LEX) -o $(LEXER_CPP) lexer.l
	$(CC) $(CFLAGS) -o $(TARGET) $(LEXER_CPP) $(PARSER_CPP) $(SRC)
	cp ./$(TARGET) ../test/$(TARGET)
	./$(TARGET) $(TEST_FILE)

run:
	./$(TARGET) $(TEST_FILE)

test:
	make test -C ../test

show:
	clang -S -emit-llvm -o $(TEST_IR) -O0 $(TEST_FILE)
	llc $(TEST_IR) -o $(TEST_AS)
	clang $(TEST_AS)

emit:
	clang -S -emit-llvm -o testAns.ll -O0 $(TEST_FILE)

clean:
	-rm -f *.out *.ll *.i  *.o
	-rm $(LEXER_CPP)
	-rm $(PARSER_HPP)
	-rm $(PARSER_CPP)
	-rm parser.output