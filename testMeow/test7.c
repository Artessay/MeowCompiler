// #define MaxN 10000

// int scanf(char *__format, ...);

int printf(char *__format, ...);

// int array[10000];
int arr[10];

int quickSort(int left, int right) {
    int i = left, j = right;
    int mid = (left + right) / 2;
    int pivot = arr[mid];

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
        quickSort(left, j);
    }
    if (i < right){
        quickSort(i, right);
    }

    return 0;
}

int main() {
    int n = 10;

    arr[0] = 3; 
    arr[1] = 6;
    arr[2] = 5;
    arr[3] = 9;
    arr[4] = 2;
    arr[5] = 1;
    arr[6] = 0;
    arr[7] = 4;
    arr[8] = 8;
    arr[9] = 7;

    quickSort(0, n - 1 );


    for (int i = 0; i < n; i = i + 1) {
        printf("%d\n", arr[i]);
    }

    return 0;
}