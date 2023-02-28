extension ListExt<T> on List<T> {
  int? tryIndexOf(T value) {
    final index = indexOf(value);
    return index == -1 ? null : index;
  }

  T? find(bool Function(T) condition) {
    for (final value in this) {
      if (condition(value)) return value;
    }

    return null;
  }
}