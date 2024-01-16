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
      node.value = _findMinValue(node.right);

      node.right = _removeRecursive(node.right, node.value);
    }

    return node;
  }

  int _findMinValue(TreeNode? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node.value;
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

  ///findClosestNode
  int findClosestNode(int val) {
    if (root == null) {
      print('Root is empty');
      return -1;
    }
    return _findClosestNode(root, val, root)!.value;
  }

  TreeNode? _findClosestNode(TreeNode? node, int target, TreeNode? closest) {
    if (node == null) {
      return closest;
    }

    if (node.value == target) {
      return node;
    }

    if (closest == null ||
        (node.value - target).abs() < (closest.value - target).abs()) {
      closest = node; // Update closest node if the current node is closer
    }

    if (target < node.value) {
      return _findClosestNode(node.left, target, closest);
    } else {
      return _findClosestNode(node.right, target, closest);
    }
  }

  // Check if a tree is a Binary Search Tree (BST)
  void yes() {
    print('Is the tree BST or not: ${bstOrNot(root)}');
  }

  bool bstOrNot(TreeNode? root) {
    int? prevValue;

    bool inOrder(TreeNode? node) {
      if (node != null) {
        if (!inOrder(node.left)) {
          return false;
        }

        if (prevValue != null && node.value <= prevValue!) {
          print('It is not a BST');
          return false;
        }

        prevValue = node.value;
        if (!inOrder(node.right)) {
          return false;
        }
      }
      return true;
    }

    bool isBST = inOrder(root);
    if (isBST) {
      print('It is a BST');
    }
    return isBST;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);
  bst.remove(15);

  // print("In-order traversal before removal:");
  // bst.yes();
  // print('cloeset element of 15: ${bst.findClosestNode(4)}');
  // bst.remove(5);

  // print("\nIn-order traversal after removal:");
  bst.inOrderTraversal();
}
