class CustomMap {
  List<String> keys = [];
  List<String> values = [];

  void add(String key, String value) {
    // Check if the key already exists
    int index = keys.indexOf(key);
    if (index != -1) {
      // Key exists, replace the value
      values[index] = value;
    } else {
      // Key doesn't exist, add a new key-value pair
      keys.add(key);
      values.add(value);
    }
  }

  void remove(String key) {
    // Find and remove the key-value pair
    int index = keys.indexOf(key);
    if (index != -1) {
      keys.removeAt(index);
      values.removeAt(index);
    }
  }

  void display() {
    // Display all key-value pairs
    for (int i = 0; i < keys.length; i++) {
      print('${keys[i]}: ${values[i]}');
    }
  }
}

void main() {
  // Creating a CustomMap
  CustomMap fruitMap = CustomMap();

  // Displaying the original map
  print('Original Map:');
  fruitMap.display();

  // Adding a new entry or updating an existing entry
  fruitMap.add('apple', 'red');
  fruitMap.add('banana', 'yellow');
  fruitMap.add('grape', 'purple');

  // Displaying the map after adding entries
  print('\nMap after adding entries:');
  fruitMap.display();

  // Adding or updating an entry
  fruitMap.add('banana', 'green');

  // Displaying the map after adding or updating an entry
  print('\nMap after adding or updating an entry:');
  fruitMap.display();

  // Removing an entry
  fruitMap.remove('banana');

  // Displaying the map after removing an entry
  print('\nMap after removing an entry:');
  fruitMap.display();
}
