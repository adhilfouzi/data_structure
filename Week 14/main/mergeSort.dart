List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }

  int middle = arr.length ~/ 2;
  List<int> left = arr.sublist(0, middle);
  List<int> right = arr.sublist(middle);

  return merge(mergeSort(left), mergeSort(right));
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];

  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));

  return result;
}

void main() {
  List<int> arr = [38, 27, 43, 3, 9, 82, 10];
  print('Before: $arr');

  List<int> sortedArr = mergeSort(arr);

  print('After : $sortedArr');
}
