import 'dart:math';

import 'shared.dart';

Object solve(String input) {
  final layout = input
      .trim()
      .split('\n')
      .map((line) => line.split(''))
      .toList();

  var count = 0;

  for (var y = 0; y < layout.length; y++) {
    for (var x = 0; x < layout[0].length; x++) {
      if (isFree(layout, Point(x, y))) count++;
    }
  }

  return count;
}
