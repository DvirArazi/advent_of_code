import 'package:advent_of_code/utils/list_of_list_ext.dart';

List<List<int>> getPermutations(int itemsC) {
  if (itemsC == 1) return [[0]];

  final listsRest = getPermutations(itemsC - 1);

  return List.generate(itemsC, (i) =>
    listsRest.map((listRest) =>
      [i] + listRest.map((item) =>
        item < i ? item : item + 1
      ).toList()
    ).toList()
  ).combine();
}