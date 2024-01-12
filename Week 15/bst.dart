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
    if (val < node.val) {
      node.left = _insert(val, node.left);
    } else if (val > node.val) {
      node.right = _insert(val, node.right);
    }
    return node;
  }

  void isit() {
    _orNot(root);
  }

  void _orNot(Node? root) {
    int? pre;
    bool _inOrder(Node? node) {
      if (node != null) {
        if (!_inOrder(node.left)) {
          return false;
        }
        if (pre != null && node.val <= pre!) {
          return false;
        }
        pre = node.val;
        if (!_inOrder(node.right)) {
          return false;
        }
      }
      return true;
    }

    bool bts = _inOrder(root);

    if (bts) {
      print('its a BTS');
    } else {
      print('its Not a BTS');
    }
  }

  void emoty() {
    if (root == null) {
      print('root is emty');
      return;
    }
  }

  void search(int val) {
    emoty();
    print(' $val element contains : ${_search(root, val)}');
  }

  bool _search(Node? node, int val) {
    if (node == null) return false;
    if (val < node.val) {
      return _search(node.left, val);
    } else if (val > node.val) {
      return _search(node.right, val);
    } else {
      return true;
    }
  }

  void preOrder() {
    print('PreOrder');
    _preorder(root);
  }

  void _preorder(Node? node) {
    if (node != null) {
      print(node.val);
      _preorder(node.left);
      _preorder(node.right);
    }
  }

  void inOrder() {
    print('inOrder');
    _inorder(root);
  }

  void _inorder(Node? node) {
    if (node != null) {
      _inorder(node.left);
      print(node.val);
      _inorder(node.right);
    }
  }

  void postOrder() {
    print('PostOrder');
    _postorder(root);
  }

  void _postorder(Node? node) {
    if (node != null) {
      _postorder(node.left);
      _postorder(node.right);
      print(node.val);
    }
  }

  void close(int val) {
    print('closest element of $val is ${_close(root, val, root)!.val}');
  }

  Node? _close(Node? node, int val, Node? close) {
    if (node == null) return close;
    if (node.val == val) return node;
    if (close == null || (node.val - val).abs() < (close.val - val).abs()) {
      close = node;
    }
    if (val < node.val) {
      return _close(node.left, val, close);
    } else {
      return _close(node.right, val, close);
    }
  }

  void delect(int val) {
    emoty();
    root = _delect(val, root);
  }

  Node? _delect(int val, Node? node) {
    if (node == null) {
      print('value not fund');
      return null;
    }
    if (val < node.val) {
      node.left = _delect(val, node.left);
    } else if (val > node.val) {
      node.right = _delect(val, node.right);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.val = _find(node.right)!;
      node.right = _delect(node.val, node.right);
    }
    return node;
  }

  int? _find(Node? node) {
    while (node?.left != null) {
      node = node!.left;
    }
    return node!.val;
  }
}

void main() {
  BST bst = BST();
  bst.insert(4);
  bst.insert(6);
  bst.insert(3);
  bst.insert(2);
  bst.insert(1);
  bst.insert(5);
  // bst.close(-5);
  bst.isit();
  // bst.inOrder();
  // bst.postOrder();
}
