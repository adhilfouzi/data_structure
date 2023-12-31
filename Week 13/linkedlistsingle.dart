class Node {
  int val;
  Node? next;
  Node(this.val);
}

class single {
  Node? head;
  Node? tail;
  void add(int val) {
    Node? Newnode = Node(val);
    if (head == null) {
      head = Newnode;
    } else {
      tail!.next = Newnode;
    }
    tail = Newnode;
  }

  void delect(int val) {
    Node? curr = head;
    Node? pre;
    if (head!.val == val) {
      head = head!.next;
      return;
    }

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
  list.add(7);
  list.add(8);
  list.add(9);
  list.add(10);
  list.add(11);
  list.reverse();
  list.display();
}
