extension ListExt on List<int> {
  int get max {
    var max = this[0];

    for (final item in sublist(1)) {
      if (max < item) max = item;
    }

    return max;
  }
}