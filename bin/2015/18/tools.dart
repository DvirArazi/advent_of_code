import 'package:advent_of_code/utils/int_2d.dart';

final neighborsDirs = <Int2D>[
  Int2D(-1, -1),
  Int2D(-1, 0),
  Int2D(-1, 1),
  Int2D(0, -1),
  Int2D(0, 1),
  Int2D(1, -1),
  Int2D(1, 0),
  Int2D(1, 1),
];

bool getLightNewState(List<List<bool>> grid, int x, int y) {
  var neighborsOnC = 0;
  for (final dir in neighborsDirs) {
    final pos = Int2D(x + dir.a, y + dir.b);
    if (
      pos.a >= 0 && pos.a < grid.length &&
      pos.b >= 0 && pos.b < grid[0].length &&
      grid[pos.a][pos.b] == true
    ) {
      neighborsOnC++;
    }
  }

  return grid[x][y] ?
    neighborsOnC == 2 || neighborsOnC == 3 :
    neighborsOnC == 3;
}
