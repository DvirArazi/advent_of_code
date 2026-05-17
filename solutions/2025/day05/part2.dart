Object solve(String input) {
  final sections = input.trim().split('\n\n');

  final ranges = sections[0].split('\n').map((line) {
    final parts = line.split('-');
    return (start: int.parse(parts[0]), end: int.parse(parts[1]));
  }).toList();

  var max = 0;

  for (var i = 0; i < ranges.length; i++) {
    if (max < ranges[i].end) {
      max = ranges[i].end;
    }
  }

  print(max);

  var count = 0;

  for (var i = 0; i <= max; i++) {
    for (var range in ranges) {
      if (i >= range.start && i <= range.end) {
        count++;
        break;
      }
    }
  }

  return count;
}
