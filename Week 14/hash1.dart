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

  void set(String key, value) {
    int index = key.hashCode % size;
    Node? newvalue = Node(key, value);
    if (table[index] == null) {
      table[index] = newvalue;
    } else {
      Node? curr = table[index];
      while (curr != null) {
        if (curr.key == key) {
          curr.value = value;
          return;
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
      print('invaild');
    } else {
      Node? curr = table[index];
      if (curr!.key == key) {
        table[index] = curr.next;
      } else {
        while (curr!.next != null) {
          if (curr.next!.key == key) {
            curr.next = curr.next!.next;
            return;
          }
          curr = curr.next;
        }
        print('key not found');
      }
    }
  }

  void get(String key) {
    int index = key.hashCode % size;
    Node? curr = table[index];
    if (curr == null) {
      print('invaild key');
      return;
    } else {
      while (curr != null) {
        if (curr.key == key) {
          print('element is ${curr.key}: ${curr.value}');
          return;
        }
        curr = curr.next;
      }
    }
  }

  void getall() {
    for (int i = 0; i < table.length; i++) {
      Node? curr = table[i];
      if (table[i] != null) {
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
  lst.set('aju', 12);
  lst.set('raji', 10);
  lst.set('appu', 15);
  lst.set('ninu', 18);
  lst.get('appu');
  lst.getall();
}
