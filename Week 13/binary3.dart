void main() {
  List ar = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  binary(9, ar);
  print(ar);
}

void binary(int val, List ar) {
  int l = 0;
  int h = ar.length - 1;
  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (ar[mid] == val) {
      ar[mid] = 1000;
    } else if (ar[mid] < val) {
      l = mid + 1;
    } else {
      h = mid - 1;
    }
  }
}
