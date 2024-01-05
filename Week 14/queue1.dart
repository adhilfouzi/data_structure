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
    } else {
      front = front!.next;
      if (front == null) rear = front;
    }
  }

  void get(int val) {
    if (front == null) {
      print('Queue is empty');
    } else {
      Node? curr = front;
      int i = 0;
      while (curr != null) {
        if (val == i) {
          print('element is ${curr.val}');
        }
        i++;
        curr = curr.next;
      }
    }
  }

  void getall() {
    if (front == null) {
      print('Queue is empty');
    } else {
      Node? curr = front;
      while (curr != null) {
        print('element is ${curr.val}');
        curr = curr.next;
      }
    }
  }
}

void main() {
  Queue lst = Queue();
  lst.enqueue(5);
  lst.enqueue(7);
  lst.enqueue(6);
  lst.enqueue(5);
  lst.enqueue(11);
  lst.getall();
}
