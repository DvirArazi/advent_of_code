import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

void main() {
  final lines = File('${getPath()}/input.txt').readAsLinesSync();

  final bossHp = int.tryParse(lines[0].split(' ')[2])!;
  final bossDamage = int.tryParse(lines[1].split(' ')[1])!;

  // print(getMpSpentMin(State(50, 500, 0, bossHp, bossDamage, [], 0), []));
  print(getMpSpentMin(State(10, 250, 0, 13, 8, [], 0), []));
}

(int, List<State>)? getMpSpentMin(State state, List<State> history) {
  (int, List<State>)? inner(State state, Spell spell, List<State> history) {
    final stateNew = state.copy();

    history = history + [stateNew.copy()];

    stateNew.castSpell(spell);
    stateNew.applyEffects();

    history = history + [stateNew.copy()];
    if (stateNew.bossHp <= 0)
      {return (stateNew.mpSpent, history);}

    stateNew.bossAttack();
    if (stateNew.playerHp <= 0)
      {return null;}
    stateNew.applyEffects();
    if (stateNew.bossHp <= 0)
      {return (stateNew.mpSpent, history);}

    return getMpSpentMin(stateNew, history);
  }

  (int, List<State>)? manaSpentMin;

  for (final spell in Spell.values) {
    if (
      spell.cost > state.playerMp ||
      state.effects.any((effect) => effect.spell.index == spell.index)
    ) continue;

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

enum Spell {
  missile(53, 1),
  drain(73, 1),
  shield(113, 6),
  poison(173, 6),
  recharge(229, 5);

  final int cost;
  final int timer;

  const Spell(this.cost, this.timer);
}

class Effect {
  final Spell spell;
  int timer;

  Effect(this.spell, this.timer);
}

class State {
  int playerHp;
  int playerMp;
  int playerArmor;
  int bossHp;
  int bossDamage;
  List<Effect> effects;
  int mpSpent;

  State(
    this.playerHp, this.playerMp, this.playerArmor,
    this.bossHp, this.bossDamage, this.effects, this.mpSpent
  );

  void applyEffects() {
    for (final effect in effects) {
      switch (effect.spell) {
        case Spell.missile: { bossHp -= 4; }
        case Spell.drain: { bossHp -= 2; playerHp += 2; }
        case Spell.shield: { playerArmor = 7; }
        case Spell.poison: { bossHp -= 3; }
        case Spell.recharge: { playerMp += 101; }
      }
    }

    for (final effect in effects) { effect.timer -= 1; }
    effects = effects.where((effect) => effect.timer > 0).toList();
  }

  void castSpell(Spell spell) {
    playerMp -= spell.cost;
    mpSpent += spell.cost;

    effects.add(Effect(spell, spell.timer));
  }

  void bossAttack() {
    var damage = bossDamage - playerArmor;
    playerHp -= damage > 1 ? damage : 1;

    playerArmor = 0;
  }

  State copy() => State(
    playerHp, playerMp, playerArmor, bossHp, bossDamage, effects.map((e) => e).toList(),
    mpSpent
  );

  @override
  String toString() {
    return
      '\nPlayer: (HP: $playerHp, MP: $playerMp, Armor: $playerArmor)\n'
      'Boss: (HP: $bossHp, Damage: $bossDamage)\n'
      'Actions: ${effects.map((e) => '(${e.spell.name}, ${e.timer})')}\n';
  }
}