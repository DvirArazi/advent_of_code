extension IterableExt<T, E> on Iterable<Map<T, E>> {
  Map<T, E> toMap() {
    final Map<T, E> map = {};

    for (final item in this) {
      map.addAll(item);
    }

    return map;
  }
}