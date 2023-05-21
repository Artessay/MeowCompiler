// #define MaxN 10000

// int scanf(char *__format, ...);

int printf(char *__format, ...);

// int array[10000];
int array[10];

void quickSort(int left, int right, int* arr) {
    int i = left, j = right;
    int pivot = arr[(left + right) / 2];

    while (i <= j) {
        while (arr[i] < pivot){
            // ++i;
            i = i + 1;
        }            
        while (arr[j] > pivot){
            // --j;
            j = j - 1;
        }  
        if (i <= j) {
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
            // ++i; --j;
            i = i + 1;
            j = j - 1;
        }
    }

    if (left < j){
        quickSort(left, j, arr);
    }
    if (i < right){
        quickSort(i, right, arr);
    }
}

int main() {
    // int n = 10;
    // scanf("%d", &n);

    // for (int i = 0; i < n; ++i) {
    //     scanf("%d", array + i);
    // }

    int n = 4;
    array[0] = 3; 
    array[1] = 6;
    array[2] = 5;
    array[3] = 9;
    // array[4] = 2;
    // array[5] = 1;
    // array[6] = 0;
    // array[7] = 4;
    // array[8] = 8;
    // array[9] = 7;

    quickSort(0, n - 1 , array);

    for (int i = 0; i < n; i = i + 1) {
        printf("%d\n", array[i]);
    }

    return 0;
}