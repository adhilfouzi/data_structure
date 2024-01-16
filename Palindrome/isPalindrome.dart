bool isPalindrome(String str) {
  bool isAlphanumeric(String char) {
    return RegExp(r'[a-zA-Z0-9]').hasMatch(char);
  }

  int start = 0;
  int end = str.length - 1;

  while (start < end) {
    // Skip non-alphanumeric characters from the start
    while (start < end && !isAlphanumeric(str[start])) {
      start++;
    }

    // Skip non-alphanumeric characters from the end
    while (start < end && !isAlphanumeric(str[end])) {
      end--;
    }

    // Compare the characters (case-insensitive)
    if (str[start].toLowerCase() != str[end].toLowerCase()) {
      return false; // Characters are not equal, not a palindrome
    }

    start++;
    end--;
  }

  return true; // All characters matched, it's a palindrome
}

void main() {
  String palindromeStr = "A man, a plan, a canal: Panama";
  String nonPalindromeStr = "Hello, World!";

  print('Is "$palindromeStr" a palindrome? ${isPalindrome(palindromeStr)}');
  print(
      'Is "$nonPalindromeStr" a palindrome? ${isPalindrome(nonPalindromeStr)}');
}
