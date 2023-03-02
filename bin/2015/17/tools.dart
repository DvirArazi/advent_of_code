import 'package:advent_of_code/utils/list_ext.dart';
import 'package:advent_of_code/utils/list_of_list_ext.dart';

List<List<int>> getAllCombinations(List<int> containers, int goal) {
  return containers.mapWithIndex((container, i) {
    if (container == goal) return [[container]];
    if (container > goal) return <List<int>>[];

    return getAllCombinations(containers.sub(i + 1), goal - container)
      .map((combinationTail) => [container] + combinationTail)
      .where((combination) => getCombinationSum(combination) == goal)
      .toList();
  }).toList().combine();
}

int getCombinationSum(List<int> combination) {
  var sum = 0;

  for (final container in combination) {
    sum += container;
  }

  return sum;
}