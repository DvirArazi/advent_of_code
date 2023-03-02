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

  int? findI(bool Function(T) condition) {
    for (var i = 0; i < length; i++) {
      if (condition(this[i])) return i;
    }

    return null;
  }

  List<T> sub(int start, int end) {
    return sublist(
      start,
      end >= 0 ? end : length + end
    );
  }
}