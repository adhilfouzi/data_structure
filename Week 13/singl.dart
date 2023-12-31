class Node {
  int val;
  Node? next;
  Node(this.val);
}

class single {
  Node? head;
  Node? tail;
  void addO(int val) {
    Node? newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      tail!.next = newval;
    }
    tail = newval;
  }

  void delect(int val) {
    Node? curr = head;
    Node? pre;
    while (curr != null && curr.val != val) {
      pre = curr;
      curr = curr.next;
    }
    if (curr == null) return;
    pre!.next = curr.next;
  }

  void reverse() {
    Node? curr = head;
    Node? pre;
    while (curr != null) {
      Node? neft = curr.next;
      curr.next = pre;
      pre = curr;
      curr = neft;
    }
    tail = head;
    head = pre;
  }

  void display() {
    Node? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }
}

void main() {
  single list = single();
  list.addO(5);
  list.addO(6);
  list.addO(7);
  list.addO(8);
  list.addO(9);
  list.addO(10);
  list.addO(11);
  list.reverse();
  list.display();
}
