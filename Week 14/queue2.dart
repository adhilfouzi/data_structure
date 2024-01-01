class Node {
  int val;
  Node? next;
  Node(this.val);
}

class Queue {
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
      print('Queue is empty');
      return;
    }
    front = front!.next;
    if (front == null) {
      rear = front;
    }
  }

  void display() {
    if (front == null) {
      print('Queue is empty');
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
  Queue list = Queue();
  list.enqueue(5);
  list.enqueue(7);
  list.enqueue(9);
  list.dequeue();
  list.display();
}
