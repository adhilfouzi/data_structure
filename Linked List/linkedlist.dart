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

  void addfist(int val) {
    Node? newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      Node? neft = head;
      head = newval;
      head!.next = neft;
    }
  }

  void addlast(int val) {
    Node? newval = Node(val);
    if (head == null) {
      head = newval;
    } else {
      tail!.next = newval;
    }
    tail = newval;
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
  list.add(6);
  list.addfist(7);
  list.addlast(8);
  list.add(9);
  list.display();
}
