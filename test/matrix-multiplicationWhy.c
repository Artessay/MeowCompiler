#define NULL ((void *)0)
#define MaxN 25

int scanf(const char *__format, ...);

int printf(const char *__format, ...);

struct matrix {
    int row, col;
    int data[MaxN][MaxN];
};

struct matrix A, B, C;

void readMatrix(struct matrix *m) {
    scanf("%d %d", &m->row, &m->col);

    for (int i = 0; i < m->row; ++i) {
        for (int j = 0; j < m->col; ++j) {
            scanf("%d", &m->data[i][j]);
        }
    }
}

struct matrix *matrixMultiply(struct matrix *x, struct matrix *y, struct matrix *z) {
    if (x == NULL || y == NULL) {
        return NULL;
    }

    if (x->col != y->row) {
        return NULL;
    }

    z->row = x->row; z->col = y->col;

    for (int i = 0; i < x->row; ++i) {
        for (int j = 0; j < y->col; ++j) {
            z->data[i][j] = 0;
            for (int k = 0; k < x->col; ++k) {
                z->data[i][j] += x->data[i][k] * y->data[k][j];
            }
        }
    }

    return z;
}

void printMatrix(struct matrix *m) {
    if (m == NULL) {
        printf("Incompatible Dimensions\n");
        return;
    }

    for (int i = 0; i < m->row; ++i) {
        for (int j = 0; j < m->col; ++j) {
            printf("%10d", m->data[i][j]);
        }
        printf("\n");
    }
}

int main() {
    readMatrix(&A);
    readMatrix(&B);

    matrixMultiply(&A, &B, &C);
    printMatrix(&C);

    return 0;
}