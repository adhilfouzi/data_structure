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
      print('empty stack');
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
  list.push(6);
  list.push(7);
  list.push(8);
  list.pop();
  list.display();
}
