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
  void add(String key, valuue) {
    Node? newval = Node(key, valuue);
    int ind = key.hashCode % size;
    if (table[ind] == null) {
      table[ind] = newval;
    } else {
      Node? curr = table[ind];
      while (curr != null) {
        if (curr.key == key) {
          curr.value = valuue;
          return;
        }
        curr = curr.next;
      }
      newval.next = table[ind];
      table[ind] = newval;
    }
  }

  void remove(String key) {
    int ind = key.hashCode % size;
    if (table[ind] == null) {
      print('invaild key');
    } else {
      Node? curr = table[ind];
      if (curr!.key == key) {
        table[ind] = curr.next;
      } else {
        while (curr!.next == null) {
          if (curr.next!.key == key) {
            curr.next = curr.next!.next;
            return;
          }
          curr = curr.next;
        }
        print('key not fund');
      }
    }
  }

  void getall() {
    for (int i = 0; i < table.length; i++) {
      if (table[i] != null) {
        Node? curr = table[i];
        if (curr!.next == null) {
          print('${curr.key}: ${curr.value}');
        } else {
          while (curr != null) {
            print('${curr.key}: ${curr.value}');
            curr = curr.next;
          }
        }
      }
    }
  }
}

void main() {
  HashTable lst = HashTable(4);
  lst.add('1', 'ajmal');
  lst.add('2', 'arshak');
  lst.add('3', 'amal');
  lst.remove('2');
  lst.getall();
}
