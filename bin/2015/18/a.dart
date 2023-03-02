import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';

import 'tools.dart';

void main() {
  var grid0 = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((line) =>
      line.chars.map((char) => char == '#').toList()
    ).toList();
  
  var grid1 = List.generate(grid0.length, (x) => 
    List.generate(grid0[0].length, (y) =>
      getLightNewState(grid0, x, y)
    )
  );

  var isGrid0Crnt = false;
  for (var i = 1;; i++) {
    final gridCrnt = isGrid0Crnt ? grid0 : grid1;
    final gridNext = isGrid0Crnt ? grid1 : grid0;
    for (var x = 0; x < grid0.length; x++) {
      for (var y = 0; y < grid0[0].length; y++) {
        gridNext[x][y] = getLightNewState(gridCrnt, x, y);
      }
    }

    if (i == 100) break;

    isGrid0Crnt = !isGrid0Crnt;
  }

  final grid = isGrid0Crnt ? grid0 : grid1;

  var onC = 0;
  for (var x = 0; x < grid0.length; x++) {
    for (var y = 0; y < grid0[0].length; y++) {
      if (grid[x][y]) onC++;
    }
  }

  print(onC);
}