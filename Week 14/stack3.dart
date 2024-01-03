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
      print('Stack is empty');
      return;
    }
    top = top!.next;
  }

  void display() {
    Node? curr = top;
    while (curr != null) {
      print(curr.val);
      curr = curr.next;
    }
  }
}

void main() {
  Stack lst = Stack();
  lst.push(4);
  lst.push(64);
  lst.push(9);
  lst.push(5);
  lst.pop();
  lst.display();
}
