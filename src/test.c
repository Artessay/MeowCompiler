int scanf(char *__format, ...);

int printf(char *__format, ...);

int main() {
    int n = 4;
    // scanf("%d", &n);
    int *x;
    *x = &n;
    // printf("%d\n", *x);
    return 0;
}