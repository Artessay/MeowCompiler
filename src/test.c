int add(int a, int b) {
    return a + b;
}

#define N 25

#include <stdio.h>

int main() {
    int a[N];
    a[0] = 4;
    a[1] = add(1, 2);


    return a[1];
}