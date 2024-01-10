class TreeNode {
  late int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int value) {
    root = _insertRecursive(root, value);
  }

  TreeNode? _insertRecursive(TreeNode? node, int value) {
    if (node == null) {
      return TreeNode(value);
    }

    if (value < node.value) {
      node.left = _insertRecursive(node.left, value);
    } else if (value > node.value) {
      node.right = _insertRecursive(node.right, value);
    }

    return node;
  }

  bool search(int value) {
    return _searchRecursive(root, value);
  }

  bool _searchRecursive(TreeNode? node, int value) {
    if (node == null) {
      return false;
    }

    if (value == node.value) {
      return true;
    } else if (value < node.value) {
      return _searchRecursive(node.left, value);
    } else {
      return _searchRecursive(node.right, value);
    }
  }

  void remove(int value) {
    root = _removeRecursive(root, value);
  }

  TreeNode? _removeRecursive(TreeNode? node, int value) {
    if (node == null) {
      return null;
    }

    if (value < node.value) {
      node.left = _removeRecursive(node.left, value);
    } else if (value > node.value) {
      node.right = _removeRecursive(node.right, value);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
// Add the non-null assertion operator (!)
      node.value = _findMinValue(node.right)!;

      node.right = _removeRecursive(node.right, node.value);
    }

    return node;
  }

  int? _findMinValue(TreeNode? node) {
    while (node?.left != null) {
      node = node!.left;
    }
    return node?.value;
  }

  void preOrderTraversal() {
    _preOrderTraversal(root);
  }

  void _preOrderTraversal(TreeNode? node) {
    if (node != null) {
      print(node.value);
      _preOrderTraversal(node.left);
      _preOrderTraversal(node.right);
    }
  }

  void inOrderTraversal() {
    _inOrderTraversal(root);
  }

  void _inOrderTraversal(TreeNode? node) {
    if (node != null) {
      _inOrderTraversal(node.left);
      print(node.value);
      _inOrderTraversal(node.right);
    }
  }

  void postOrderTraversal() {
    _postOrderTraversal(root);
  }

  void _postOrderTraversal(TreeNode? node) {
    if (node != null) {
      _postOrderTraversal(node.left);
      _postOrderTraversal(node.right);
      print(node.value);
    }
  }

  //closest value
  int closestValue(int target) {
    if (root == null) {
      print('BST is empty');
      return -1;
    }

    TreeNode? current = root;
    int closest = current!.value;

    while (current != null) {
      if ((target - closest).abs() > (target - current.value).abs()) {
        closest = current.value;
      }

      if (target < current.value) {
        current = current.left;
      } else if (target > current.value) {
        current = current.right;
      } else {
        break;
      }
    }

    return closest;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print("In-order traversal before removal:");
  bst.preOrderTraversal();
  print('cloeset element of 15: ${bst.closestValue(15)}');
  // bst.remove(5);

  // print("\nIn-order traversal after removal:");
  // bst.inOrderTraversal();
}
