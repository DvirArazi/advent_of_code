import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/list_of_int_ext.dart';

import 'tools.dart';

void main() {
  final parts = File('${getPath()}/input.txt')
    .readAsStringSync()
    .split('\n');
  final bossHP = int.tryParse(parts[0].split(' ')[2])!;
  final bossDamage = int.tryParse(parts[1].split(' ')[1])!;
  final bossArmor = int.tryParse(parts[2].split(' ')[1])!;

  final ringOptions = getAllOptions(rings.length, 2);

  var costs = <int>[]; 
  for (final weapon in weapons) {
    for (final armor in armors) {
      for (final ringsOption in ringOptions) {
        var ringsCrnt = <Item>[];
        for (var i = 0; i < ringsOption.length; i++) {
          if (ringsOption[i]) ringsCrnt.add(rings[i]);
        }
        final ringTotal = getTotal(ringsCrnt);

        if (!canWinBoss(
          100,
          weapon.damage + ringTotal.damage,
          armor.armor + ringTotal.armor,
          bossHP,
          bossDamage,
          bossArmor
        )) {
          costs.add(
            weapon.cost +
            armor.cost +
            ringTotal.cost
          );
        }
      }
    }
  }

  print(costs.max);
}