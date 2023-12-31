class Node {
  int val;
  Node? next;
  Node(this.val);
}

class queue {
  Node? front;
  Node? rear;
  void enqueue(int val) {
    Node? newval = Node(val);
    if (front == null) {
      front = rear = newval;
    } else {
      rear!.next = newval;
      rear = newval;
    }
  }

  void dequeue() {
    if (front == null) {
      print('empty queue');
      return;
    }
    front = front!.next;
    if (front == null) {
      rear = front;
    }
  }

  void display() {
    if (front == null) {
      print('queue is empty');
      return;
    }
    Node? curr = front;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }
}

void main() {
  queue list = queue();
  list.enqueue(5);
  list.enqueue(6);
  list.enqueue(7);
  list.enqueue(8);
  list.dequeue();
  list.dequeue();
  list.display();
}
