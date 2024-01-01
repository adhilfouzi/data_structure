class CMap {
  List<String> keys = [];
  List<String> values = [];
  void add(String key, String value) {
    int index = keys.indexOf(key);
    if (index != -1) {
      values[index] = value;
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
      print('please recheck the value');
    }
  }

  void replace(String key, String value) {
    int index = keys.indexOf(key);
    if (index != -1) {
      values[index] = value;
    } else {
      print('please recheck the value');
    }
  }

  void display() {
    if (keys.isEmpty) {
      print('No values');
      return;
    } else {
      for (var i = 0; i < values.length; i++) {
        print('${keys[i]}: ${values[i]}');
      }
    }
  }
}

void main() {
  CMap list = CMap();
  list.add('name', 'sayand');
  list.add('week', '15');
  list.add('Domain', 'MERN');
  list.replace('week', '16');
  list.remove('Domain');
  list.display();
}
