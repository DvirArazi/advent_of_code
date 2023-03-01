import 'dart:io';

import 'package:advent_of_code/2015/14/utils.dart';

void run() {
  final List<Deer> deers = File('lib/2015/14/input.txt')
    .readAsLinesSync()
    .map((line) {
      final parts = line.split(' ');
      return Deer(
        int.tryParse(parts[3])!,
        int.tryParse(parts[6])!,
        int.tryParse(parts[13])!,
      );
    }).toList();

  final scoreboard = List.generate(deers.length, (_) => 0);
  
  for (var second = 1; second <= 2503; second++) {
    var deerLeadIs = [0];
    var deerLeadDistance = getDistanceByDeer(second, deers[0]);
    for (var i = 1; i < deers.length; i++) {
      final deerDistanceCrnt = getDistanceByDeer(second, deers[i]);
      if (deerLeadDistance < deerDistanceCrnt) {
        deerLeadDistance = deerDistanceCrnt;
        deerLeadIs = [i];
      } else if (deerLeadDistance == deerDistanceCrnt) {
        deerLeadIs.add(i);
      }
    }

    for (var i in deerLeadIs) {
      scoreboard[i]++;
    }
  }

  var highscore = scoreboard[0];
  for (final score in scoreboard.sublist(1)) {
    if (highscore < score) highscore = score;
  }

  print(highscore);
}

