List selection(List arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int index = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[index]) {
        index = j;
      }
    }
    if (arr[i] != arr[index]) {
      int temp = arr[index];
      arr[index] = arr[i];
      arr[i] = temp;
    }
  }
  return arr;
}

void main() {
  List arr = [12, 5, 6, 98, 45, 41, 663, 94, 77];

  print('original ${arr}');
  print('after ${selection(arr)}');
}
