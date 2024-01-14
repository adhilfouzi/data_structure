class TrieNode {
  bool isEndOfWord = false;
  Map<String, TrieNode> children = {};
}

class Trie {
  TrieNode root = TrieNode();

  // Insert a word into the Trie
  void insert(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      current.children.putIfAbsent(char, () => TrieNode());
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  // Search for a word in the Trie
  bool search(String word) {
    TrieNode? node = getNode(word);
    return node != null && node.isEndOfWord;
  }

  // Check if any word in the Trie starts with a given prefix
  bool startsWith(String prefix) {
    TrieNode? node = getNode(prefix);
    return node != null;
  }

  // Helper function to get the TrieNode corresponding to a given word
  TrieNode? getNode(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        return null; // The word is not in the Trie
      }
      current = current.children[char]!;
    }
    return current;
  }

  // Delete a word from the Trie
  void delete(String word) {
    deleteHelper(root, word, 0);
  }

  // Helper function for delete operation
  bool deleteHelper(TrieNode? node, String word, int depth) {
    if (node == null) {
      return false;
    }

    if (depth == word.length) {
      if (node.isEndOfWord) {
        node.isEndOfWord = false;
        // If the current node has no other children, it can be deleted
        return node.children.isEmpty;
      }
      return false;
    }

    String char = word[depth];
    bool shouldDeleteCurrentNode =
        deleteHelper(node.children[char]!, word, depth + 1);

    // If true is returned, delete the child node and remove the mapping
    if (shouldDeleteCurrentNode) {
      node.children.remove(char);
      // If the current node has no other children and is not the end of a word, it can be deleted
      return node.children.isEmpty && !node.isEndOfWord;
    }

    return false;
  }
}

void main() {
  Trie trie = Trie();

  // Insert words into the Trie
  trie.insert("apple");
  trie.insert("app");
  trie.insert("application");
  trie.insert("banana");

  // Search for words in the Trie
  print("Search 'app': ${trie.search("app")}"); // true
  print("Search 'appl': ${trie.search("appl")}"); // false

  // Check if any word starts with a given prefix
  print("Starts with 'ban': ${trie.startsWith("ban")}"); // true
  print("Starts with 'bat': ${trie.startsWith("le")}"); // false

  // Delete a word from the Trie
  trie.delete("app");
  print("Search 'app': ${trie.search("app")}"); // false
}
