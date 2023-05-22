int scanf(char *__format, ...);

int printf(char *__format, ...);

int add(int a, int b) {
    return a + b;
}

int main() {
    int a[20];
    a[0] = 4;
    a[1] = add(1, 2);
    // scanf("%d", &a[2]);

    printf("%d %d %d\n", a[0], a[1], a[2]);

    return 0;
}