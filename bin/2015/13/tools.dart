library utils;

import 'dart:io';
import 'dart:math';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/int_2d.dart';
import 'package:advent_of_code/utils/list_ext.dart';
import 'package:advent_of_code/utils/list_of_list_ext.dart';
import 'package:advent_of_code/utils/ref.dart';

int getPeopleC(int number) {
  return (1+sqrt(1+4*number).floor())~/2;
}

int getPersonIMut(List<String> people, Ref<int> cursor, String person) {
  final personI = people.sublist(0, cursor.value).findI((p) => p == person);

  if (personI == null) {
    people[cursor.value] = person;
    cursor.value++;
    return cursor.value - 1;
  }

  return personI;
}

Int2D getAffectionI(List<List<int>> affections, int per0I, int per1I) {
  return per0I < per1I ?
    Int2D(per0I, per1I-per0I-1) :
    Int2D(per1I, per0I-per1I-1);
}

int getHappiness(List<List<int>> affections, List<int> perm) {
  final aI = getAffectionI(affections, perm[perm.length-1], perm[0]);
  var happiness = affections[aI.a][aI.b];

  for (var i = 0; i < perm.length - 1; i++) {
    final aI = getAffectionI(affections, perm[i], perm[i+1]);
    happiness += affections[aI.a][aI.b];
  }

  return happiness;
}

int solve(int blanksC) {
  final lines = File('${getPath()}/input.txt').readAsLinesSync();

  final peopleC = getPeopleC(lines.length) + blanksC;

  var people = List.generate(peopleC, (_) => '');

  var affections = List.generate(peopleC-1, (i) => 
    List.generate(peopleC-1-i, (_) => 0)
  );

  var peopleCursor = Ref(0);
  for (final line in lines) {
    final parts = line.split(' ');

    final per1 = parts[10];

    final per0I = getPersonIMut(people, peopleCursor, parts[0]);
    final per1I = getPersonIMut(people, peopleCursor,
      per1.substring(0, per1.length - 1)
    );
    
    final aI = getAffectionI(affections, per0I, per1I);
    affections[aI.a][aI.b] += 
      (parts[2] == 'gain' ? 1 : -1) *
      int.tryParse(parts[3])!;
  }

  final listsRest = getPermutations(peopleC-2);

  final perms = List.generate(((peopleC-1)/2).ceil(), (i) =>
    listsRest.map((listRest) =>
      [i] + listRest.map((item) =>
        item < i ? item : item + 1
      ).toList()
    ).toList()
  ).combine()
    .map((list) =>
      [0] + list.map((item) => item + 1).toList()
    ).toList();

  var happinessMax = getHappiness(affections, perms[0]);

  for (final perm in perms.sublist(1)) {
    final happinessCrnt = getHappiness(affections, perm);
    if (happinessMax < happinessCrnt) happinessMax = happinessCrnt;
  }

  return happinessMax;
}