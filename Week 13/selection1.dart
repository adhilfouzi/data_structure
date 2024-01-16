List selection(List arr) {
  for (int i = 0; i < arr.length; i++) {
    int index = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[index]) {
        index = j;
      }
    }
    if (arr[i] != arr[index]) {
      int temp = arr[i];
      arr[i] = arr[index];
      arr[index] = temp;
    }
  }

  return arr;
}

void main() {
  List arr = [4, 1, 3, 6, 9, 8, 5, 2, 7];
  print(arr);
  print('before=${selection(arr)}');
}
