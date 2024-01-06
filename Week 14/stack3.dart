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
      print('the stack is underflow');
    } else {
      top = top!.next;
    }
  }

  void peek(int val) {
    if (top == null) {
      print('the stack is underflow');
    } else {
      Node? curr = top;
      int i = 0;
      while (curr != null) {
        if (i == val) {
          print('element is ${curr.val}');
          return;
        }
        curr = curr.next;
        i++;
      }
    }
  }

  void getall() {
    if (top == null) {
      print('the stack is underflow');
    } else {
      Node? curr = top;
      while (curr != null) {
        print('${curr.val}');
        curr = curr.next;
      }
    }
  }
}

void main() {
  Stack lst = Stack();
  lst.push(5);
  lst.push(15);
  lst.push(25);
  lst.push(35);
  lst.push(45);
  lst.pop();
  lst.getall();
}
