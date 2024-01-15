class MaxHeap {
  List<int> heap = [];

  void build(List<int> arr) {
    heap.addAll(arr);
    for (int i = (heap.length - 1) ~/ 2; i >= 0; i--) {
      heapifydown(i);
    }
    print('after Build :${heap}');
  }

  void heapifydown(int i) {
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    int largest = i;
    if (l < heap.length && heap[l] > heap[largest]) {
      largest = l;
    }
    if (r < heap.length && heap[r] > heap[largest]) {
      largest = r;
    }
    if (i != largest) {
      swap(i, largest);
      heapifydown(largest);
    }
  }

  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void insert(int val) {
    heap.add(val);
    heapifyup(heap.length - 1);

    print('after insert :${heap}');
  }

  void heapifyup(int i) {
    while (i > 0) {
      int dad = (i - 1) ~/ 2;
      if (heap[dad] < heap[i]) {
        swap(dad, i);
        i = dad;
      } else {
        break;
      }
    }
  }

  void remove() {
    heap.first = heap.last;
    heap.removeAt(heap.length - 1);
    heapifydown(0);
    print('after remove :${heap}');
  }
}

void main() {
  MaxHeap heap = MaxHeap();
  heap.build([7, 8, 3, 2, 9, 4, 1, 6, 5, 0]);
  heap.remove();
  heap.insert(45);
}
