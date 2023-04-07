CC = gcc

SRCS = quicksort.c matrix-multiplication.c
OBJS = $(SRCS:.c=.o)
TARGET = $(SRCS:.c=.exe)

all: $(TARGET)
#	./tester/quicksort/windows-amd64.exe ./quicksort.exe
	./tester/matrix-multiplication/windows-amd64.exe ./a.exe

$(TARGET) : $(OBJS)
	$(CC) $< -o $@

$(OBJS) : $(SRCS)
	$(CC) -c $< -o $@

clean:
	del *.o
	del *.exe