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
    if (node == null) return Node(val);

    if (val < node.val) {
      node.left = _insert(val, node.left);
    } else {
      node.right = _insert(val, node.right);
    }
    return node;
  }

  void search(int val) {
    print('$val element is  ${_search(val, root)}');
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
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.val = _find(node.right);
      node.right = _delect(val, node.right);
    }
    return node;
  }

  int _find(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node.val;
  }

  void preOrder() {
    print('PreOrder');
    _preOrder(root);
  }

  void _preOrder(Node? node) {
    if (node != null) {
      print(node.val);
      _preOrder(node.left);
      _preOrder(node.right);
    }
  }

  void inOrder() {
    print('InOrder');
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
    print('PostOrder');
    _postOrder(root);
  }

  void _postOrder(Node? node) {
    if (node != null) {
      _postOrder(node.left);
      _postOrder(node.right);
      print(node.val);
    }
  }
}

void main() {
  BST bts = BST();
  bts.insert(10);
  bts.insert(5);
  bts.insert(8);
  bts.insert(3);
  bts.insert(9);
  bts.insert(4);
  // bts.delect(9);
  // bts.preOrder();
  // bts.inOrder();
  // bts.postOrder();
  bts.search(100);
}
