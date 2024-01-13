class Node {
  int val;
  Node? left, right;
  Node(this.val);
}

class BST {
  Node? root;
  void insert(int val) {
    root = _insert(val, root);
  }

  Node? _insert(int val, Node? node) {
    if (node == null) {
      return Node(val);
    }
    if (node.val > val) {
      node.left = _insert(val, node.left);
    } else if (node.val <= val) {
      node.right = _insert(val, node.right);
    }
    return node;
  }

  void pre() {
    _pre(root);
  }

  void _pre(Node? node) {
    if (node != null) {
      print(node.val);
      _pre(node.left);
      _pre(node.right);
    }
  }

  void inOrder() {
    _inOrder(root);
  }

  void _inOrder(Node? node) {
    if (node != null) {
      _inOrder(node.left);
      print(node.val);
      _inOrder(node.right);
    }
  }

  void postOrder() {
    _postOrder(root);
  }

  void _postOrder(Node? node) {
    if (node != null) {
      _postOrder(node.left);
      _postOrder(node.right);
      print(node.val);
    }
  }

  void search(int val) {
    print('$val element in tree is ${_search(val, root)}');
  }

  bool _search(int val, Node? node) {
    if (node == null) return false;
    if (node.val == val) {
      return true;
    } else if (node.val > val) {
      return _search(val, node.left);
    } else {
      return _search(val, node.right);
    }
  }

  void delect(int val) {
    root = _delect(val, root);
  }

  Node? _delect(int val, Node? node) {
    if (node == null) {
      return null;
    }
    if (node.val > val) {
      node.left = _delect(val, node.left);
    } else if (node.val < val) {
      node.right = _delect(val, node.right);
    } else {
      if (node.left == null) {
        return node.left;
      } else if (node.right == null) {
        return node.right;
      }
      node.val = _find(node.right);
      node.right = _delect(node.val, node.right);
    }
    return node;
  }

  int _find(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node.val;
  }
}

void main() {
  BST tree = BST();
  tree.insert(5);
  tree.insert(10);
  tree.insert(8);
  tree.insert(3);
  tree.insert(1);
  tree.insert(7);
  tree.search(13);

  tree.postOrder();
}
