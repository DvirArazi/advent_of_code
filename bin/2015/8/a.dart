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
    charC += line.length;
    for (var i = 1; i < line.length - 1;) {
      i += 
        line[i] != '\\' ? 1 :
        line[i+1] == 'x' ? 4 : 2;
      
      charC--;
    }
  }

  print(charC);
}