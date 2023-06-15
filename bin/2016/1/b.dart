import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void main() async {
  final instructions = File("${getPath()}/input.txt")
    .readAsStringSync()
    .split(', ');

  var poss = [Int2D(0, 0)];
  var dir = 0;

  Int2D? posTwice;

  label: for (var instruction in instructions) {
    dir = (dir + (instruction[0] == 'L' ? -1 : 1)) % 4;
    final stepsC = int.tryParse(instruction.sub(1))!;

    final step = switch (dir) {
      0 => Int2D(1, 0),
      1 => Int2D(0, 1),
      2 => Int2D(-1, 0),
      _ => Int2D(0, -1),
    };

    for (var i = 0; i < stepsC; i++) {
      final posNew = poss.last + step;
      if (poss.contains(posNew)) {
        posTwice = posNew;
        break label;
      }
      poss.add(poss.last + step);
    }
  }

  print(posTwice!.a.abs() + posTwice.b.abs());
}