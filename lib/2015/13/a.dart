import 'dart:io';

import 'package:advent_of_code/2015/13/utils.dart';
import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/list_of_list_ext.dart';
import 'package:advent_of_code/utils/ref.dart';

void run() {
  final lines = File('lib/2015/13/test_input.txt').readAsLinesSync();

  final peopleC = getPeopleC(lines.length);

  var people = List.generate(peopleC, (_) => '');

  var affections = List.generate(peopleC, (_) => 
    List.generate(peopleC-1, (_) => 0)
  );

  var peopleCursor = Ref(0);
  for (final line in lines) {
    final parts = line.split(' ');

    final person1 = parts[10];

    final person0I = getPersonIMut(people, peopleCursor, parts[0]);
    final person1I = getPersonIMut(people, peopleCursor,
      person1.substring(0, person1.length - 1)
    );
    
    affections[person0I][person1I + (person1I > person0I ? -1 : 0)] = 
      (parts[2] == 'gain' ? 1 : -1) *
      int.tryParse(parts[3])!;
    
  }

  final listsRest = getPermutations(peopleC-2);

  final perms = List.generate(((peopleC-1)/2).ceil(), (i) =>
    listsRest.map((listRest) =>
      [i+1] + listRest.map((item) =>
        item < i+1 ? item : item + 1
      ).toList()
    ).toList()
  ).combine()
    .map((list) =>
      [0] + list.map((item) => item + 1 ).toList()
    ).toList();

  var happinessMax = getHappiness(affections, perms[0]);

  for (final perm in perms.sublist(1)) {
    final happinessCrnt = getHappiness(affections, perm);
    if (happinessMax < happinessCrnt) happinessMax = happinessCrnt;
  }

  print(happinessMax);
}