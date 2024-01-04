List selection(List arr) {
  for (int i = 0; i < arr.length; i++) {
    int index = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[index]) {
        index = j;
      }
    }
    if (arr[index] != arr[i]) {
      int temp = arr[index];
      arr[index] = arr[i];
      arr[i] = temp;
    }
  }
  return arr;
}

void main() {
  List arr = [12, 45, 63, 1, 2, 89, 64, 73, 4];
  print('original :$arr');
  print('after ${selection(arr)}');
}
