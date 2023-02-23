import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/Utils/point.dart';

void run() async {
  final grid = List.generate(1000, (_) => List.filled(1000, false));

  await for (final line in File('lib/2015/6/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    final inst = 
      line.startsWith('turn on') ? Instruction.turnOn :
      line.startsWith('turn off') ? Instruction.turnOff :
      Instruction.toggle;

    final toggleMod = inst == Instruction.toggle ? -1 : 0;

    final parts = line.split(' ');
    final aParts = parts[2 + toggleMod].split(',');
    final a = Int2D(int.parse(aParts[0]), int.parse(aParts[1]));
    final bParts = parts[4 + toggleMod].split(',');
    final b = Int2D(int.parse(bParts[0]), int.parse(bParts[1]));

    for (var x = a.x; x <= b.x; x++) {
      for (var y = a.y; y <= b.y; y++) {
        grid[x][y] =
          inst == Instruction.toggle ? !grid[x][y] : 
          inst == Instruction.turnOn ? true : false;
      }
    }
  }

  var onC = 0;

  for (var x = 0; x < 1000; x++) {
    for (var y = 0; y < 1000; y++) {
      if (grid[x][y]) onC++;
    }
  }

  print(onC);
}

enum Instruction {
  turnOn,
  turnOff,
  toggle,
}