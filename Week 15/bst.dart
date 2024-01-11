class Node {
  int val;
  Node? left, right;
  Node(this.val);
}

class BinarySearchTree {
  Node? root;
  void insert(int val) {
    root = _inserter(val, root);
  }

  Node? _inserter(int val, Node? node) {
    if (node == null) {
      return Node(val);
    }
    if (val < node.val) {
      node.left = _inserter(val, node.left);
    } else if (val > node.val) {
      node.right = _inserter(val, node.right);
    }
    return node;
  }

  void search(int val) {
    print('element is $val : ${_searchkey(val, root)}');
  }

  bool _searchkey(int val, Node? node) {
    if (node == null) {
      return false;
    }
    if (node.val == val) {
      return true;
    } else if (val < node.val) {
      return _searchkey(val, node.left);
    } else {
      return _searchkey(val, node.right);
    }
  }

  void per() {
    print('PreOrder');
    _pre(root);
  }

  void _pre(Node? node) {
    if (node != null) {
      print(node.val);
      _pre(node.left);
      _pre(node.right);
    }
  }

  void iner() {
    print('InOrder');

    _in(root);
  }

  void _in(Node? node) {
    if (node != null) {
      _in(node.left);
      print(node.val);
      _in(node.right);
    }
  }

  void pos() {
    print('PosOrder');
    _pos(root);
  }

  void _pos(Node? node) {
    if (node != null) {
      _pos(node.left);
      _pos(node.right);
      print(node.val);
    }
  }

  void close(int val) {
    if (root == null) {
      print('root is empty');
    }
    print('Closest element of $val : ${_close(root, val, root)!.val}');
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
}

void main() {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(5);
  tree.insert(15);
  tree.insert(12);
  tree.insert(45);
  tree.insert(85);
  tree.insert(96);
  tree.per();
  tree.iner();
  tree.pos();
  tree.close(8);
}
