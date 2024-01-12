class MinHeap {
  List<int> heap = [];

  // Build a min heap from a given list of elements
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

  // Remove and return the minimum element from the heap
  int removeMin() {
    if (heap.isEmpty) {
      throw StateError("Heap is empty");
    }

    final min = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    heapifyDown(0);
    return min;
  }

  // Move the element up the heap to maintain the min heap property
  void heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index] < heap[parentIndex]) {
        // Swap if the current element is smaller than its parent
        swap(index, parentIndex);
        index = parentIndex;
      } else {
        break;
      }
    }
  }

  // Move the element down the heap to maintain the min heap property
  void heapifyDown(int index) {
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;
    int smallest = index;

    if (leftChild < heap.length && heap[leftChild] < heap[smallest]) {
      smallest = leftChild;
    }

    if (rightChild < heap.length && heap[rightChild] < heap[smallest]) {
      smallest = rightChild;
    }

    if (smallest != index) {
      // Swap if the current element is greater than its children
      swap(index, smallest);
      heapifyDown(smallest);
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
  MinHeap minHeap = MinHeap();

  // Build a min heap
  minHeap.buildHeap([10, 5, 15, 3, 7]);

  print("Min Heap:");
  minHeap.printHeap(); // Output: [3, 5, 15, 10, 7]

  // Insert elements into the heap
  minHeap.insert(2);
  minHeap.insert(8);

  print("\nHeap after insertions:");
  minHeap.printHeap(); // Output: [2, 3, 15, 10, 7, 5, 8]

  // Remove the minimum element
  int minElement = minHeap.removeMin();
  print("\nMin Element Removed: $minElement");
  minHeap.printHeap(); // Output: [3, 5, 15, 10, 7, 8]
}
