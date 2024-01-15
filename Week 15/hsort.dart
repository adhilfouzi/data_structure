class HeapSort {
  void heapSort(List<int> arr) {
    int n = arr.length;
    for (int i = (n ~/ 2) - 1; i >= 0; i--) {
      heapify(i, arr.length - 1, arr);
    }
    for (int i = n - 1; i > 0; i--) {
      int temp = arr[i];
      arr[i] = arr[0];
      arr[0] = temp;
      heapify(0, i, arr);
    }
    print(arr);
  }

  void heapify(int index, int length, List<int> arr) {
    int l = 2 * index + 1;
    int r = 2 * index + 2;
    int largest = index;

    if (l < length && arr[l] > arr[largest]) {
      largest = l;
    }
    if (r < length && arr[r] > arr[largest]) {
      largest = r;
    }
    if (index != largest) {
      int temp = arr[index];
      arr[index] = arr[largest];
      arr[largest] = temp;
      heapify(largest, length, arr);
    }
  }
}

void main() {
  HeapSort heap = HeapSort();
  heap.heapSort([9, 6, 3, 2, 1, 4, 5, 8, 7, 0]);
}
