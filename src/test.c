int scanf(char *__format, ...);

int printf(char *__format, ...);

int main() {
    int n;
    scanf("%d", &n);
    int *x = &n;
    printf("%d\n", *x);
    return 0;
}