library utils;

import 'dart:math';

import 'package:advent_of_code/utils/list_ext.dart';
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

int getHappiness(List<List<int>> affections, List<int> perm) {
  var happiness = 
    affections[perm[perm.length-1]][perm[0]] +
    affections[perm[perm.length-1]][perm[0]];

  for (var i = 0; i < perm.length - 1; i++) {
    final a = perm[i];
    final b = perm[i+1];
    happiness += affections[a][b + (b > a ? -1 : 0)];
  }

  return happiness;
}