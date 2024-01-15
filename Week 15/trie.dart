class Node {
  Map<String, Node> childern = {};
  bool end = false;
}

class Trie {
  Node root = Node();
  void insert(String val) {
    Node curr = root;
    for (int i = 0; i < val.length; i++) {
      String char = val[i];
      curr.childern.putIfAbsent(char, () => Node());
      curr = curr.childern[char]!;
    }
    curr.end = true;
  }

  bool search(String word) {
    Node? node = getNode(word);
    return node != null && node.end;
  }

  bool startWith(String word) {
    Node? node = getNode(word);
    return node != null;
  }

  Node? getNode(String word) {
    Node node = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!node.childern.containsKey(char)) {
        return null;
      }
      node = node.childern[char]!;
    }
    return node;
  }
}

void main() {
  Trie de = Trie();
  de.insert('malayalam');
  print('${de.search('malayalam')}');
  print('${de.startWith('malam')}');
}
