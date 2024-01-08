class Node {
  late int data;
  Node? left;
  Node? right;

  Node(int data) {
    this.data = data;
    this.left = null;
    this.right = null;
  }
}

Node? insert(Node? node, int data) {
  if (node == null) {
    return Node(data);
  }
  if (data < node.data) {
    node.left = insert(node.left, data);
  }
  if (data > node.data) {
    node.right = insert(node.right, data);
  }
  return node;
}

Node? deleteNode(Node? root, int val) {
  if (root == null) {
    print("Tree is empty...");
  } else {
    if (val < root.data) {
      root.left = deleteNode(root.left, val);
    } else if (val > root.data) {
      root.right = deleteNode(root.right, val);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.data = findMinNode(root.right!).data;
      root.right = deleteNode(root.right, root.data);
    }
  }
  return root;
}

Node findMinNode(Node root) {
  while (root.left != null) {
    root = root.left!;
  }
  return root;
}

void inorder(Node? root, List<int> arr) {
  if (root != null) {
    inorder(root.left, arr);
    arr.add(root.data);
    inorder(root.right, arr);
  }
}

void validate(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      print("Not a Binary Tree...");
      return;
    }
  }
  print("Given tree is a Binary Tree...");
}

void closest(Node? root, int val) {
  if (root != null) {
    if (val < root.data) {
      closest(root.left, val);
    }
    if (val > root.data) {
      closest(root.right, val);
    }
    if (val == root.data) {
      if (root.left != null) {
        print("Closest of ${root.data} : ${root.left!.data}");
        return;
      }
      if (root.right != null) {
        print("Closest ${root.data} : ${root.right!.data}");
        return;
      }
    }
  }
}

void main() {
  Node? root;
  root = insert(root, 39);
  root = insert(root, 19);
  root = insert(root, 49);
  root = insert(root, 40);
  root = insert(root, 50);
  root = insert(root, 18);
  root = insert(root, 20);

  root = deleteNode(root, 19);

  List<int> arr = [];
  inorder(root, arr);
  print(arr);

  validate(arr);
  closest(root, 19);
}
