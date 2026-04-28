Object solve(String input) {
  final ranges = input.split(',').map((rangeString) {
    final rangeList = rangeString.split('-');
    return (min: int.parse(rangeList[0]), max: int.parse(rangeList[1]));
  }).toList();

  var sum = 0;

  for (var range in ranges) {
    for (var i = range.min; i <= range.max; i++) {
      if (isRepeat(i)) {
        sum += i;
      }
    }
  }

  return sum;
}

bool isRepeat(int num) {
  final str = num.toString();

  label:
  for (int i = 1; i <= str.length ~/ 2; i++) {
    if (str.length % i != 0) continue;

    final first = str.substring(0, i);
    for (int j = 1; j < str.length ~/ i; j++) {
      if (first != str.substring(i * j, i * (j + 1))) continue label;
    }

    return true;
  }

  return false;
}
