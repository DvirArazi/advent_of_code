import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() {
  final containers = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((container) => int.tryParse(container)!)
    .toList();

  final combinations = getAllCombinations(containers, 150);
  print(combinations.length);
}