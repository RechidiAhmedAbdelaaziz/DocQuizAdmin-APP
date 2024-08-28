extension UniqList<T> on List<T> {
  void addUniq(T value) {
    contains(value) ? this[indexOf(value)] = value : add(value);
  }

  void addAllUniq(List<T> values) {
    for (var value in values) {
      addUniq(value);
    }
  }
}
