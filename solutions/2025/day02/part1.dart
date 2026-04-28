import 'dart:math';

Object solve(String input) {
  final pairs = input.split(',').map((pairString) {
    final pairList = pairString.split('-');
    return (min: pairList[0], max: pairList[1]);
  }).toList();

  var sum = 0;

  for (var pair in pairs) {
    final min = pair.min;

    var halfExp = (min.length / 2).ceil();
    var inc = (pow(10, halfExp) as int) + 1;
    var jumpMax = pow(10, halfExp * 2) as int;
    var id = 0;

    if (min.length % 2 == 0) {
      final left = min.substring(0, min.length ~/ 2);
      id = int.parse(left + left);

      if (id < int.parse(min)) {
        id += inc;
      }
    } else {
      id = pow(10, min.length) + pow(10, min.length ~/ 2) as int;
    }

    final max = int.parse(pair.max);
    while (id <= max) {
      sum += id;
      id += inc;
      if (id > jumpMax) {
        id = pow(10, halfExp * 2 + 1) + pow(10, halfExp) as int;
        halfExp++;
        inc = (pow(10, halfExp) as int) + 1;
        jumpMax = pow(10, halfExp * 2) as int;
      }
    }
  }

  return sum;
}
