import 'dart:io';

import 'package:advent_of_code/Utils/list_ext.dart';
import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';

void main() {

  final pipesInfoMap = <String, ({Pipe pipe, List<String> connectionsNames})>{
    for (
      var parts in File('${getPath()}/input.txt')
        .readAsLinesSync()
        .map((line) => line.split(' '))
    ) parts[1]: (
      pipe: Pipe(int.tryParse(parts[4].sub(5, -1))!),
      connectionsNames: parts
        .sub(9)
        .map((pipeName) => pipeName.replaceFirst(',', ''))
        .toList()
    )
  };

  final pipesMapKeys = pipesInfoMap.keys.toList();

  final pipes = pipesInfoMap.values
    .map(
      (pipeInfo) {
        pipeInfo.pipe.connectionsIs = pipeInfo.connectionsNames
          .map((name) => pipesMapKeys.tryIndexOf(name)!)
          .toList();
        return pipeInfo.pipe;
      }
    )
    .toList();

  print(getDistances(pipes, pipesMapKeys.tryIndexOf('AA')!));
}

// void bla(List<Pipe> pipes, int startI, int minutes) {
//   final potentials = getPotentitals(pipes, startI);
  

  
//   bla(minutes - 1);
// }

List<int> getPotentitals(List<Pipe> pipes, int startI) {
  final distances = getDistances(pipes, startI);
  return [for (var i = 0; i < pipes.length; i++) pipes[i].rate * distances[i]];
}

List<int> getDistances(List<Pipe> pipes, int startI) {
  final distances = List<int?>.filled(pipes.length, null);
  
  void move(int pipeI, int stepsC) {
    final pipe = pipes[pipeI];
    distances[pipeI] = stepsC;
    for (final pipeNextI in pipe.connectionsIs) {
      final distExisting = distances[pipeNextI];
      if (distExisting == null || distExisting >= stepsC) {
        move(pipeNextI, stepsC + 1);
      }
    }
  }

  move(startI, 0);

  return distances.map((dist) => dist!).toList();
}

class Pipe {
  final int rate;
  late List<int> connectionsIs;

  Pipe(this.rate);
}