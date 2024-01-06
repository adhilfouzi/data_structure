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
    int ind = key.hashCode % size;
    Node? newvalu = Node(key, value);
    if (table[ind] == null) {
      table[ind] = newvalu;
    } else {
      newvalu.next = table[ind];
      table[ind] = newvalu;
    }
  }

  void get(String key) {
    int ind = key.hashCode % size;
    if (table[ind] == null) {
      print('invaild key');
    } else {
      Node? curr = table[ind];
      while (curr != null) {
        if (curr.key == key) {
          print('${curr.key}: ${curr.value}');
          return;
        }
        curr = curr.next;
      }
      print('key not found');
    }
  }
}

void main() {
  HashTable lst = HashTable(5);
  lst.add('1', 'ajmal');
  lst.add('2', 'arshak');
  lst.add('3', 'arjun');
  lst.add('4', 'ravi');
  lst.get('1');
}
