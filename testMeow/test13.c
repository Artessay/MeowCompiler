
#define N 25

// #include <stdio.h>

int printf(char *__format, ...);

int main() {
    int sum = 0;

    for (int i = 0; i < N; ++i) {
        printf("%d %d\n", i, sum);

        if (i < 2) {
            continue;
        }

        sum += i;

        if (i == 6) {
            break;
        }
    }


    return sum;
}