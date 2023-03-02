library utils;

int getSequenceC(String input, int loop) {
  var crnt = input;
  for (var i = 0; i < loop; i++) {
    final List<Pair> pairs = [];

    pairs.add(Pair(1, crnt[0]));

    for (var i = 1; i < crnt.length; i++) {
      if (crnt[i] == crnt[i-1]) {
        pairs.last.count++;
        continue;
      } 

      pairs.add(Pair(1, crnt[i]));
    }

    crnt = pairs
      .map((p) => p.count.toString() + p.value)
      .join();
  }

  return crnt.length;
}

class Pair {
  int count;
  String value;

  Pair(this.count, this.value);
}