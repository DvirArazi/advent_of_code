Object solve(String input) {
  final batteries = input
      .trim()
      .split('\n')
      .map(
        (batteryStr) => batteryStr
            .split('')
            .map((digitStr) => int.parse(digitStr))
            .toList(),
      )
      .toList();

  final sum = batteries
      .map((battery) => getJoltage(battery))
      .reduce((value, current) => value + current);

  return sum;
}

int getJoltage(List<int> battery) {
  int joltage = 0;

  int pushI = 0;
  for (int x = 0; x < 12; x++) {
    for (int i = pushI + 1; i < battery.length - (11 - x); i++) {
      if (battery[pushI] < battery[i]) pushI = i;
    }

    joltage = joltage * 10 + battery[pushI];
    pushI++;
  }

  return joltage;
}
