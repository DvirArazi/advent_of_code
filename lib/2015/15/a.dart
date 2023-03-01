import 'dart:io';

import 'package:advent_of_code/2015/15/utils.dart';
import 'package:advent_of_code/utils/list_of_int_ext.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void run() async {
  final ingredients = File('lib/2015/15/input.txt')
    .readAsLinesSync()
    .map((line) {
      final parts = line.split(' ');
      return [
        int.tryParse(parts[2].cutTail(1))!,
        int.tryParse(parts[4].cutTail(1))!,
        int.tryParse(parts[6].cutTail(1))!,
        int.tryParse(parts[8].cutTail(1))!,
      ];
    }).toList();
  
  final mixes = getMixes(ingredients.length, 100);
  final mixesScore = mixes
    .map((mix) => getMixScore(ingredients, mix))
    .toList();

  print(mixesScore.max);
}