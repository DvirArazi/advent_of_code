import 'dart:math';

import '../../shared.dart';
import 'shared.dart';

Object solve(String input) {
  final layout = input
      .trim()
      .split('\n')
      .map((line) => line.split(''))
      .toList();

  final count = removeAll(layout);

  return count;
}

int removeAll(Layout layout) {
  var count = 0;

  while (true) {
    var added = 0;
    for (var y = 0; y < layout.length; y++) {
      for (var x = 0; x < layout[0].length; x++) {
        added += removeAround(layout, Point(x, y));
      }
    }

    if (added == 0) break;

    count += added;
  }

  return count;
}

int removeAround(Layout layout, Point<int> p) {
  var count = 0;

  for (var dir in intercarinals) {
    final i = p + dir;

    if (isFree(layout, i)) {
      layout[i.y][i.x] = '.';
      count += 1 + removeAround(layout, p);
    }
  }

  return count;
}
