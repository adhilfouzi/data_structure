void main() {
  // Sorted array
  List arr = [0, 1, 2, 3, 7, 8, 10, 11];

  // Call binary search function
  binary(8, arr);

  // Print the modified array
  print(arr);
}

void binary(int num, List array) {
  int l = 0;
  int h = array.length - 1;

  // Binary search loop
  while (l <= h) {
    int mid = (l + h) ~/ 2;

    // If the element is found, replace it with 0 and return
    if (array[mid] == num) {
      array[mid] = 0;
      print('Element $num found and replaced with 0');
      return;
    } else if (array[mid] < num) {
      l = mid + 1;
    } else {
      h = mid - 1;
    }
  }

  // If the element is not found
  print('Element $num not found in the array');
}
