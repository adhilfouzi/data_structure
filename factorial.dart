int sum(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n + sum(n - 1);
  }
}

void main() {
  int num = 5;
  int result = sum(num);
  print('Sum of numbers from 1 to $num is: $result');
}
