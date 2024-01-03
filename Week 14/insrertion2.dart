List selection(List arr) {
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
  List arr = [45, 1, 8, 96, 7, 536, 45, 89, 21];
  print('original : $arr');
  print('after : ${selection(arr)}');
}
