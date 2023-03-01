import 'dart:io';

import 'package:advent_of_code/2015/9/utils.dart';
import 'package:advent_of_code/utils/funcs.dart';

void run() {
  final lines = File('lib/2015/9/input.txt').readAsLinesSync();
  final citiesC = getCitiesC(lines.length);

  final List<String> cities = [];

  final distances = List.generate(citiesC - 1, (i) => 
    List.generate(citiesC - 1 - i, (_) => 0)
  );

  for (final line in lines) {
    final parts = line.split(' ');
    final a = getCityIMut(cities, parts[0]);
    final b = getCityIMut(cities, parts[2]);
    final distance = int.tryParse(parts[4])!;

    final dI = getDistanceI(a, b);
    distances[dI.a][dI.b] = distance;
  }

  final routes = getPermutations(cities.length);

  var distanceShortest = getDistance(distances, routes[0]);

  for (final route in routes.sublist(1)) {
    final distanceCrnt = getDistance(distances, route);
    if (distanceCrnt < distanceShortest) distanceShortest = distanceCrnt;
  }

  print(distanceShortest);
}