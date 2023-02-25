import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/int_2d.dart';

void run() async {
  var current = Int2D(0, 0);
  List<Int2D> visited = [current.copy()];

  await for (final data in File('lib/2015/3/input.txt')
    .openRead()
    .transform(utf8.decoder)  
  ) {
    for (final rune in data.runes) {
      final char = String.fromCharCode(rune);
      switch (char) {
        case '^': current.b--; break;
        case '<': current.a--; break;
        case '>': current.a++; break;
        case 'v': current.b++; break;
      }

      if (visited.any((point) => 
        point.a == current.a && 
        point.b == current.b
      )) {
        continue;
      }

      visited.add(current.copy());
    }
  }

  print(visited.length);
}
