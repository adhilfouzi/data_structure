void bubbleSort(List<int> arr) {
  int n = arr.length;

  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      // Compare adjacent elements
      if (arr[j] > arr[j + 1]) {
        // Swap them if they are in the wrong order
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

  print('Original List: $numbers');

  // Perform Bubble Sort
  bubbleSort(numbers);

  print('Sorted List: $numbers');
}
