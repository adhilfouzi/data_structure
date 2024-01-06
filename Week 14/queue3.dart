class Node {
  int val;
  Node? next;
  Node(this.val);
}

class Queue {
  Node? front;
  Node? rear;
  void enqueue(int val) {
    Node? newvalue = Node(val);
    if (front == null) {
      front = rear = newvalue;
    } else {
      rear!.next = newvalue;
      rear = newvalue;
    }
  }

  void dequeue() {
    if (front == null) {
      print('Queue is Empty');
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
        if (i == val) {
          print('element is ${curr.val}');
          return;
        }
        curr = curr.next;
        i++;
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
  lst.enqueue(6);
  lst.enqueue(56);
  lst.enqueue(67);
  lst.enqueue(68);
  lst.enqueue(69);
  lst.dequeue();
  lst.getall();
}
