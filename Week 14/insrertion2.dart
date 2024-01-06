List insertion(List arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

void main() {
  List lst = [7, 9, 1, 3, 4, 6, 8, 2, 5];
  print(lst);
  print(insertion(lst));
}
