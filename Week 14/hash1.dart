class Cmap {
  List<String> keys = [];
  List<String> values = [];

  void add(String key, String value) {
    int index = keys.indexOf(key);
    if (index != -1) {
      values.insert(index, value);
    } else {
      keys.add(key);
      values.add(value);
    }
  }

  void remove(String key) {
    int index = keys.indexOf(key);
    if (index != -1) {
      keys.removeAt(index);
      values.removeAt(index);
    } else {
      print('Please recheck the entred value');
    }
  }

  void replace(String value, String key) {
    int index = keys.indexOf(key);
    if (index != -1) {
      values[index] = value;
    } else {
      print('Please recheck the entred key');
    }
  }

  void display() {
    for (var i = 0; i < keys.length; i++) {
      print('${keys[i]}: ${values[i]}');
    }
  }
}

void main() {
  Cmap maps = Cmap();
  maps.add('name', 'Adhil');
  maps.add('age', '24');
  maps.add('place', 'kanthapuram');
  maps.replace('21', 'age');
  maps.display();
}
