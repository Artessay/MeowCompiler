int scanf(char *__format, ...);

int printf(char *__format, ...);

int main() {
    int n;

    scanf("%d", &n);
    printf("%d\n", n);

    double f;

    scanf("%lf", &f);
    printf("%lf\n", f);

    return 0;
}