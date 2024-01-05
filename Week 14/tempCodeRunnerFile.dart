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
  List arr = [1, 5, 3, 9, 7, 2, 6, 4, 8, 0];
  print(arr);
  print('before :${insertion(arr)}');
}
