class MaxHeap {
  List<int> heap = [];
  void build(List<int> arr) {
    heap.addAll(arr);
    for (int i = (heap.length - 1) ~/ 2; i >= 0; i--) {
      heapifydown(i);
    }
    print('after build :$heap');
  }

  void heapifydown(int i) {
    int l = 2 * i + 1;
    int r = 2 * i + 1;
    int largest = i;
    if (l < heap.length && heap[l] > heap[largest]) {
      largest = l;
    }
    if (r < heap.length && heap[r] > heap[largest]) {
      largest = i;
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
    print('after insert :$heap');
  }

  void heapifyup(int i) {
    while (i > 0) {
      int dad = (i - 1) ~/ 2;
      if (heap[i] > heap[dad]) {
        swap(i, dad);
        i = dad;
      } else
        break;
    }
  }

  void remove() {
    heap[0] = heap.last;
    heap.removeLast();
    heapifydown(0);
    print('after remove :$heap');
  }
}

void main() {
  MaxHeap max = MaxHeap();
  max.build([7, 8, 3, 2, 1, 6, 9, 4, 5, 0]);
  max.insert(96);
  max.remove();
}
