import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void main() async {
  final conditions = {
    'children': (int att) => att == 3,
    'cats': (int att) => att > 7,
    'samoyeds': (int att) => att == 2,
    'pomeranians': (int att) => att < 3,
    'akitas': (int att) => att == 0,
    'vizslas': (int att) => att == 0,
    'goldfish': (int att) => att < 5,
    'trees': (int att) => att > 3,
    'cars': (int att) => att == 2,
    'perfumes': (int att) => att == 1,
  };

  int sueNum = 1;

  outer: await for (final line in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    final parts = line.split(' ');

    for (var i = 2; i < parts.length; i += 2) {
      final condition = conditions[parts[i].cutTail(1)]!;
      final attributeCrnt = int.tryParse(
        parts[i+1].cutTail(i == parts.length - 2 ? 0 : 1)
      )!;
      if (!condition(attributeCrnt)) {
        sueNum++;
        continue outer;
      }
    }

    break;
  }

  print(sueNum);
}