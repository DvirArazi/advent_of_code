import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void main() {
  final lines = File('${getPath()}/input.txt').readAsLinesSync();
  var cursor = Int2D(1, 1);
  var code = "";

  for (var line in lines) {
    for (var dir in line.chars) {
      cursor += switch (dir) {
        'U' => Int2D(0, -1),
        'D' => Int2D(0, 1),
        'L' => Int2D(-1, 0),
        _ => Int2D(1, 0)
      };
      switch (cursor.a) {
        case < 0: cursor.a = 0;
        case > 2: cursor.a = 2; 
      }
      switch (cursor.b) {
        case < 0: cursor.b = 0;
        case > 2: cursor.b = 2; 
      }
    }

    code += (cursor.a + 1 + cursor.b * 3).toString();
  }

  print(code);
}