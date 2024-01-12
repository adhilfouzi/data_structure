class MaxHeap {
  List<int> heap = [];

  // Build a max heap from a given list of elements
  void buildHeap(List<int> elements) {
    heap = List.from(elements);
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(i);
    }
  }

  // Insert a new element into the heap
  void insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  // Remove and return the maximum element from the heap
  int removeMax() {
    if (heap.isEmpty) {
      throw StateError("Heap is empty");
    }

    final max = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    heapifyDown(0);
    return max;
  }

  // Move the element up the heap to maintain the max heap property
  void heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index] > heap[parentIndex]) {
        // Swap if the current element is greater than its parent
        swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  // Move the element down the heap to maintain the max heap property
  void heapifyDown(int index) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int largest = index;

    if (leftChild < heap.length && heap[leftChild] > heap[largest]) {
      largest = leftChild;
    }

    if (rightChild < heap.length && heap[rightChild] > heap[largest]) {
      largest = rightChild;
    }

    if (largest != index) {
      // Swap if the current element is smaller than its children
      swap(index, largest);
      heapifyDown(largest);
    }
  }

  // Swap elements at two indices in the heap
  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  // Print the elements of the heap
  void printHeap() {
    print(heap);
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();

  // Build a max heap
  maxHeap.buildHeap([10, 5, 15, 3, 7]);

  print("Max Heap:");
  maxHeap.printHeap(); // Output: [15, 7, 10, 3, 5]

  // Insert elements into the heap
  maxHeap.insert(12);
  maxHeap.insert(20);

  print("\nHeap after insertions:");
  maxHeap.printHeap(); // Output: [20, 7, 15, 3, 5, 10, 12]

  // Remove the maximum element
  int maxElement = maxHeap.removeMax();
  print("\nMax Element Removed: $maxElement");
  maxHeap.printHeap(); // Output: [15, 7, 12, 3, 5, 10]
}
