import 'dart:io';

import 'package:advent_of_code/2015/7/utils.dart';

void run() async {
  final List<String> lines = File('lib/2015/7/input.txt').readAsLinesSync();
  final Map<String, Wire> wires = getWires(lines);

  print(solveMut(wires, 'a'));
}