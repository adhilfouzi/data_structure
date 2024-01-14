class Node {
  Map<String, Node> children = {};
  bool end = false;
}

class Trie {
  Node root = Node();
  void insert(String word) {
    Node curr = root;
    for (int i = 0; i < word.length; i++) {
      curr.children.putIfAbsent(word[i], () => Node());
      curr = curr.children[word[i]]!;
    }
    curr.end = true;
  }

  bool search(String word) {
    Node? node = getNode(word);
    return node != null && node.end;
  }

  bool startWith(String word) {
    Node? curr = getNode(word);
    return curr != null;
  }

  Node? getNode(String word) {
    Node curr = root;
    for (int i = 0; i < word.length; i++) {
      if (!curr.children.containsKey(word[i])) {
        return null;
      }
      curr = curr.children[word[i]]!;
    }
    return curr;
  }

  void delete(String word) {
    deleter(root, word, 0);
  }

  bool deleter(Node? node, String word, int depth) {
    if (node == null) {
      return false;
    }
    if (depth == word.length) {
      if (node.end) {
        node.end = false;
        return node.children.isEmpty;
      }
      return false;
    }
    String char = word[depth];
    bool done = deleter(node.children[char], word, depth + 1);
    if (done) {
      node.children.remove(char);
      return node.children.isEmpty && !node.end;
    }
    return false;
  }
}

void main() {
  Trie trir = Trie();
  trir.insert('malayalam');
  trir.delete('malayalam');
  print(trir.search('mala'));
  print(trir.startWith('mala'));
}
