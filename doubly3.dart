class Node {
  int val;
  Node? Next;
  Node? pre;
  Node(this.val);
}

class Doubly {
  Node? head;
  Node? tail;

  void add(int val) {
    Node? newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      tail!.Next = newval;
      newval.pre = tail;
    }
    tail = newval;
  }

  void display() {
    print('main display');
    Node? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.Next;
    }
  }

  void resdisplay() {
    print('Re display');
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
      curr = curr.Next;
    }
    if (curr == null) return;
    pre!.Next = curr.Next;
    if (curr.Next != null) {
      curr.Next!.pre = pre;
    }
    if (curr == tail) {
      tail = pre;
    }
  }

  void before(int val) {
    Node? curr = head;
    Node? pre;
    while (curr != null) {
      pre = curr;
      curr = curr.Next;
      if (curr!.Next!.val == val) {
        pre.Next = curr.Next;
        if (curr.Next!.pre != null) {
          curr.Next!.pre = pre;
        }
        return;
      }
    }
  }

  void after(int val) {
    Node? curr = head;
    while (curr != null) {
      curr = curr.Next;
      Node? neft = curr!.Next;
      if (curr.val == val) {
        curr.Next = neft!.Next;
        if (neft.Next!.pre != null) {
          neft.Next!.pre = curr;
        }
        return;
      }
    }
  }
}

void main() {
  Doubly list = Doubly();
  list.add(8);
  list.add(9);
  list.add(10);
  list.add(11);
  list.add(12);
  list.add(13);
  list.add(14);
  list.add(15);
  list.add(16);
  list.before(10);

  list.display();
  list.resdisplay();
}
