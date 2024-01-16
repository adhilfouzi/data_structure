List<int> quicksort(List<int> arr) {
  sorteway(arr, 0, arr.length - 1);
  return arr;
}

void sorteway(List<int> arr, int st, int ed) {
  if (st >= ed) return;
  int pi = (st + ed) ~/ 2;
  int l = st;
  int r = ed;
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
  sorteway(arr, st, r);
  sorteway(arr, l, ed);
}

void swap(List<int> arr, int l, int r) {
  int temp = arr[l];
  arr[l] = arr[r];
  arr[r] = temp;
}

void main() {
  List<int> arr = [1, 9, 2, 8, 3, 7, 4, 6, 5, 0];
  print('before $arr');
  print('after :${quicksort(arr)}');
}
