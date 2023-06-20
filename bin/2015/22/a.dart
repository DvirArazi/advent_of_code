import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

const spells = [
  Spell(53, [Effect(EffectType.damage, 4, 1)]),
  Spell(73, [Effect(EffectType.damage, 2, 1), Effect(EffectType.heal, 2, 1)]),
  Spell(113, [Effect(EffectType.armor, 7, 6)]),
  Spell(173, [Effect(EffectType.damage, 3, 6)]),
  Spell(229, [Effect(EffectType.recharge, 101, 5)]),
];

void main() {
  final lines = File('${getPath()}/input.txt').readAsLinesSync();

  final bossHp = int.tryParse(lines[0].split(' ')[2])!;
  final bossDamage = int.tryParse(lines[1].split(' ')[1])!;

  // print(getMpSpentMin(State(50, 500, 0, bossHp, bossDamage, [], 0), []));
  print(getMpSpentMin(State(10, 250, 0, 14, 8, [], 0), []));
}

(int, List<State>)? getMpSpentMin(State state, List<State> history) {
  (int, List<State>)? inner(State state, Spell spell, List<State> history) {
    final stateNew = state.copy();
    stateNew.castSpell(spell);
    stateNew.applyEffects();
    if (stateNew.bossHp <= 0) return (stateNew.mpSpent, history + [stateNew]);
    stateNew.bossAttack();
    if (stateNew.playerHp <= 0) return null;
    stateNew.applyEffects();
    if (stateNew.bossHp <= 0) return (stateNew.mpSpent, history + [stateNew]);

    return getMpSpentMin(stateNew, history + [stateNew]);
  }

  (int, List<State>)? manaSpentMin;

  for (final spell in spells) {
    if (spell.cost > state.playerMp) continue;

    final manaSpentCrnt = inner(state, spell, history);

    if (
      manaSpentCrnt != null && 
      (manaSpentMin == null || manaSpentMin.$1 > manaSpentCrnt.$1)
    ) {
      manaSpentMin = manaSpentCrnt;
    }
  }

  return manaSpentMin;
}

State cycle(State state, Spell spell) {
  final stateNew = state.copy();

  stateNew.applyEffects();
  stateNew.castSpell(spell);

  stateNew.applyEffects();
  if (stateNew.bossHp <= 0) return stateNew;
  stateNew.bossAttack();

  return stateNew;
}

enum EffectType {
  damage,
  armor,
  heal,
  recharge,
}

class Effect {
  final EffectType type;
  final int quantity;
  final int timer;

  const Effect(this.type, this.quantity, this.timer);

  @override
  String toString() {
    return '($type, $quantity, $timer)';
  }
}

class Spell {
  final int cost;
  final List<Effect> actions;

  const Spell(this.cost, this.actions);

  @override
  String toString() {
    return '$cost';
  }
}

class State {
  int playerHp;
  int playerMp;
  int playerArmor;
  int bossHp;
  int bossDamage;
  List<Effect> actions;
  int mpSpent;

  State(
    this.playerHp, this.playerMp, this.playerArmor,
    this.bossHp, this.bossDamage, this.actions, this.mpSpent
  );

  void applyEffects() {
    for (final action in actions) {
      switch (action.type) {
        case EffectType.damage: bossHp -= action.quantity; break;
        case EffectType.armor: playerArmor = action.quantity; break;
        case EffectType.heal: playerHp += action.quantity; break;
        case EffectType.recharge: playerMp += action.quantity; break;
      }
    }

    actions = actions
      .map((action) =>
        Effect(action.type, action.quantity, action.timer - 1)
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
    playerHp, playerMp, playerArmor, bossHp, bossDamage, List.from(actions),
    mpSpent
  );

  @override
  String toString() {
    return
      '\nPlayer: (HP: $playerHp, MP: $playerMp, Armor: $playerArmor)\n'
      'Boss: (HP: $bossHp, Damage: $bossDamage)\n'
      'Actions: $actions\n';
  }
}