Object solve(String input) {
  final layout = input
      .trim()
      .split('\n')
      .map((line) => line.split(''))
      .toList();

  var count = 0;

  for (var y = 0; y < layout.length; y++) {
    for (var x = 0; x < layout[0].length; x++) {
      if (isFree(layout, x, y)) count++;
    }
  }

  return count;
}

bool isFree(List<List<String>> layout, int x, int y) {
  if (!isRoll(layout, x, y)) return false;

  const dirs = [
    (x: -1, y: -1),
    (x: 0, y: -1),
    (x: 1, y: -1),
    (x: -1, y: 0),
    (x: 1, y: 0),
    (x: -1, y: 1),
    (x: 0, y: 1),
    (x: 1, y: 1),
  ];

  int count = 0;
  for (var dir in dirs) {
    if (isRoll(layout, x + dir.x, y + dir.y)) count++;
  }

  return count < 4;
}

bool isRoll(List<List<String>> layout, int x, int y) {
  if (y < 0 || y >= layout.length || x < 0 || x >= layout[0].length) return false;
  return layout[y][x] == '@';
}
