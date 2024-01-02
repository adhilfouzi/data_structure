List insert(List arr) {
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
  List arr = [45, 12, 85, 96, 14, 56, 72, 1, 3];
  print('original ${arr}');
  print('after :${insert(arr)}');
}
