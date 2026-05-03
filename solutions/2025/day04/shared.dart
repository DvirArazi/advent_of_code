import 'dart:math';

import '../../shared.dart';

typedef Layout = List<List<String>>;

bool isFree(Layout layout, Point<int> p) {
  if (!isRoll(layout, p)) return false;

  int count = 0;
  for (var dir in intercarinals) {
    if (isRoll(layout, p + dir)) count++;
  }

  return count < 4;
}

bool isRoll(Layout layout, Point<int> p) {
  if (p.y < 0 || p.y >= layout.length || p.x < 0 || p.x >= layout[0].length) {
    return false;
  }
  return layout[p.y][p.x] == '@';
}
