class Node {
  int val;
  Node? next;
  Node(this.val);
}

class Stack {
  Node? top;
  void push(int val) {
    Node? newva = Node(val);
    if (top == null) {
      top = newva;
    } else {
      newva.next = top;
      top = newva;
    }
  }

  void pop() {
    if (top == null) {
      print('Stack is empty');
      return;
    } else {
      top = top!.next;
    }
  }

  void getall() {
    if (top == null) {
      print('Stack is empty');
      return;
    } else {
      Node? curr = top;
      while (curr != null) {
        print(curr.val);
        curr = curr.next;
      }
    }
  }
}

void main() {
  Stack lst = Stack();
  lst.push(5);
  lst.push(6);
  lst.push(7);
  lst.push(8);
  lst.push(9);
  lst.pop();
  lst.getall();
}
