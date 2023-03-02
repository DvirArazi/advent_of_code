// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() {
  String input = File('${getPath()}/input.txt').readAsStringSync();

  print(getPasswordNext(getSequenceNext(input)));
}