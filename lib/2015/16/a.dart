import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/string_ext.dart';

void run() async {
  const attributes = {
    'children': 3,
    'cats': 7,
    'samoyeds': 2,
    'pomeranians': 3,
    'akitas': 0,
    'vizslas': 0,
    'goldfish': 5,
    'trees': 3,
    'cars': 2,
    'perfumes': 1,
  };

  int sueNum = 1;

  outer: await for (final line in File('lib/2015/16/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    final parts = line.split(' ');

    for (var i = 2; i < parts.length; i += 2) {
      final attribute = attributes[parts[i].cutTail(1)]!;
      final attributeCrnt = int.tryParse(
        parts[i+1].cutTail(i == parts.length - 2 ? 0 : 1)
      )!;
      if (attribute != attributeCrnt) {
        sueNum++;
        continue outer;
      }
    }

    break;
  }

  print(sueNum);
}