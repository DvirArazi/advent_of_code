import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() async {
  final List<String> lines = File('${getPath()}/input.txt').readAsLinesSync();
  final Map<String, Wire> wires = getWires(lines);

  print(solveMut(wires, 'a'));
}