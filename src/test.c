int scanf(char *__format, ...);

int printf(char *__format, ...);

int main() {
    int n = 4;
    scanf("%d", &n);
    printf("%d\n", n);
    int *x;
    x = &n;
    printf("%d\n", *x);
    *x = 3;
    return n;
}