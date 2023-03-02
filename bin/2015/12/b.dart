import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';

void main() async {
  var sum = 0;
  List<Int2D> skips = [];

  await for(final input in File('${getPath()}/input.txt')
    .openRead()
    .transform(utf8.decoder)
  ) {
    for (var i = 0; i < input.length-6; i++) {
      if (input.substring(i, i+6) == ':"red"') {
        skips.add(Int2D(
          (){
            var level = 0;
            for (var j = i;; j--) {
              final jChar = input[j];

              if (jChar == '}') {
                level++;
                continue;
              }

              if (jChar != '{') continue;

              if (level == 0) {
                while (skips.isNotEmpty && skips.last.a > j) {
                  skips.removeLast();
                }

                return j;
              }

              level--;
            }
          }(),
          (){
            var level = 0;
            for (var j = i+6;; j++) {
              final jChar = input[j];

              if (jChar == '{') {
                level++;
                continue;
              }

              if (jChar != '}') continue;

              if (level == 0) {
                i = j;
                return j;
              }

              level--;
            }
          }()
        ));
      }
    }

    var numCrnt = 0;
    var isNegative = false;

    var skipsCrntI = 0;
    for (var i = 0; i < input.length;) {

      if (skipsCrntI < skips.length) {
        final skipCrnt = skips[skipsCrntI];
        if (i == skipCrnt.a) {
          i = skipCrnt.b + 1;
          skipsCrntI++;
          continue;
        }
      }

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

      i++;
    }
  }

  print(sum);
}