import 'dart:io';

import 'package:advent_of_code/2015/7/utils.dart';

void run() {
  final List<String> lines = File('lib/2015/7/input.txt').readAsLinesSync(); 
  Map<String, Wire> wires = getWires(lines);

  final bNew = solveMut(wires, 'a');
  wires = getWires(lines);
  wires['b'] = WireSolved(bNew);
  print(solveMut(wires, 'a'));
}