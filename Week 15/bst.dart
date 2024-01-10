class Node {
  int val;
  Node? left, right;
  Node(this.val);
}

class Bst {
  Node? root;
  //insert
  void insert(int val) {
    root = _in(root, val);
  }

  Node? _in(Node? node, int val) {
    if (node == null) {
      return Node(val);
    }

    if (val < node.val) {
      node.left = _in(node.left, val);
    } else if (node.val <= val) {
      node.right = _in(node.right, val);
    }
    return node;
  }

  //search
  bool search(int vAL) {
    return _search(root, vAL);
  }

  bool _search(Node? node, int val) {
    if (node == null) {
      return false;
    }

    if (node.val == val) {
      return true;
    } else if (val < node.val) {
      return _search(node.left, val);
    } else {
      return _search(node.right, val);
    }
  }

  //remove
  void remove(int val) {
    root = re(root, val);
  }

  Node? re(Node? node, int val) {
    if (node == null) {
      return null;
    }
    if (node.val > val) {
      node.left = re(node.left, val);
    } else if (node.val < val) {
      node.right = re(node.right, val);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.val = find(node.right)!;
      node = re(node.right, node.val);
    }
    return node;
  }

  int? find(Node? node) {
    while (node?.left != null) {
      node = node?.left;
    }
    return node?.val;
  }

//minimum
  int? minimum() {
    if (root == null) {
      empty();
      return 0;
    }
    return find(root);
  }

//findClosestNode
  int findClosestNode(int val) {
    return _findClosestNode(root, val, null)!.val;
  }

  Node? _findClosestNode(Node? node, int target, Node? closest) {
    if (node == null) {
      return closest;
    }

    if (node.val == target) {
      return node; // Exact match found
    }

    if (closest == null ||
        (node.val - target).abs() < (closest.val - target).abs()) {
      closest = node; // Update closest node if the current node is closer
    }

    if (target < node.val) {
      return _findClosestNode(node.left, target, closest);
    } else {
      return _findClosestNode(node.right, target, closest);
    }
  }

  int cloest(int target) {
    if (root == null) {
      empty();
      return -1;
    }
    Node? curr = root;
    int close = curr!.val;
    while (curr != null) {
      if ((target - close).abs() < (target - curr.val).abs()) {
        close = curr.val;
      }
      if (target < curr.val) {
        curr = curr.left;
      } else if (target > curr.val) {
        curr = curr.right;
      } else {
        break;
      }
    }
    return close;
  }

//inOrder
  void inOrder() {
    _inOr(root);
  }

  void empty() {
    if (root == null) print('Root is empty');
  }

  void _inOr(Node? node) {
    empty();
    if (node != null) {
      _inOr(node.left);
      print(node.val);
      _inOr(node.right);
    }
  }

  void preOrder() {
    _pre(root);
  }

//preOrder
  void _pre(Node? node) {
    empty();
    if (node != null) {
      print(node.val);
      _pre(node.left);
      _pre(node.right);
    }
  }

//postOrder
  void postOrder() {
    _post(root);
  }

  void _post(Node? node) {
    empty();
    if (node != null) {
      _post(node.left);
      _post(node.right);
      print(node.val);
    }
  }
}

void main() {
  Bst bst = Bst();

  bst.insert(49);
  bst.insert(44);
  bst.insert(64);
  bst.insert(74);
  bst.insert(84);
  bst.insert(94);
  bst.insert(14);
  bst.insert(24);
  bst.insert(34);
  bst.insert(44);

  print('preOrder ${bst.findClosestNode(50)}');
  print('minimum val : ${bst.cloest(50)}');
}
