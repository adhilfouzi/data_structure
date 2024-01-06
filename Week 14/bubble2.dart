List bubbl(List arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

void main() {
  List arr = [7, 9, 3, 1, 8, 2, 6, 4, 5];
  print(arr);
  print(bubbl(arr));
}
