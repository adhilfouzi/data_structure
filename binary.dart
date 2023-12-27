void main() {
  List arr = [0, 1, 2, 3, 7, 8, 10, 11];
  binary(2, arr);
  print(arr);
}

void binary(int num, List array) {
  int l = 0;
  int h = array.length - 1;
  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (array[mid] == num) {
      array[mid] = 0;
      print('object');
      return;
    } else if (array[mid] < num) {
      l = mid + 1;
      print('1');
    } else {
      h = mid - 1;
      print('2');
    }
  }
}
