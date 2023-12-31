class Node {
  int val;
  Node? next;
  Node(this.val);
}

class Stack {
  Node? top;
  void push(int val) {
    Node? newval = Node(val);
    if (top == null) {
      top = newval;
    } else {
      newval.next = top;
      top = newval;
    }
  }

  void pop() {
    if (top == null) {
      print('Stack underflow');
      return;
    }
    top = top!.next;
  }

  void display() {
    if (top == null) {
      print('Stack underflow');
      return;
    }
    Node? curr = top;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }
}

void main() {
  Stack list = Stack();
  list.push(5);
  list.push(15);
  list.push(25);
  list.push(35);
  list.pop();
  list.display();
}
