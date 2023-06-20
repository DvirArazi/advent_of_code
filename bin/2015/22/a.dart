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

  final bossHp = int.tryParse(lines[0].split(' ')[2])!;
  final bossDamage = int.tryParse(lines[1].split(' ')[1])!;

  // print(getMpSpentMin(State(50, 500, 0, bossHp, bossDamage, [], 0)));
  print(getMpSpentMin(State(10, 250, 0, 13, 8, [], 0)));
}

(int?, List<Spell>) getMpSpentMin(State state) {
  (int?, List<Spell>) inner(State state, Spell spell, List<Spell> history) {
    final stateNew = state.copy();
    stateNew.castSpell(spell);
    stateNew.tick();
    if (stateNew.bossHp <= 0) return (stateNew.mpSpent, );
    stateNew.bossAttack();
    if (stateNew.playerHp <= 0) return null;
    stateNew.tick();
    if (stateNew.bossHp <= 0) return stateNew.mpSpent;

    return getMpSpentMin(stateNew);
  }

  int? manaSpentMin;

  for (final spell in spells) {
    if (spell.cost > state.playerMp) continue;

    final manaSpentCrnt = inner(state, spell);

    if (
      manaSpentCrnt != null && 
      (manaSpentMin == null || manaSpentMin > manaSpentCrnt)
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
  int bossHp;
  int bossDamage;
  List<Action> actions;
  int mpSpent;

  State(
    this.playerHp, this.playerMp, this.playerArmor,
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
    playerHp, playerMp, playerArmor, bossHp, bossDamage, actions,
    mpSpent
  );
}