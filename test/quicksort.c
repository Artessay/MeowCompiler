int scanf(char *__format, ...);

int printf(char *__format, ...);

int array[10000];

int quickSort(int left, int right) {
    int i = left, j = right;
    int pivot = array[(left + right) / 2];

    while (i <= j) {
        while (array[i] < pivot){
            ++i;
        }            
        while (array[j] > pivot){
            --j;
        }  
        if (i <= j) {
            int temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            ++i; --j;
        }
    }

    if (left < j){
        quickSort(left, j);
    }
    if (i < right){
        quickSort(i, right);
    }

    return 0;
}

int main() {
    int n;
    scanf("%d", &n);

    for (int i = 0; i < n; i = i + 1) {
        scanf("%d", &array[i]);
    }   

    quickSort(0, n - 1);

    for (int i = 0; i < n; i = i + 1) {
        printf("%d\n", array[i]);
    }

    return 0;
}