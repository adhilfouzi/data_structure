List selection(List arr) {
  for (int i = 0; i < arr.length; i++) {
    int mid = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[mid]) {
        mid = j;
      }
    }
    if (arr[mid] != arr[i]) {
      int temp = arr[i];
      arr[i] = arr[mid];
      arr[mid] = temp;
    }
  }
  return arr;
}

void main() {
  List lst = [7, 8, 3, 2, 9, 6, 4, 1, 0];
  print(lst);
  print(selection(lst));
}
