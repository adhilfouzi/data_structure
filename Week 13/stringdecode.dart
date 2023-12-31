class CaesarCipher {
  String encrypt(String str, int key) {
    int newKey = key % 26;
    List<String> charArray = [];

    for (var i = 0; i < str.length; i++) {
      int charCode = str.codeUnitAt(i);

      if ((charCode >= 97 && charCode <= 122) ||
          (charCode >= 65 && charCode <= 90)) {
        // Alphabetic letters
        int base = charCode >= 97 ? 97 : 65;
        charArray
            .add(String.fromCharCode((charCode + newKey - base) % 26 + base));
      } else if (charCode >= 48 && charCode <= 57) {
        // Digits (0-9)
        charArray.add(String.fromCharCode((charCode + newKey - 48) % 10 + 48));
      } else {
        // Non-alphabetic characters
        charArray.add(str[i]);
      }
    }

    return charArray.join();
  }

  String decrypt(String str, int key) {
    int newKey = key % 26;
    List<String> charArray = [];

    for (var i = 0; i < str.length; i++) {
      int charCode = str.codeUnitAt(i);

      if ((charCode >= 97 && charCode <= 122) ||
          (charCode >= 65 && charCode <= 90)) {
        // Alphabetic letters
        int base = charCode >= 97 ? 97 : 65;
        charArray.add(
            String.fromCharCode((charCode - newKey - base + 26) % 26 + base));
      } else if (charCode >= 48 && charCode <= 57) {
        // Digits (0-9)
        charArray
            .add(String.fromCharCode((charCode - newKey - 48 + 10) % 10 + 48));
      } else {
        // Non-alphabetic characters
        charArray.add(str[i]);
      }
    }

    return charArray.join();
  }
}

void main() {
  CaesarCipher cipher = CaesarCipher();

  String plaintext = 'abc XYZ 123';
  int key = 2;

  String ciphertext = cipher.encrypt(plaintext, key);
  print('Encrypted: $ciphertext');

  String decryptedText = cipher.decrypt(ciphertext, key);
  print('Decrypted: $decryptedText');
}
