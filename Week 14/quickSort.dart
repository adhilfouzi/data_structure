List quicksort(List arr) {
  sortway(arr, 0, arr.length - 1);
  return arr;
}

void sortway(List arr, int start, int end) {
  if (start >= end) return;
  int l = start;
  int r = end;
  int pi = (start + end) ~/ 2;
  while (l <= r) {
    while (arr[l] < arr[pi]) {
      l++;
    }
    while (arr[r] > arr[pi]) {
      r--;
    }
    if (l <= r) {
      swap(arr, l, r);
      l++;
      r--;
    }
  }
  sortway(arr, start, r);
  sortway(arr, l, end);
}

void swap(List arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

void main() {
  List arr = [7, 9, 3, 1, 4, 6, 8, 2, 5];
  print(arr);
  print(quicksort(arr));
}
