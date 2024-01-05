class Stack {
  List<int> arr = [];
  int top = 0;
  void push(int val) {
    if (arr.isEmpty) {
      arr.add(val);
    } else {
      arr.insert(0, val);
    }
  }

  void pop() {
    if (arr.isEmpty) {
      print('Stack underflow');
    } else {
      arr.removeAt(0);
    }
  }

  void display() {
    if (arr.isEmpty) {
      print('Stack underflow');
    } else {
      for (int i = 0; i < arr.length; i++) {
        print(arr[i]);
      }
    }
  }
}

void main() {
  Stack lst = Stack();
  lst.push(5);
  lst.push(7);
  lst.push(9);
  lst.push(2);
  lst.push(1);
  lst.pop();
  lst.display();
}
