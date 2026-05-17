Object solve(String input) {
  final sections = input.trim().split('\n\n');

  final ranges = sections[0].split('\n').map((line) {
    final parts = line.split('-');
    return (start: int.parse(parts[0]), end: int.parse(parts[1]));
  }).toList();

  final ids = sections[1].split('\n').map((line) => int.parse(line)).toList();

  var count = 0;
  // print(ids);
  // print(ranges);

  for (var id in ids) {
    for (var range in ranges) {
      if (id >= range.start && id <= range.end) {
        count++;
        break;
      }
    }
  }

  return count;
}
