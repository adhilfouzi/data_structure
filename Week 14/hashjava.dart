class Node {
  String key;
  String val;
  Node? next;

  Node(this.key, this.val);
}

class HashTable {
  late List<Node?> table;
  late int size;

  HashTable(int size) {
    this.table = List.filled(size, null);
    this.size = size;
  }

  int hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % this.size;
  }

  void set(String key, String val) {
    Node node = Node(key, val);
    int index = hash(key);
    print('indedx $index');
    if (table[index] == null) {
      table[index] = node;
    } else {
      Node? cur = table[index];

      while (cur != null) {
        if (cur.key == key) {
          cur.val = val;
          return;
        }
        cur = cur.next;
      }

      node.next = table[index];
      table[index] = node;
    }
  }

  void get(String key) {
    int index = hash(key);
    Node? bucket = table[index];

    if (bucket == null) {
      print("Invalid key !");
    } else {
      Node? cur = table[index];
      while (cur != null) {
        print("${cur.key}: ${cur.val}");
        cur = cur.next;
      }
    }
  }

  void remove(String key) {
    int index = hash(key);
    Node? bucket = table[index];

    if (bucket == null) {
      print("Invalid key !");
    } else {
      Node? cur = table[index];

      if (cur!.key == key) {
        table[index] = cur.next;
      } else {
        while (cur!.next != null) {
          if (cur.next!.key == key) {
            cur.next = cur.next!.next;
            return;
          }
          cur = cur.next;
        }
        print("Key not found!");
      }
    }
  }
}

void main() {
  HashTable hashTable = HashTable(5);

  hashTable.set("name", "rai");
  hashTable.set("mane", "gopi");
  hashTable.set("age", "15");
  hashTable.get("mane");
}
