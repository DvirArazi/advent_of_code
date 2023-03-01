import 'dart:io';

import 'package:advent_of_code/2015/15/utils.dart';
import 'package:advent_of_code/utils/list_of_int_ext.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void run() {
  final ingredients = File('lib/2015/15/input.txt')
    .readAsLinesSync()
    .map((line) {
      final parts = line.split(' ');
      return [
        int.tryParse(parts[2].cutTail(1))!,
        int.tryParse(parts[4].cutTail(1))!,
        int.tryParse(parts[6].cutTail(1))!,
        int.tryParse(parts[8].cutTail(1))!,
        int.tryParse(parts[10])!
      ];
    }).toList();

  final mixes = getMixes(ingredients.length, 100).where((mix) { 
    var calories = 0;
    for (var i = 0; i < mix.length; i++) {
      calories += mix[i] * ingredients[i][4];
    }

    return calories == 500;
  });

  final mixesScore = mixes
    .map((mix) => getMixScore(ingredients, mix))
    .toList();

  print(mixesScore.max);
}