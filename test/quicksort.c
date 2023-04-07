int scanf(const char *__format, ...);

int printf(const char *__format, ...);

#define MaxN 10000
int array[MaxN];

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
    scanf("%d", &n);

    for (int i = 0; i < n; ++i) {
        scanf("%d", array + i);
    }
    
    quickSort(0, n-1, array);

    for (int i = 0; i < n; ++i) {
        printf("%d\n", array[i]);
    }

    return 0;
}