import 'dart:io';

import 'package:advent_of_code/Utils/list_ext.dart';
import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() {
  final containers = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((container) => int.tryParse(container)!)
    .toList();

  final combinations = getAllCombinations(containers, 150);

  var combinationCMinC = 1;
  var combinationCMin = combinations[0].length;

  for (final combination in combinations.sub(1)) {
    if (combinationCMin > combination.length) {
      combinationCMin = combination.length;
      combinationCMinC = 1;
      continue;
    }

    if (combinationCMin == combination.length) combinationCMinC++;
  } 

  print(combinationCMinC);
}