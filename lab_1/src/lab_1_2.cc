#include <stdio.h>



int main() {
    int i, j, key, n, tmp;
    i = 0;
    int arr[100];
    scanf_s("%d", &n);
input_loop:
    if (i >= n) goto prepare;
    scanf_s("%d", &arr[i]);
    i++;
    goto input_loop;

prepare:
    i = 1;
    goto start_sorting;

check1:
    if (j < 0) goto insert;

    goto check2;

check2:
    if (arr[j] <= key) goto insert;
    goto swap2;

swap2:
    tmp = arr[j];
    arr[j + 1] = tmp;
    j = j - 1;
    goto swap;

swap:
    goto check1;


start_sorting:
    if (i >= n) goto temp;
    key = arr[i];
    j = i;
    j = j - 1;
    goto swap;

insert:
    arr[j + 1] = key;
    i = i + 1;
    goto start_sorting;

temp:
    i = 0;
    goto output_loop;

output_loop:
    if (i >= n) goto end_program;
    printf_s("%d ", arr[i]);
    i++;
    goto output_loop;

end_program:
    return 0;
}