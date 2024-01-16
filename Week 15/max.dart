class MaxHeap {
  List<int> heap = [];
  void build(List<int> arr) {
    heap.addAll(arr);
    for (int i = (heap.length - 1) ~/ 2; i >= 0; i--) {
      heapifydown(i);
    }
    print(heap);
  }

  void heapifydown(int ind) {
    int l = 2 * ind + 1;
    int r = 2 * ind + 2;
    int large = ind;

    if (l < heap.length && heap[l] < heap[large]) {
      large = l;
    }
    if (r < heap.length && heap[r] < heap[large]) {
      large = r;
    }
    if (ind != large) {
      swap(ind, large);
      heapifydown(large);
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
    print(heap);
  }

  void remove() {
    heap.first = heap.last;
    heap.removeAt(heap.length - 1);
    heapifydown(0);
    print(heap);
  }

  void heapifyup(int ind) {
    while (ind > 0) {
      int dad = (ind - 1) ~/ 2;
      if (heap[ind] < heap[dad]) {
        swap(ind, dad);
        ind = dad;
      } else {
        break;
      }
    }
  }
}

void main() {
  MaxHeap max = MaxHeap();
  max.build([9, 1, 3, 6, 4, 8, 5, 7, 0]);
  max.remove();
  max.insert(56);
}
