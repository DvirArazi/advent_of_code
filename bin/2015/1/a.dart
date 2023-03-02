import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var result = 0;

  await for (final data in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
  ) {
    for(final rune in data.runes) {
      final char = String.fromCharCode(rune);
      result += char == '(' ? 1 : -1;
    }
  }

  print(result);
}