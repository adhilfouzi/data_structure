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
    } else {
      node.right = _insert(val, node.right);
    }
    return node;
  }

  void search(int val) {
    print('the element $val was ${_search(val, root)}');
  }

  bool _search(int val, Node? node) {
    if (node == null) return false;

    if (node.val == val) {
      return true;
    } else if (val < node.val) {
      return _search(val, node.left);
    } else {
      return _search(val, node.right);
    }
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

  void delect(int val) {
    root = _delect(val, root);
  }

  Node? _delect(int val, Node? node) {
    if (node == null) {
      return null;
    }
    if (val < node.val) {
      node.left = _delect(val, node.left);
    } else if (val > node.val) {
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
    while (node!.left == null) {
      node = node.left;
    }
    return node.val;
  }
}

void main() {
  BST bst = BST();
  bst.insert(5);
  bst.insert(7);
  bst.insert(9);
  bst.insert(8);
  bst.insert(2);
  bst.insert(1);
  bst.insert(3);
  bst.insert(6);
  bst.insert(0);

  bst.inOrder();
  bst.postOrder();
  bst.preOrder();
  bst.delect(6);
  bst.search(6);
}
