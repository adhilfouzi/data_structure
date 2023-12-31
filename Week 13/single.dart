class Node {
  int val;
  Node? next;
  Node(this.val);
}

class singly {
  Node? head;
  Node? tail;
  void add(int data) {
    Node? newdata = Node(data);
    if (head == null) {
      head = newdata;
    } else {
      tail!.next = newdata;
    }
    tail = newdata;
  }

  void display() {
    if (head == null) return;
    Node? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }

  void delete(int data) {
    if (head == null) return;
    if (head!.val == data) {
      head = head!.next;
      return;
    }
    Node? curr = head;
    Node? pre;
    while (curr != null && curr.val != data) {
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
      Node? nextval = curr.next;
      curr.next = pre;
      pre = curr;
      curr = nextval;
    }
    head = pre;
  }

  void duplic() {
    Node? curr = head;

    while (curr != null && curr.next != null) {
      Node? nextval = curr.next;

      if (curr.val == nextval!.val) {
        curr.next = nextval.next;
        if (nextval == tail) {
          tail = curr;
        }
      } else {
        curr = curr.next;
      }
    }
  }
}

void main() {
  singly list = singly();
  list.add(1);
  list.add(2);
  list.add(4);
  list.add(3);
  list.add(3);
  list.display();

  //list.delete(3);
  //list.reverse();
  list.duplic();
  list.display();
}
