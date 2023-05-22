CC = clang

SRCS = quicksort.c # matrix-multiplication.c auto-advisor.c
OBJS = $(SRCS:.c=.o)
TARGET = $(SRCS:.c=.out)

PLATFORM = linux

all: $(TARGET)
	./tester/quicksort/$(PLATFORM)-amd64 ./quicksort.out
#	./tester/matrix-multiplication/$(PLATFORM)-amd64 ./matrix-multiplication.out
#	./tester/auto-advisor/$(PLATFORM)-amd64 ./auto-advisor.out


%.out : %.o
	$(CC) $< -o $@ -no-pie

%.o : %.c
	./meow.out $<
#	$(CC) $< -o $@

clean:
	-rm -f *.o
	-rm -f *.exe
	-rm -f *.out