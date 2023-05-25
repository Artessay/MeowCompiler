int scanf(char *__format, ...);

int printf(char *__format, ...);

#define MaxN 25

int a[MaxN][MaxN], b[MaxN][MaxN], c[MaxN][MaxN];

int main() {
    int ra, ca;
    scanf("%d%d", &ra, &ca);
    for (int i = 0; i < ra; ++i) {
        for (int j = 0; j < ca; ++j) {
            scanf("%d", &a[i][j]);
        }
    }

    int rb, cb;
    scanf("%d%d", &rb, &cb);
    for (int i = 0; i < rb; ++i) {
        for (int j = 0; j < cb; ++j) {
            scanf("%d", &b[i][j]);
        }
    }

    if (ca != rb) {
        printf("Incompatible Dimensions\n");
        return 0;
    }

    for (int i = 0; i < ra; ++i) {
        for (int j = 0; j < cb; ++j) {
            c[i][j] = 0;
            for (int k = 0; k < ca; ++k) {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }

    for (int i = 0; i < ra; ++i) {
        for (int j = 0; j < cb; ++j) {
            printf("%10d", c[i][j]);
        }
        printf("\n");
    }

    return 0;
}