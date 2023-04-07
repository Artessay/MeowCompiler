#define NULL ((void *)0)

void *malloc(unsigned long long _Size);

void free(void *_Memory);

int scanf(const char *__format, ...);

int printf(const char *__format, ...);

struct matrix {
    int row, col;
    int **data;
};

void freeMatrix(struct matrix *m) {
    if (m == NULL) {
        return;
    }

    for (int i = 0; i < m->row; ++i) {
        free(m->data[i]);
        m->data[i] = NULL;
    }
    free(m->data);
    m->data = NULL;

    free(m);
}

struct matrix* readMatrix() {
    struct matrix *m = (struct matrix *)malloc(sizeof(struct matrix));
    scanf("%d%d", &m->row, &m->col);

    m->data = (int **)malloc(m->row * sizeof(int *));
    for (int i = 0; i < m->row; ++i) {
        m->data[i] = (int *)malloc(m->col * sizeof(int));
        for (int j = 0; j < m->col; ++j) {
            scanf("%d", &m->data[i][j]);
        }
    }

    return m;
}

struct matrix *matrixMultiply(struct matrix *x, struct matrix *y) {
    if (x == NULL || y == NULL) {
        return NULL;
    }

    if (x->col != y->row) {
        return NULL;
    }

    struct matrix *z = (struct matrix *)malloc(sizeof(struct matrix));
    z->row = x->row; z->col = y->col;

    z->data = (int **)malloc(z->row * sizeof(int *));
    for (int i = 0; i < z->row; ++i) {
        z->data[i] = (int *)malloc(z->col * sizeof(int));
    }

    for (int i = 0; i < x->row; ++i) {
        for (int j = 0; j < y->col; ++j) {
            int ans = 0;
            for (int k = 0; k < x->col; ++k) {
                ans += x->data[i][k] * y->data[k][j];
            }
            z->data[i][j] = ans;
        }
    }

    return z;
}

void printMatrix(struct matrix *m) {
    if (m == NULL) {
        printf("Incompatible Dimensions");
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
    struct matrix *A = readMatrix();
    struct matrix *B = readMatrix();

    struct matrix *C = matrixMultiply(A, B);
    printMatrix(C);

    freeMatrix(A);
    freeMatrix(B);
    freeMatrix(C);
    return 0;
}