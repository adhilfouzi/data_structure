class Node {
  int val;
  Node? pre;
  Node? next;
  Node(this.val);
}

class doubly {
  Node? head;
  Node? tail;

  void add(int val) {
    Node? newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      tail!.next = newval;
      newval.pre = tail;
    }
    tail = newval;
  }

  void delect(int val) {
    if (head == null) return;

    if (head!.val == val) {
      head = head!.next;
      head!.next!.pre = null;
      return;
    }
    Node? curr = head;
    Node? pre;
    while (curr != null && curr.val != val) {
      pre = curr;
      curr = curr.next;
    }
    if (curr == null) return;
    pre!.next = curr.next;
    if (curr.next != null) {
      curr.next!.pre = pre;
    }
    if (tail == curr) {
      tail = pre;
    }
  }

  void display() {
    print('main');
    Node? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }

  void reversedisplay() {
    print('reverse print');
    Node? curr = tail;
    while (curr != null) {
      print(curr.val);
      curr = curr.pre;
    }
  }
}

void main() {
  doubly list = doubly();
  list.add(5);
  list.add(7);
  list.add(9);
  list.add(11);
  list.add(13);
  list.add(15);
  list.delect(15);
  list.display();
  list.reversedisplay();
}
