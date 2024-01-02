List bubble(List arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j + 1] < arr[j]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

void main() {
  List arr = [78, 2, 5, 9, 6, 45, 93, 12, 855, 75];
  print('original : $arr');
  print('after ${bubble(arr)}');
}
