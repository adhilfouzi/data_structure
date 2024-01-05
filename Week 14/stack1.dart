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
    } else {
      top = top!.next;
    }
  }

  void get(int val) {
    if (top == null) {
      print('Stack is empty');
      return;
    } else {
      Node? curr = top;
      int i = 0;
      while (curr != null) {
        if (i == val) {
          print('value is ${curr.val}');
        }
        i++;
        curr = curr.next;
      }
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
  lst.push(8);
  lst.push(6);
  lst.push(4);
  lst.pop();
  lst.getall();
}
