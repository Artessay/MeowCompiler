CC = clang

SRCS = quicksort.c matrix-multiplication.c auto-advisor.c
OBJS = $(SRCS:.c=.o)
TARGET = $(SRCS:.c=.out)

PLATFORM = linux
COMPILER = ./meow.out

all: $(TARGET)
	./tester/quicksort/quicksort-$(PLATFORM)-amd64 ./quicksort.out
	./tester/matrix/matrix-$(PLATFORM)-amd64 ./matrix-multiplication.out
	./tester/advisor/advisor-$(PLATFORM)-amd64 ./auto-advisor.out


%.out : %.o
	$(CC) $< -o $@ -no-pie

%.o : %.c $(COMPILER)
	$(COMPILER) $<
#	$(CC) $< -o $@

$(COMPILER):
	make -C ../src

clean:
	-rm -f *.o
	-rm -f *.exe
	-rm -f *.out