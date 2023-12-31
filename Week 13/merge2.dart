class Node {
  int val;
  Node? next;
  Node(this.val);
}

class Linkedlist {
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

  void display() {
    Node? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }

  void merge(Linkedlist list) {
    if (head == null) {
      head = list.head;
      return;
    }
    tail!.next = list.head;
  }
}

void main() {
  Linkedlist list1 = Linkedlist();
  list1.add(55);
  list1.add(65);
  list1.add(75);
  list1.add(85);
  list1.add(95);
  print("Linked List 1:");
  list1.display();

  Linkedlist list2 = Linkedlist();
  list2.add(11);
  list2.add(22);
  list2.add(33);
  list2.add(44);
  list2.add(55);
  print("Linked List 2:");
  list2.display();
  list1.merge(list2);
  print("Linked List merged:");
  list1.display();
}
