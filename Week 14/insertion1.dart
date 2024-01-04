List insertion(List arr) {
  for (int i = 0; i < arr.length; i++) {
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
  List arr = [45, 63, 89, 12, 74, 96, 32, 58, 42, 2, 6, 48, 3, 1, 7];
  print('ori: $arr');
  print('after : ${insertion(arr)}');
}
