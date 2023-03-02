import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var niceC = 0;

  outer: await for (final line in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    var vowelC = 0;
    for (final rune in line.runes) {
      final char = String.fromCharCode(rune);

      if ('aeiou'.contains(char)) vowelC++;
    }

    if (vowelC < 3) continue;

    label: {
      for (var i = 0; i < line.length - 1; i++) {
        if (line[i] == line[i + 1]) break label;
      }

      continue;
    }

    for (final forbidden in ['ab', 'cd', 'pq', 'xy']) {
      if (line.contains(forbidden)) continue outer;
    }

    niceC++;
  }

  print(niceC);
}