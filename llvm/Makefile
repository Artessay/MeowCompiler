all:
	clang -S -emit-llvm -o main.ll -O0 main.c
	llvm-as main.ll -o main.bc
#	llvm-dis < main.bc > main.bc.s
	llc main.bc -o main.s
	clang main.s -o main.out
	./main.out
