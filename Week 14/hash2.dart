class Node {
  String key;
  dynamic value;
  Node? next;
  Node(this.key, this.value);
}

class HashTable {
  List<Node?> table = [];
  int size;
  HashTable(this.size) {
    table = List.generate(size, (index) => null);
  }

  void add(String key, value) {
    int index = key.hashCode % size;
    Node? newvalue = Node(key, value);
    if (table[index] == null) {
      table[index] = newvalue;
    } else {
      Node? curr = table[index];
      while (curr != null) {
        if (curr.key == key) {
          newvalue.next = table[index];
          table[index] = newvalue;
        }
        curr = curr.next;
      }
      newvalue.next = table[index];
      table[index] = newvalue;
    }
  }

  void remove(String key) {
    int index = key.hashCode % size;
    if (table[index] == null) {
      print('invaild key');
    } else {
      Node? curr = table[index];
      if (curr!.key == key) {
        print('Removed :${curr.key}');
        table[index] = curr.next;
      } else {
        while (curr!.next != null) {
          if (curr.next!.key == key) {
            print('Removed :${curr.next!.key}');
            curr.next = curr.next!.next;
            return;
          }
          curr = curr.next;
        }
      }
    }
  }

  void get(String key) {
    int index = key.hashCode % size;
    if (table[index] == null) {
      print('invaild key');
    } else {
      Node? curr = table[index];
      while (curr != null) {
        if (curr.key == key) {
          print('${curr.key}: ${curr.value}');
          return;
        }
        curr = curr.next;
      }
      print('invaild');
    }
  }

  void getall() {
    for (int i = 0; i < table.length; i++) {
      if (table[i] != null) {
        Node? curr = table[i];
        while (curr != null) {
          print('${curr.key}:${curr.value}');
          curr = curr.next;
        }
      }
    }
  }
}

void main() {
  HashTable lst = HashTable(4);
  lst.add('arshak', 45);
  lst.add('sugith', 25);
  lst.add('sayend', 40);
  lst.add('sinan', 31);
  lst.remove('sayend');
  lst.get('sinan');
}
