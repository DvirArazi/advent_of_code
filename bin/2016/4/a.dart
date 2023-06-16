import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() {
  final rooms = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((line) => Room(line))
    .toList()
    .where((room) => room.isValid());
  
  var sum = 0;
  for (final room in rooms) {
      sum += room.id;
  } 

  print(sum);
}