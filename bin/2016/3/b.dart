import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() {
  final tris = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((line) => line
      .split(' ')
      .where((e) => e.isNotEmpty)
      .map((side) => int.tryParse(side)!)
      .toList()
    )
    .toList();

  final tris2 = List.generate(tris.length, (i) => 
    List.generate(3, (j) => tris[j + (i ~/ 3) * 3][i % 3])
  );

  var count = 0;

  for (var tri in tris2) {
    if (
      tri[0] + tri[1] > tri[2] &&
      tri[1] + tri[2] > tri[0] &&
      tri[2] + tri[0] > tri[1]
    ) count++;
  }

  print(count);
}