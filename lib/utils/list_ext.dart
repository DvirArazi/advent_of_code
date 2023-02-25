extension ListExt<T> on List<T> {
  int? tryIndexOf(T value) {
    final index = indexOf(value);
    return index == -1 ? null : index;
  }
}