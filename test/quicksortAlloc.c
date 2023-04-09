// 该程序会发生栈溢出，故舍弃

void *malloc(unsigned long long _Size);

void free(void *_Memory);

int scanf(const char *__format, ...);

int printf(const char *__format, ...);

void quickSort(int left, int right, int arr[]) {
    int i = left, j = right;
    int pivot = arr[(left + right) / 2];

    while (i <= j) {
        while (arr[i] < pivot)
            ++i;
        while (arr[j] > pivot)
            --j;
        if (i <= j) {
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            ++i; --j;
        }
    }

    if (left < j)
        quickSort(left, j, arr);
    if (i < right)
        quickSort(i, right, arr);
}

int main() {
    int n;
    int *array;

    scanf("%d", &n);
    array = (int *)malloc(n*sizeof(int));
    for (int i = 0; i < n; ++i) {
        scanf("%d", array + i);
    }
    
    quickSort(0, n, array);

    for (int i = 0; i < n; ++i) {
        printf("%d\n", array[i]);
    }

    free(array);
    return 0;
}