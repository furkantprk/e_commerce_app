import 'package:hive/hive.dart';

class HiveManager<T> {
  final String boxName;

  HiveManager(this.boxName);

  Box<T> get _box => Hive.box<T>(boxName);

  Future<void> addItem(String key, T item) async {
    await _box.put(key, item);
  }

  T? getItem(String key) {
    return _box.get(key);
  }

  List<T> getAllItems() {
    return _box.values.toList();
  }

  Future<void> deleteItem(String key) async {
    await _box.delete(key);
  }

  Future<void> clearBox() async {
    await _box.clear();
  }
}
