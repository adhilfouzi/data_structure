class Node {
  int val;
  Node? next;
  Node(this.val);
}

class single {
  Node? head;
  Node? tail;
  void add(int val) {
    Node? newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      tail!.next = newval;
    }
    tail = newval;
  }

  void delect(int val) {
    if (head!.val == val) {
      head = head!.next;
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
    if (tail == curr) {
      tail = pre;
    }
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

  void before(int val) {
    Node? curr = head;
    Node? pre;
    while (curr != null) {
      Node? neft = curr.next;
      pre = curr;
      curr = neft;
      if (curr!.val == val) {
        pre.val = 0;
        return;
      }
    }
  }

  void after(int val, int add) {
    Node? curr = head;
    Node? pre;
    while (curr != null) {
      Node? neft = curr.next;
      pre = curr;
      curr = neft;
      if (curr == null) {
        tail!.next = Node(add);
        tail = Node(add);
        return;
      } else if (pre.val == val) {
        curr.val = add;
        return;
      }
    }
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
  list.add(5);
  list.add(56);
  list.add(57);
  list.add(58);
  list.add(59);
  list.add(50);
  list.after(50, 10);
  list.display();
}
