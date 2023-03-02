import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() {
  final input = File('${getPath()}/input.txt').readAsStringSync();

  print(getSequenceC(input, 50));
}