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
      },
    },
  }[year]?[day]?[half];

  if (run == null) {
    print('Invalid input');
    return;
  }

  run();
}
