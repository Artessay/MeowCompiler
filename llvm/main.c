#include <stdio.h>

int main() {
    int a;
    scanf("%d", &a);

    int b;
    scanf("%d", &b);

    int c = 0;
    if (a == b) {
        c = 5;
    } else {
        c = 10;
    }

    printf("%d\n", c);
    
    return 0;
}