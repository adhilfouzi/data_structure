class HeapSort {
  void heapSort(List<int> arr) {
    int n = arr.length;

    // Build heap (rearrange array)
    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      heapify(arr, n, i);
    }

    // One by one extract an element from the heap
    for (int i = n - 1; i > 0; i--) {
      // Move current root to the end
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;

      // Call max heapify on the reduced heap
      heapify(arr, i, 0);
    }
  }

  void heapify(List<int> arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    // Find the largest among the root, left child, and right child
    if (left < n && arr[left] > arr[largest]) {
      largest = left;
    }

    if (right < n && arr[right] > arr[largest]) {
      largest = right;
    }

    // Swap and continue to heapify if needed
    if (largest != i) {
      int temp = arr[i];
      arr[i] = arr[largest];
      arr[largest] = temp;

      heapify(arr, n, largest);
    }
  }
}

void main() {
  HeapSort heapSort = HeapSort();
  List<int> arr = [12, 11, 13, 5, 6, 7];

  print('Original array: $arr');

  heapSort.heapSort(arr);

  print('Sorted array: $arr');
}
