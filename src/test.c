#define N 8

int printf(char *__format, ...);

int main() {
    int sum = 0;

    for (int i = 0; i < N; ++i) {
        printf("%d %d\n", i, sum);

        if (i % 2 == 1) {
            continue;
        }

        sum += i;
    }


    return sum;
}