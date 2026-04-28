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
    var psudoPos = pos + (line.dir ? line.stepsC : -line.stepsC);
    var add = line.dir
        ? psudoPos ~/ 100
        : (-psudoPos + (pos == 0 ? 0 : 100)) ~/ 100;
    print('$pos\t${line.dir ? "+" : "-"}${line.stepsC}\t$psudoPos\t+$add');
    pos = psudoPos % 100;

    solution += add;
  }

  return solution;
}
