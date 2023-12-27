class Node {
  int val;
  Node? pre;
  Node? next;
  Node(this.val);
}

class Double {
  Node? head;
  Node? tail;
  void add(int val) {
    Node newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      tail!.next = newval;
      newval.pre = tail;
    }
    tail = newval;
  }

  void display() {
    print('main order');
    Node? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }

  void displayre() {
    print('reverse display ');
    Node? curr = tail;
    while (curr != null) {
      print(curr.val);
      curr = curr.pre;
    }
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
    if (curr.next != null) {
      curr.next!.pre = pre;
    }
    if (curr == tail) {
      tail = pre;
    }
  }

  void before(int val) {
    Node? curr = head;
    Node? pre;
    while (curr != null && curr.val != val) {
      pre = curr;
      curr = curr.next;
      Node? neft = curr!.next;
      if (neft!.val == val) {
        pre.next = neft;
        neft.pre = pre;
      }
    }
  }

  void after(int val) {
    Node? curr = head;
    while (curr != null && curr.val != val) {
      curr = curr.next;
      Node? neft = curr!.next;
      if (curr.val == val) {
        curr.next = neft!.next;
        if (neft.next!.pre != null) {
          neft.next!.pre = curr;
        }
      }
    }
  }
}

void main() {
  Double list = Double();
  list.add(5);
  list.add(6);
  list.add(7);
  list.add(8);
  list.add(9);
  list.add(10);
  list.add(11);
  list.add(12);
  list.add(13);
  list.after(9);
  list.display();
  list.displayre();
}
