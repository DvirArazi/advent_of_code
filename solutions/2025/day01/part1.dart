Object solve(String input) {
  final lines = input
      .trim()
      .split('\n')
      .map(
        (line) => (dir: line[0] == 'R', stepsC: int.parse(line.substring(1))),
      )
      .toList();

  var pos = 50;
  var solution = 0;

  for (var line in lines) {
    pos = (pos + (line.dir ? line.stepsC : -line.stepsC)) % 100;
    if (pos == 0) solution++;
  }

  return solution;
}
