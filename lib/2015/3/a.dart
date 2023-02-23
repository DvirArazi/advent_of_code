import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/Utils/point.dart';

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
        case '^': current.y--; break;
        case '<': current.x--; break;
        case '>': current.x++; break;
        case 'v': current.y++; break;
      }

      if (visited.any((point) => 
        point.x == current.x && 
        point.y == current.y
      )) {
        continue;
      }

      visited.add(current.copy());
    }
  }

  print(visited.length);
}
