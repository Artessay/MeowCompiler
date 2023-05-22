// #define MaxN 10000

// int scanf(char *__format, ...);

int printf(char *__format, ...);

int arr[10];

int main() {
    printf("Hello World!\n");

    int n = 4;
    printf("n = %d\n", n);

    arr[0] = 3; 
    arr[1] = 6;
    arr[2] = 5;
    arr[3] = 9;

    printf("arr[0] = %d\n", arr[0]);

    for (int i = 0; i < n; i = i + 1) {
        printf("%d\n", arr[i]);
    }

    printf("end\n");

    return 0;
}