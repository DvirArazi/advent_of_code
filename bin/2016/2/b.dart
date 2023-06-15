import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void main() {
  const map = [
    "  1  ",
    " 234 ",
    "56789",
    " ABC ",
    "  D  "
  ];

  final lines = File('${getPath()}/input.txt').readAsLinesSync();
  var cursor = Int2D(0, 2);
  var code = "";

  for (var line in lines) {
    for (var dir in line.chars) {
      final step = switch (dir) {
        'U' => Int2D(0, -1),
        'D' => Int2D(0, 1),
        'L' => Int2D(-1, 0),
        _ => Int2D(1, 0)
      };
      final Int2D cursorPotential = cursor + step;

      if (
        cursorPotential.a < 0 || cursorPotential.a >= map[0].length ||
        cursorPotential.b < 0 || cursorPotential.b >= map.length  
      ) continue;

      final key = map[cursorPotential.b][cursorPotential.a];

      if (key != ' ') {
        cursor = cursorPotential;
      }
    }

    code += map[cursor.b][cursor.a];
  } 

  print(code);
}