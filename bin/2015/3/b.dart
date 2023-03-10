import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';

void main() async {
  var santa = Int2D(0, 0);
  var robot = Int2D(0, 0);
  var visited = [Int2D(0, 0)];

  var isSanta = true;

  await for (final data in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)  
  ) {
    for (final rune in data.runes) {
      final char = String.fromCharCode(rune);

      final current = isSanta ? santa : robot;
      isSanta = !isSanta;

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
