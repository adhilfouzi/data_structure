List<int> mergesort(List<int> arr) {
  if (arr.length <= 1) return arr;
  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);
  return merge(mergesort(left), mergesort(right));
}

List<int> merge(List<int> l, List<int> r) {
  List<int> re = [];
  int i = 0, j = 0;
  while (i < l.length && j < r.length) {
    if (l[i] < r[j]) {
      re.add(l[i]);
      i++;
    } else {
      re.add(r[j]);
      j++;
    }
  }
  re.addAll(l.sublist(i));
  re.addAll(r.sublist(j));

  return re;
}

void main() {
  List<int> arr = [7, 5, 3, 1, 9, 4, 6, 8, 2, 0];
  print(arr);
  print('before :${mergesort(arr)}');
}
