library utils;

import 'package:advent_of_code/utils/int_2d.dart';
import 'package:advent_of_code/utils/list_ext.dart';

int getCityIMut(List<String> cities, String city) {
  final index = cities.tryIndexOf(city);

  if (index != null) return index;

  cities.add(city);

  return cities.length - 1;
}

int getCitiesC(int linesC) {
  var citiesC = 0;

  for (int i = 1;; i++) {
    citiesC += i;

    if (citiesC == linesC) return i + 1;

    if (citiesC > linesC) throw Exception();
  }
}

Int2D getDistanceI(int a, int b) {
  return a < b ? Int2D(a, b-1-a) : Int2D(b, a-1-b);
}

int getDistance(List<List<int>> distances, List<int> route) {
  var distance = 0;

  for (var i = 0; i < route.length - 1; i++) {
    final dI = getDistanceI(route[i], route[i+1]);
    distance += distances[dI.a][dI.b];
  }

  return distance;
}