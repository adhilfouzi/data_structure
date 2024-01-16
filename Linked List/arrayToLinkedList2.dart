class LinkedList {
  int val;
  LinkedList? next;

  // Constructor to initialize value and next node
  LinkedList(this.val, [this.next]);
}

LinkedList? arrayToList(List array) {
  if (array.isEmpty) {
    print('Array is empty');
    throw Exception('Empty array');
  }

  LinkedList? head;
  LinkedList? current;

  // Iterate through the array and create nodes
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

  print('Reverse Print LinkedList:');

  while (current != null) {
    // Append values to the beginning of the list for correct reversal
    reversedList.insert(0, current.val);
    current = current.next;
  }

  // Print the reversed list
  for (int value in reversedList) {
    print(value);
  }
}

void main() {
  List array = [11, 66, 46, 33, 88, 52];
  LinkedList? node = arrayToList(array);

  // Print the original linked list
  print('Original LinkedList:');
  while (node != null) {
    print(node.val);
    node = node.next;
  }

  // Reverse and print the linked list
  reversePrintLinkedList(node);
}
