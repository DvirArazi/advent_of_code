import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var total = 0;

  await for (final line in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    final ds = line.split('x').map((d)=>int.parse(d)).toList();
    final sides = [ds[0]*ds[1], ds[1]*ds[2], ds[2]*ds[0]];

    final sideMin = min(sides[0], min(sides[1], sides[2]));

    total += 2*(sides[0] + sides[1] + sides[2]) + sideMin; 
  }

  print(total);
}