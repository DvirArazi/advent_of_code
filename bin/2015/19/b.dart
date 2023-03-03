import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';

import 'tools.dart';

void main() {
  final parts = File('${getPath()}/input.txt')
    .readAsStringSync()
    .split('\n\n');

  final changes = getChanges(parts[0].split('\n'));
  final medicine = parts[1].split('\n')[0];

  print(getStepsMinCToMedicine(changes, medicine));
}

Map<int, List<Change>> getChanges(List<String> lines) {
  final changes = <int, List<Change>>{};
  for (final line in lines) {
    final parts = line.split(' => ');
    final before = parts[0], after = parts[1];
    final key = after.length;
    if (changes[key] == null) {
      changes[key] = [];
    }
    changes[key]!.add(Change(before, after));
  }

  return changes;
}

int getStepsMinCToMedicine(Map<int, List<Change>> changes, String medicine) {
  final groupFit = changes[medicine.length];
  if (groupFit != null) {
    for (final change in groupFit) {
      if (medicine == change.after && change.before == 'e') return 1;
    }
  }

  for (final group in changes.entries) {
    for (final change in group.value.where((change) => change.before != 'e')) {
      for (var i = 0; i < medicine.length - group.key + 1; i++) {
        if (medicine.sub(i, i + group.key) == change.after) {
          return getStepsMinCToMedicine(
            changes,
            medicine.sub(0, i) +
            change.before +
            medicine.sub(i + group.key)
          ) + 1;
        }
      }
    }
  }

  throw Exception();
}