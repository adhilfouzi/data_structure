class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void insert(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void merge(LinkedList list) {
    if (head == null) {
      head = list.head;
      return;
    }

    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.next = list.head;
  }
}

void main() {
  LinkedList list1 = LinkedList();
  list1.insert(1);
  list1.insert(3);
  list1.insert(5);

  LinkedList list2 = LinkedList();
  list2.insert(2);
  list2.insert(4);
  list2.insert(6);

  print("Linked List 1:");
  list1.display();

  print("\nLinked List 2:");
  list2.display();

  // Merge the linked lists
  list1.merge(list2);

  print("\nMerged Linked List:");
  list1.display();
}
