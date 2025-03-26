import 'package:hive_flutter/hive_flutter.dart';

abstract class DataRepository<T> {
  final Box<T> box;

  DataRepository(this.box);

  List<T> getAll() {
    return box.values.toList();
  }

  T? getById(String id) {
    return box.get(id);
  }

  List<T> find(bool Function(T) filter) {
    return box.values.where(filter).toList();
  }

  T? findFirstOrNull(bool Function(T) filter) {
    return find(filter).firstOrNull;
  }

  void add(T item) {
    box.add(item);
  }

  void update(String id, T item) {
    box.put(id, item);
  }

  void delete(String id) {
    box.delete(id);
  }

  void clear() {
    box.clear();
  }

  void close() {
    box.close();
  }

  void listenable(List? keys) {
    box.listenable(keys: keys);
  }
}