import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var charC = 0;

  await for (final line in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    charC += 6;
    for (var i = 1; i < line.length - 1; i++) {
      final char = line[i];

      charC += char == '\\' || char == '"' ? 2 : 1;
    }
    charC -= line.length;
  }

  print(charC);
}