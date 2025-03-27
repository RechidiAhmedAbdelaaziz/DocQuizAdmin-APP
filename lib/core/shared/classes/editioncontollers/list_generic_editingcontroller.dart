import 'package:admin_app/core/extension/list.extension.dart';
import 'package:flutter/material.dart';

class ListEditingController<T> extends ValueNotifier<List<T>> {
  ListEditingController([List<T>? value]) : super(value ?? []);

  void addValue(T value) {
    this.value.addUniqe(value);
    notifyListeners();
  }

  void removeValue(T value) {
    this.value.remove(value);
    notifyListeners();
  }

  void replaceValue(T value) {
    this.value.replace(value);
    notifyListeners();
  }

  void replaceAt(int index, T value) {
    this.value[index] = value;
    notifyListeners();
  }

  void clear() {
    value = [];
    notifyListeners();
  }

  void addValues(List<T> values) => value.addAllUnique(values);

  void removeValues(List<T> values) =>
      value.removeWhere((element) => values.contains(element));

  void setList(List<T> value) => this.value = value;
}
