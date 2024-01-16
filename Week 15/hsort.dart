class HeapSort {
  void heapSort(List<int> arr) {
    int n = arr.length;
    for (int i = (n - 1) ~/ 2; i >= 0; i--) {
      heapify(n, arr, i);
    }
    for (int i = n - 1; i >= 0; i--) {
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;
      heapify(i, arr, 0);
    }
    print(arr);
  }

  void heapify(int length, List<int> arr, int i) {
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    int largest = i;
    if (l < length && arr[l] > arr[largest]) {
      largest = l;
    }
    if (r < length && arr[r] > arr[largest]) {
      largest = r;
    }
    if (i != largest) {
      int temp = arr[i];
      arr[i] = arr[largest];
      arr[largest] = temp;
      heapify(length, arr, largest);
    }
  }
}

void main() {
  HeapSort sort = HeapSort();
  sort.heapSort([7, 9, 3, 1, 4, 6, 8, 2, 5, 0, 12, 63, 9, 54, 7, 8]);
}
