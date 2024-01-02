void insertionSort(List<int> arr) {
  int n = arr.length;

  for (int i = 1; i < n; i++) {
    int key = arr[i];
    int j = i - 1;

    // Move elements greater than key to one position ahead of their current position
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }

    arr[j + 1] = key;
  }
}

void main() {
  List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

  print('Original List: $numbers');

  // Perform Insertion Sort
  insertionSort(numbers);

  print('Sorted List: $numbers');
}
