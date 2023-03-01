library utils;

import 'dart:math';

int getDistanceByLine(int at, String line) {
  final parts = line.split(' ');
  final speed = int.tryParse(parts[3])!;
  final duration = int.tryParse(parts[6])!;
  final rest = int.tryParse(parts[13])!;

  final burstTime = duration+rest;

  return speed * (
    duration*(at ~/ burstTime) +
    min(duration, at % burstTime)
  );
}

int getDistanceByDeer(int at, Deer deer) {
  final burstTime = deer.duration+deer.rest;

  return deer.speed * (
    deer.duration*(at ~/ burstTime) +
    min(deer.duration, at % burstTime)
  );
}

class Deer {
  final int speed;
  final int duration;
  final int rest;

  Deer(this.speed, this.duration, this.rest);
}