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
      print('Stack underflow');
      return;
    } else {
      front = front!.next;
      if (front == null) {
        rear = front;
      }
    }
  }

  void getall() {
    if (front == null) {
      print('Stack underflow');
      return;
    } else {
      Node? curr = front;
      while (curr != null) {
        print(curr.val);
        curr = curr.next;
      }
    }
  }
}

void main() {
  Queue lst = Queue();
  lst.enqueue(5);
  lst.enqueue(6);
  lst.enqueue(7);
  lst.enqueue(8);
  lst.enqueue(9);
  lst.dequeue();
  lst.getall();
}
