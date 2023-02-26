import 'dart:io';

import 'package:advent_of_code/2015/10/utils.dart';

void run() {
  final input = File('lib/2015/10/input.txt').readAsStringSync();

  print(getSequenceC(input, 50));
}