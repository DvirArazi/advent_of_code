import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void main() async {
  final instructions = File("${getPath()}/input.txt")
    .readAsStringSync()
    .split(', ');

  var pos = Int2D(0, 0);
  var dir = 0;

  for (var instruction in instructions) {
    dir = (dir + (instruction[0] == 'L' ? -1 : 1)) % 4;
    final steps = int.tryParse(instruction.sub(1))!;

    switch (dir) {
      case 0: pos.a += steps;
      case 1: pos.b += steps;
      case 2: pos.a -= steps;
      case 3: pos.b -= steps;
    }
  }

  print(pos.a.abs() + pos.b.abs());
}