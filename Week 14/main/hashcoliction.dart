class Node {
  String key;
  dynamic data;
  Node? next;

  Node(this.key, this.data);
}

class HashTable {
  List<Node?> table = [];
  int size;

  HashTable(this.size) {
    table = List.generate(size, (index) => null); // Initialize table with nulls
  }

  void add(String key, dynamic data) {
    // An error add same value
    int index = key.hashCode % size;
    Node newNode = Node(key, data);
    if (table[index] == null) {
      table[index] = newNode;
    } else {
      newNode.next = table[index];
      table[index] = newNode; // Handle collisions using chaining
    }
  }

  void remove(String key) {
    int index = key.hashCode % size;
    if (table[index] != null) {
      if (table[index]?.next == null) {
        print('element removed :${table[index]!.key}');
        table[index] = null; // Remove single node
      } else {
        Node? temp = table[index];
        Node? prev;
        while (temp != null) {
          if (temp.key == key) {
            print('removed ${temp.key}');
            prev!.next = temp.next; // Remove node within chain
            return;
          }
          prev = temp;
          temp = temp.next;
        }
      }
    } else {
      print('value not found');
    }
  }

  void get(String key) {
    int index = key.hashCode % size;
    if (table[index] == null) {
      print('empty');
    } else {
      print('${table[index]!.key}:${table[index]!.data}');
    }
  }

  void getAll() {
    // Print all key-value pairs in the hash table
    for (int i = 0; i < table.length; i++) {
      if (table[i] != null) {
        Node? curr = table[i];
        while (curr != null) {
          print("${curr.key}: ${curr.data}");
          curr = curr.next;
        }
      }
    }
  }

  void update(String key, dynamic newData) {
    int index = key.hashCode % size;
    Node? temp = table[index];
    while (temp != null) {
      if (temp.key == key) {
        temp.data = newData;
        print('Value updated');
        return;
      }
      temp = temp.next;
    }
    print('Value not found');
  }
}

main() {
  HashTable hashTable = HashTable(5);
  hashTable.add('sugith', 24);
  hashTable.add('sugith', 29);
  hashTable.add('ram', 21);
  hashTable.remove('fugith');
  hashTable.get('sugith');
  hashTable.getAll(); // Display all key-value pairs
}
