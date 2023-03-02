import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() {
  final List<String> lines = File('${getPath()}/input.txt').readAsLinesSync(); 
  Map<String, Wire> wires = getWires(lines);

  final bNew = solveMut(wires, 'a');
  wires = getWires(lines);
  wires['b'] = WireSolved(bNew);
  print(solveMut(wires, 'a'));
}