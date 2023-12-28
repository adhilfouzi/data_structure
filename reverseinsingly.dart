class LinkNode {
  int val;
  LinkNode? next;
  LinkNode(this.val);
}

class singlyLinkedlist {
  LinkNode? head;
  LinkNode? tail;

  void addNode(int value) {
    LinkNode newvalue = LinkNode(value);
    if (head == null) {
      head = newvalue;
    } else {
      tail!.next = newvalue;
    }
    tail = newvalue;
  }

  void display() {
    LinkNode? curr = head;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }

  void reversorder() {
    LinkNode? curr = head;
    LinkNode? prevalue;
    while (curr != null) {
      LinkNode? nextvalue = curr.next;
      curr.next = prevalue;
      prevalue = curr;
      curr = nextvalue;
    }
    head = prevalue;
  }
}

void main() {
  singlyLinkedlist list = singlyLinkedlist();
  list.addNode(3);
  list.addNode(5);
  list.addNode(6);
  list.display();
  list.reversorder();
  list.display();
}
