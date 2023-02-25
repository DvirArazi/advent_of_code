extension ListOfListExt<T> on List<List<T>> {
  List<T> combine() {
    final List<T> list = [];

    for (final crnt in this) {
      list.addAll(crnt);
    }

    return list;
  }
}