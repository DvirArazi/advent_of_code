// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:advent_of_code/2015/11/utils.dart';

void run() {
  String input = File('lib/2015/11/input.txt').readAsStringSync();

  print(getPasswordNext(getSequenceNext(
    getPasswordNext(getSequenceNext(input))
  )));
}