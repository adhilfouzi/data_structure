void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    // Find the minimum element in the unsorted part of the array
    int minIndex = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    // Swap the found minimum element with the first element
    if (arr[minIndex] != arr[i]) {
      int temp = arr[minIndex];
      arr[minIndex] = arr[i];
      arr[i] = temp;
    }
  }
}

void main() {
  List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

  print('Original List: $numbers');

  // Perform Selection Sort
  selectionSort(numbers);

  print('Sorted List: $numbers');
}
