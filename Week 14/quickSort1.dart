List<int> quicksort(List<int> arr) {
  sortway(arr, 0, arr.length - 1);
  return arr;
}

void sortway(List<int> arr, int start, int end) {
  if (start >= end) return;
  int pi = (start + end) ~/ 2;
  int l = start;
  int r = end;
  while (l <= r) {
    while (arr[l] < arr[pi]) {
      l++;
    }
    while (arr[r] > arr[pi]) {
      r--;
    }
    if (l <= l) {
      swap(arr, l, r);
      l++;
      r--;
    }
    sortway(arr, start, r);
    sortway(arr, l, end);
  }
}

void swap(List<int> arr, int l, int r) {
  int temp = arr[l];
  arr[l] = arr[r];
  arr[r] = temp;
}

void main() {
  List<int> arr = [1, 9, 3, 5, 7, 2, 6, 4, 8];
  print('before $arr');
  print('after : ${quicksort(arr)}');
}
