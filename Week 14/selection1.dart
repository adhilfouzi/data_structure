List selection(List arr) {
  for (var i = 0; i < arr.length; i++) {
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
  List arr = [45, 12, 63, 85, 78, 96, 42, 59, 2, 4];
  print('after : $arr');
  print('after : ${selection(arr)}');
}
