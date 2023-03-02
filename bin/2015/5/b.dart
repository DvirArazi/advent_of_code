import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var niceC = 0;

  await for (final line in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    label0: {
      for (var i = 0; i < line.length - 3; i++) {
        for (var j = i + 2; j < line.length - 1; j++) {
          if (line.substring(i, i+2) == line.substring(j, j+2)) {
            break label0;
          }
        }
      }

      continue;
    }

    label1: {
      for (var i = 0; i < line.length - 2; i++) {
        if (line[i] == line[i+2]) break label1;
      }

      continue;
    }

    niceC++;
  }

  print(niceC);
}