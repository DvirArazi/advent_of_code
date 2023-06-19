import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

const spells = [
  Spell(53, [Action(Effect.damage, 4, 1)]),
  Spell(73, [Action(Effect.damage, 2, 1), Action(Effect.heal, 2, 1)]),
  Spell(113, [Action(Effect.armor, 7, 6)]),
  Spell(173, [Action(Effect.damage, 3, 6)]),
  Spell(229, [Action(Effect.recharge, 101, 5)]),
];

void main() {
  final lines = File('${getPath()}/input.txt').readAsLinesSync();

  final playerHp = 50;
  final playerDamage = 500;

  final bossHp = int.tryParse(lines[0].split(' ')[2])!;
  final bossDamage = int.tryParse(lines[1].split(' ')[1])!;
}

int? bla(State state) {
  

  List<State> options = []; 

  for (final spell in spells) {
    if (spell.cost > state.playerMp) continue;

    final stateCrnt = cycle(state, spell);

    if (stateCrnt.playerHp <= 0) continue;

    options.add(stateCrnt);
  }

  int? manaSpentMin;

  for (final option in options) {
    final manaSpentCrnt = bla(option);
    if (
      manaSpentMin == null ||
      manaSpentCrnt != null && manaSpentMin > manaSpentCrnt
    ) {
      manaSpentMin = manaSpentCrnt;
    }
  }


  return manaSpentMin;
}

State cycle(State state, Spell spell) {
  final stateNew = state.copy();

  stateNew.tick();
  stateNew.castSpell(spell);

  stateNew.tick();
  if (stateNew.bossHp <= 0) return stateNew;
  stateNew.bossAttack();

  return stateNew;
}

enum Effect {
  damage,
  armor,
  heal,
  recharge,
}

class Action {
  final Effect effect;
  final int quantity;
  final int timer;

  const Action(this.effect, this.quantity, this.timer);
}

class Spell {
  final int cost;
  final List<Action> actions;

  const Spell(this.cost, this.actions);
}

class State {
  int playerHp;
  int playerMp;
  int playerArmor;
  int playerDamage;
  int bossHp;
  int bossDamage;
  List<Action> actions;
  int mpSpent;

  State(
    this.playerHp, this.playerMp, this.playerArmor, this.playerDamage,
    this.bossHp, this.bossDamage, this.actions, this.mpSpent
  );

  void tick() {
    for (final action in actions) {
      switch (action.effect) {
        case Effect.damage: bossHp -= action.quantity;
        case Effect.armor: playerArmor = action.quantity;
        case Effect.heal: playerHp += action.quantity;
        case Effect.recharge: playerMp += action.quantity;
      }
    }

    actions = actions
      .map((action) =>
        Action(action.effect, action.quantity, action.timer - 1)
      )
      .where((action) => action.timer > 0)
      .toList();
  }

  void castSpell(Spell spell) {
    playerMp -= spell.cost;
    mpSpent += spell.cost;
    actions.addAll(spell.actions);
  }

  void bossAttack() {
    var damage = bossDamage - playerArmor;
    playerHp -= damage > 1 ? damage : 1;

    playerArmor = 0;
  }

  State copy() => State(
    playerHp, playerMp, playerArmor, playerDamage, bossHp, bossDamage, actions,
    mpSpent
  );
}