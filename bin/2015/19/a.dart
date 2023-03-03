import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';

import 'tools.dart';

void main() {
  final parts = File('${getPath()}/input.txt')
    .readAsStringSync()
    .split('\n\n');
  final changes = parts[0]
    .split('\n')
    .map((line) {
      final parts = line.split(' => ');
      return Change(parts[0], parts[1]);
    }).toList();
  final moleculeStart = parts[1];

  final molecules = <int, List<String>>{};

  for (var i = 0; i < moleculeStart.length; i++) {
    for (final change in changes) {
      final before = change.before;
      final beforeC = before.length;
      final after = change.after;
      final afterC = after.length;
      if (
        i + beforeC < moleculeStart.length &&
        moleculeStart.sub(i, i + beforeC) == before
      ) {
        final moleculeNew = 
          moleculeStart.sub(0, i) +
          after +
          moleculeStart.sub(i + beforeC);

        final key = afterC - beforeC;

        if (molecules[key] == null) {
          molecules[key] = [];
        } else if (molecules[key]!.contains(moleculeNew)) {
          continue;
        }

        molecules[key]!.add(
          moleculeStart.sub(0, i) +
          after +
          moleculeStart.sub(i + beforeC)
        );
      }
    }
  }

  var sum = 0;

  for (final catagory in molecules.values) {
    sum += catagory.length;
  }

  print(sum);
}