void main() {
  // Creating a Map
  Map<String, String> fruitMap = {
    'apple': 'red',
    'banana': 'yellow',
    'grape': 'purple',
  };

  // Displaying the original map
  print('Original Map: $fruitMap');

  // Adding a new entry
  fruitMap['orange'] = 'orange';

  // Displaying the map after adding a new entry
  print('Map after adding orange: $fruitMap');

  // Deleting an entry
  fruitMap.remove('banana');

  // Displaying the map after deleting banana
  print('Map after removing banana: $fruitMap');

  // Replacing the value of an existing key
  fruitMap['grape'] = 'green';

  // Displaying the map after replacing the value of grape
  print('Map after replacing grape with green: $fruitMap');
}
