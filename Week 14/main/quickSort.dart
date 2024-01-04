List<int> quickSort(List<int> arr) {
  quickSortHelper(arr, 0, arr.length - 1);
  return arr;
}

void quickSortHelper(List<int> arr, int startIndex, int endIndex) {
  // Base case: If startIndex is greater than or equal to endIndex, return
  if (startIndex >= endIndex) {
    return;
  }

  // Choose the middle element as the pivot
  int pivotIndex = (startIndex + endIndex) ~/ 2;
  print(pivotIndex);
  // Partitioning
  int left = startIndex;
  int right = endIndex;

  while (left <= right) {
    // Move left pointer to the right while the element at left is less than the pivot
    while (arr[left] < arr[pivotIndex]) {
      left++;
    }

    // Move right pointer to the left while the element at right is greater than the pivot
    while (arr[right] > arr[pivotIndex]) {
      right--;
    }

    // Swap elements if left pointer is less than or equal to right pointer
    if (left <= right) {
      swap(arr, left, right);
      left++;
      right--;
    }
  }

  // Recursively sort the subarrays on the left and right of the pivot
  quickSortHelper(arr, startIndex, right);
  quickSortHelper(arr, left, endIndex);
}

void swap(List<int> arr, int i, int j) {
  // Swap elements at indices i and j in the array
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

void main() {
  List<int> arr = [2, 1, 5, 3, 6, 9];
  print("Unsorted array: $arr");

  // Call the quickSort function
  quickSort(arr);

  print("Sorted array: $arr");
}
