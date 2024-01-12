class Maxheap {
  List<int> heap = [];
  void build(List<int> arr) {
    heap.addAll(arr);
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      heapifydown(i);
    }
    print('after build $heap');
  }

  void heapifydown(int i) {
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    int large = i;
    if (l < heap.length && heap[l] > heap[large]) large = l;
    if (r < heap.length && heap[r] > heap[large]) large = r;
    if (large != i) {
      swap(i, large);
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
    print('after insert $heap');
  }

  void heapifyup(int index) {
    while (index >= 0) {
      int dad = (index - 1) ~/ 2;
      if (heap[dad] < heap[index]) {
        swap(index, dad);
        index = dad;
      } else {
        break;
      }
    }
  }

  void remove() {
    heap[0] = heap.last;
    heap.removeLast();
    heapifydown(0);
    print('after remove $heap');
  }
}

void main() {
  Maxheap max = Maxheap();
  max.build([7, 9, 3, 1, 4, 6, 2, 8, 5]);
  max.insert(0);
  max.remove();
}
