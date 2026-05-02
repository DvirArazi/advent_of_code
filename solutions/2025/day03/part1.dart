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
  int maxI0 = 0;
  for (int i = 1; i < battery.length - 1; i++) {
    if (battery[maxI0] < battery[i]) maxI0 = i;
  }

  int maxI1 = maxI0 + 1;
  for (int i = maxI1 + 1; i < battery.length; i++) {
    if (battery[maxI1] < battery[i]) maxI1 = i;
  }

  return battery[maxI0] * 10 + battery[maxI1];
}
