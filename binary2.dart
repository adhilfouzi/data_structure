void main() {
  List row = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  pi(5, row);
  print(row);
}

void pi(int val, List ar) {
  int l = 0;
  int h = ar.length - 1;
  while (l <= h) {
    int mid = (l + h) ~/ 2;
    if (ar[mid] == val) {
      ar.insert(mid, 100);
      return;
    } else if (ar[mid] < val) {
      l = mid + 1;
    } else {
      h = mid - 1;
    }
  }
}
