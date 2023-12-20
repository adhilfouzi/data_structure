class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class SinglyLinkedList {
  Node? head;

  //SinglyLinkedList();

  void addNode(dynamic data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void deleteNode(dynamic data) {
    if (head == null) {
      print("head == null");
      return;
    }

    if (head!.data == data) {
      head = head!.next;
      print("head!.data == data");
      return;
    }

    Node? current = head;
    Node? previous;

    while (current != null && current.data != data) {
      previous = current;
      current = current.next;
    }

    if (current == null) {
      print("current == null");
      return; // Node with the given data not found
    }

    previous!.next = current.next;
  }

  // void replaceNodeValue(dynamic oldData, dynamic newData) {
  //   Node? current = head;

  //   while (current != null && current.data != oldData) {
  //     current = current.next;
  //   }

  //   if (current != null) {
  //     current.data = newData;
  //   }
  // }

  void printList() {
    Node? current = head;
    while (current != null) {
      print('Data ${current.data} next  ${current.next}');
      current = current.next;
    }
  }
}

void main() {
  SinglyLinkedList linkedList = SinglyLinkedList();

  // Adding nodes to the linked list
  linkedList.addNode(1);
  linkedList.addNode(2);
  linkedList.addNode(3);

  // Printing the original linked list
  print("Original Linked List:");
  linkedList.printList();

  // Deleting a node with value 2
  linkedList.deleteNode(2);
  print("\nLinked List after deleting node with value 2:");
  linkedList.printList();

  // Replacing the value of a node from 1 to 4
  // linkedList.replaceNodeValue(1, 4);
  // print("\nLinked List after replacing value 1 with 4:");
  // linkedList.printList();
}
