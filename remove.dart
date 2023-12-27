class Node {
  int val;
  Node? next;
  Node? prev;
  Node(this.val);
}

class single {
  Node? head;
  Node? tail;
  void add(int val) {
    Node? newnode = Node(val);
    if (head == null) {
      head = newnode;
    } else {
      tail!.next = newnode;
      newnode.prev = tail;
    }
    tail = newnode;
  }

  void remove(int val) {
    if (head!.val == val) {
      head = head!.next;
    }
    Node? curr = head;
    Node? pre;
    while (curr != null && curr.val != val) {
      pre = curr;
      curr = pre.next;
    }
    if (curr == null) return;
    pre!.next = curr.next;
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
  list.add(58);
  list.add(81);
  list.add(18);
  list.add(44);

  list.display();
  print('object');
  list.remove(18);
  list.display();
}
