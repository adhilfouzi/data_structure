List bubble(List arr) {
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
  List arr = [45, 42, 63, 8, 75, 91, 24, 63];
  print('ori=$arr');
  print('after ${bubble(arr)}');
}
