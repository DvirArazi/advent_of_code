import 'dart:io';
import 'dart:math';

import 'package:advent_of_code/utils/funcs.dart';

void main() {
  final presentsCMin = (int.tryParse(
    File('${getPath()}/input.txt').readAsStringSync()
  )! / 11).ceil();

  var bla = 0;

  var houseNum = 2;
  while (true) {
    var presentsC = 0;
    for (var i = 1; i < sqrt(houseNum); i++) {
      final counter = houseNum / i;
      final floored = counter.floor();
      if (
        counter == floored
      ) {
        if (i > (houseNum / 50).ceil()) {
          presentsC += i + floored;
        }
        else if (floored > (houseNum / 50).ceil()) {
          presentsC += floored;
        }
      }
    }

    if (bla < presentsC) {
      bla = presentsC;
    }

    if (presentsC >= presentsCMin) break;

    houseNum++;
  }

  print(houseNum);
}