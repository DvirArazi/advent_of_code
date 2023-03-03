import 'package:advent_of_code/utils/list_ext.dart';

extension ListExt on List<int> {
  int get max {
    var max = this[0];

    for (final item in sub(1)) {
      if (max < item) max = item;
    }

    return max;
  }

  int get min {
    var min = this[0];

    for (final item in sub(1)) {
      if (min > item) min = item;
    }

    return min;
  }
}