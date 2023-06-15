import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() {
  final triangles = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((line) => line
      .split(' ')
      .where((e) => e.isNotEmpty)
      .map((side) => int.tryParse(side)!)
      .toList()
    )
    .toList();

  var count = 0;

  for (var triangle in triangles) {
    if (
      triangle[0] + triangle[1] > triangle[2] &&
      triangle[1] + triangle[2] > triangle[0] &&
      triangle[2] + triangle[0] > triangle[1]
    ) count++;
  }

  print(count);
}