int printf(char *__format, ...);

int main() {
    int sum = 0, n = 10;
    
    for (int i = 0; i < n; i = i + 1) {
        sum = sum + i;
        printf("%d %d\n", i, sum);
    }

    return sum;
}