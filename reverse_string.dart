class reverseString {
  int age = 0;
  String name = '';

  void enterAge(int enterAge) {
    age = enterAge;
  }

  void enterName(String enterName) {
    name = enterName;
  }

  String reverse(String input) {
    if (input.length <= 1) return input;
    return reverse(input.substring(1)) + input[0];
  }
}

void main() {
  var reverse = reverseString();
  reverse
    ..enterAge(10)
    ..enterName('enterName');

  print(reverse.reverse('input'));
}
