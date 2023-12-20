class ListNode {
  dynamic data;
  ListNode? next;
  ListNode(this.data);
}

class linkedlist {
  ListNode? head;
  void addNode(dynamic data) {
    ListNode newNode = ListNode(data);
    if (head == null) {
      head = newNode;
    } else {
      ListNode temp = head!;
      while (temp.next != null) {
        temp = temp.next!;
      }
      temp.next = newNode;
    }
  }
  ListNode? removeElements(ListNode? head, int val) {
    if(head==null)return null ;
    ListNode? curr=head;
    ListNode? pre;
    while(curr!=null){
        if(curr.data==val){
            pre!.next=curr.next;
        }else{
            pre=curr;
            
        }
        curr=curr.next;
    }
    return curr;
  }

  void delectedata(dynamic data) {
    if (head == null) {
      print("head == null");
      return;
    }
    if (head!.data == data) {
      print("head!.data == data");
      head = head!.next;
      return;
    }
    ListNode? curr = head;
    ListNode? pre;

    while (curr != null && curr.data != data) {
      pre = curr;
      curr = curr.next!;
    }
    if (curr == null) {
      print("current == null");
      return;
    }
    pre!.next = curr.next;
  }

  void printdata() {
    ListNode? temp = head;
    if (temp == null) {
      print('List is emty');
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }
}

void main() {
  linkedlist list = linkedlist();
  list.addNode(9);
  list.addNode(8);
  list.addNode(7);
  list.addNode(7);
  print("Original Linked List:");

  list.printdata();
  print("\nLinked List after deleting node with value 2:");
  list.delectedata(7);
  list.printdata();
}
