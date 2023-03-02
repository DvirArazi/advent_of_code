import 'dart:io';

import 'package:advent_of_code/utils/list_ext.dart';
import 'package:advent_of_code/utils/list_of_list_ext.dart';

String getPath() {
  return Platform
    .script
    .toString()
    .split('/')
    .sub(3, -1)
    .join('/');
}

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

int getMax(List<int> items) {
  var max = items[0];

  for (final item in items.sublist(1)) {
    if (max < item) max = item;
  }

  return max;
}