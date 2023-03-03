import 'dart:io';
import 'dart:math';

import 'package:advent_of_code/utils/funcs.dart';

void main() {
  final presentsCMin = int.tryParse(
    File('${getPath()}/input.txt').readAsStringSync()
  )! / 10;

  var houseNum = 2;
  while (true) {
    var presentsC = 0;
    for (var i = 1; i < sqrt(houseNum); i++) {
      final counter = houseNum / i;
      final floored = counter.floor();
      if (counter == floored) presentsC += i + floored;
    }

    if (presentsC >= presentsCMin) break;

    houseNum++;
  }

  print(houseNum);
}