CC = gcc

SRCS = quicksort.c matrix-multiplication.c auto-advisor.c
OBJS = $(SRCS:.c=.o)
TARGET = $(SRCS:.c=.exe)

all: $(TARGET)
	./tester/quicksort/windows-amd64.exe ./quicksort.exe
	./tester/matrix-multiplication/windows-amd64.exe ./matrix-multiplication.exe
	./tester/auto-advisor/windows-amd64.exe ./auto-advisor.exe

%.exe : %.c
	$(CC) $< -o $@

clean:
	-rm -f *.o
	-rm -f *.exe