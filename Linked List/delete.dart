class ListNode {
  int val;
  ListNode? next;

  ListNode(this.val, [this.next]);
}

ListNode? arrayToLinkedList(List<int> array) {
  if (array.isEmpty) {
    return null;
  }

  ListNode? head;
  ListNode? current;

  for (int i = 0; i < array.length; i++) {
    ListNode newNode = ListNode(array[i]);

    if (head == null) {
      head = newNode;
      current = head;
    } else {
      current!.next = newNode;
      current = current.next;
    }
  }

  return head;
}

void printLinkedList(ListNode? head) {
  while (head != null) {
    print(head.val);
    head = head.next;
  }
}

void main() {
  List<int> array = [1, 2, 3, 4, 5];

  // Convert array to linked list
  ListNode? linkedList = arrayToLinkedList(array);

  // Print the linked list
  printLinkedList(linkedList);
}
