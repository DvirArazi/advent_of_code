import 'package:advent_of_code/2015/1/a.dart' as aoc_2015_1_a;
import 'package:advent_of_code/2015/1/b.dart' as aoc_2015_1_b;
import 'package:advent_of_code/2015/2/a.dart' as aoc_2015_2_a;
import 'package:advent_of_code/2015/2/b.dart' as aoc_2015_2_b;
import 'package:advent_of_code/2015/3/a.dart' as aoc_2015_3_a;
import 'package:advent_of_code/2015/3/b.dart' as aoc_2015_3_b;
import 'package:advent_of_code/2015/4/a.dart' as aoc_2015_4_a;
import 'package:advent_of_code/2015/4/b.dart' as aoc_2015_4_b;
import 'package:advent_of_code/2015/5/a.dart' as aoc_2015_5_a;
import 'package:advent_of_code/2015/5/b.dart' as aoc_2015_5_b;
import 'package:advent_of_code/2015/6/a.dart' as aoc_2015_6_a;
import 'package:advent_of_code/2015/6/b.dart' as aoc_2015_6_b;
import 'package:advent_of_code/2015/7/a.dart' as aoc_2015_7_a;
import 'package:advent_of_code/2015/7/b.dart' as aoc_2015_7_b;
import 'package:advent_of_code/2015/8/a.dart' as aoc_2015_8_a;
import 'package:advent_of_code/2015/8/b.dart' as aoc_2015_8_b;
import 'package:advent_of_code/2015/9/a.dart' as aoc_2015_9_a;
import 'package:advent_of_code/2015/9/b.dart' as aoc_2015_9_b;
import 'package:advent_of_code/2015/10/a.dart' as aoc_2015_10_a;
import 'package:advent_of_code/2015/10/b.dart' as aoc_2015_10_b;
import 'package:advent_of_code/2015/11/a.dart' as aoc_2015_11_a;
import 'package:advent_of_code/2015/11/b.dart' as aoc_2015_11_b;
import 'package:advent_of_code/2015/12/a.dart' as aoc_2015_12_a;
import 'package:advent_of_code/2015/12/b.dart' as aoc_2015_12_b;
import 'package:advent_of_code/2015/13/a.dart' as aoc_2015_13_a;

void main(List<String> arguments) {
  final year = arguments[0];
  final day = arguments[1];
  final half = arguments[2];

  final run = {
    '2015': {
      '1': {
        'a': aoc_2015_1_a.run,
        'b': aoc_2015_1_b.run,
      },
      '2': {
        'a': aoc_2015_2_a.run,
        'b': aoc_2015_2_b.run,
      },
      '3': {
        'a': aoc_2015_3_a.run,
        'b': aoc_2015_3_b.run,
      },
      '4': {
        'a': aoc_2015_4_a.run,
        'b': aoc_2015_4_b.run,
      },
      '5': {
        'a': aoc_2015_5_a.run,
        'b': aoc_2015_5_b.run,
      },
      '6': {
        'a': aoc_2015_6_a.run,
        'b': aoc_2015_6_b.run,
      },
      '7': {
        'a': aoc_2015_7_a.run,
        'b': aoc_2015_7_b.run,
      },
      '8': {
        'a': aoc_2015_8_a.run,
        'b': aoc_2015_8_b.run,
      },
      '9': {
        'a': aoc_2015_9_a.run,
        'b': aoc_2015_9_b.run,
      },
      '10': {
        'a': aoc_2015_10_a.run,
        'b': aoc_2015_10_b.run,
      },
      '11': {
        'a': aoc_2015_11_a.run,
        'b': aoc_2015_11_b.run
      },
      '12': {
        'a': aoc_2015_12_a.run,
        'b': aoc_2015_12_b.run,
      },
      '13': {
        'a': aoc_2015_13_a.run,
      }
    },
  }[year]?[day]?[half];

  if (run == null) {
    print('Invalid input');
    return;
  }

  run();
}
