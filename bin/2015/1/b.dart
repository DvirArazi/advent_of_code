import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var result = 0;
  late int basementI;

  label: await for (final data in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
  ) {
    for (var i = 0; i < data.length; i++) {
      final char = data[i];

      result += char == '(' ? 1 : -1;

      if (result == -1) {
        basementI = i + 1;
        break label;
      }
    }
  }

  print(basementI);
}
