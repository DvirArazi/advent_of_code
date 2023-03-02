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
  grid0[0][0] = true;
  grid0[grid0.length - 1][0] = true;
  grid0[0][grid0[0].length - 1] = true;
  grid0[grid0.length - 1][grid0[0].length - 1] = true;
  
  var grid1 = List.generate(grid0.length, (x) => 
    List.generate(grid0[0].length, (y) =>
      getLightNewState(grid0, x, y)
    )
  );
  grid1[0][0] = true;
  grid1[grid0.length - 1][0] = true;
  grid1[0][grid0[0].length - 1] = true;
  grid1[grid0.length - 1][grid0[0].length - 1] = true;

  var isGrid0Crnt = false;
  for (var i = 1;; i++) {
    final gridCrnt = isGrid0Crnt ? grid0 : grid1;
    final gridNext = isGrid0Crnt ? grid1 : grid0;
    for (var x = 1; x < grid0.length - 1; x++) {
      for (var y = 0; y < grid0[0].length; y++) {
        gridNext[x][y] = getLightNewState(gridCrnt, x, y);
      }
    }
    for (var y = 1; y < grid0[0].length - 1; y++) {
      gridNext[0][y] = getLightNewState(gridCrnt, 0, y);
      gridNext[grid0.length - 1][y] = 
        getLightNewState(gridCrnt, grid0.length - 1, y);
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