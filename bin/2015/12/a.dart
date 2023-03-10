import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() async {
  var sum = 0;

  await for(final input in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
  ) {
    var numCrnt = 0;
    var isNegative = false;
    for (var i = 0; i < input.length; i++) {
      final char = input[i];

      final digit = int.tryParse(char);

      if (digit != null) {
        numCrnt = numCrnt * 10 + digit;

        if (int.tryParse(input[i+1]) == null) {
          sum += numCrnt * (isNegative ? -1 : 1);
          numCrnt = 0;
          isNegative = false;
        }
      } else {
        isNegative = char == '-';
      }
    }
  }

  print(sum);
}