List mergesort(List arr) {
  if (arr.length <= 1) return arr;
  int mid = arr.length ~/ 2;
  List l = arr.sublist(0, mid);
  List r = arr.sublist(mid);
  return merge(mergesort(l), mergesort(r));
}

List merge(List l, List r) {
  List re = [];
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
  List arr = [3, 6, 9, 8, 5, 2, 1, 4, 7];
  print(arr);
  print(mergesort(arr));
}
