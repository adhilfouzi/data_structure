class DLinkedList {
  int val;
  DLinkedList? next;
  DLinkedList? prev;
  DLinkedList(this.val);
}

class DoublyLinkedList {
  DLinkedList? head;
  DLinkedList? tail;

  void addData(int data) {
    DLinkedList newNode = DLinkedList(data);
    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  void display() {
    DLinkedList? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }

  void removeDuplicates() {
    DLinkedList? curr = head;

    while (curr != null) {
      DLinkedList? nextVal = curr.next;
      while (nextVal != null && curr.val == nextVal.val) {
        nextVal = nextVal.next;
      }
      curr.next = nextVal;
      if (tail == nextVal && curr.val == nextVal!.val) {
        tail = curr;
      }
      curr = nextVal;
    }

    print('tail ${tail!.next}');
  }
}

void main() {
  DoublyLinkedList list = DoublyLinkedList();
  list.addData(6);
  list.addData(10);
  list.addData(5);
  list.addData(5);
  list.addData(5);
  list.addData(8);
  list.addData(9);
  print('Original list:');
  list.display();
  print('After removing duplicates:');
  list.removeDuplicates();
  list.display();
}
