class LinkedList {
  int val;
  LinkedList? next;
  LinkedList(this.val);
}

LinkedList? arrayToList(List array) {
  if (array.isEmpty) {
    print('Array is empty');
    throw Exception();
  }
  LinkedList? head;
  LinkedList? current = head;
  for (var i = 0; i < array.length; i++) {
    LinkedList newnode = LinkedList(array[i]);
    if (head == null) {
      head = newnode;
      current = head;
    } else {
      current!.next = newnode;
      current = newnode;
    }
  }
  return head;
}

void reversePrintLinkedList(LinkedList? head) {
  if (head == null) {
    return;
  }

  List<int> reversedList = [];
  LinkedList? current = head;

  print('reverse Print LinkedList');

  while (current != null) {
    // Append values to the end of the list for correct reversal:
    reversedList.insert(0, current.val);

    current = current.next;
  }

  for (int value in reversedList) {
    print(value);
  }
}

void main() {
  List array = [11, 66, 46, 33, 88, 52];
  LinkedList? node = arrayToList(array);
  LinkedList? tail = node;
  while (node != null) {
    print(node.val);
    node = node.next;
  }
  reversePrintLinkedList(tail);
}
