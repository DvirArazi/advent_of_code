// ignore_for_file: prefer_interpolation_to_compose_strings

library utils;

import 'dart:math';

import 'package:advent_of_code/utils/string_ext.dart';

String getPasswordNext(String password) {
  while(true) {
    for (var i = 0; i < password.length; i++) {
      final charCrnt = password[i];

      if (
        charCrnt == 'i' ||
        charCrnt == 'o' ||
        charCrnt == 'l'
      ) {
        password =
          password.substring(0, i) +
          getCharNext(charCrnt)! +
          List.filled(password.length - i - 1, 'a').join();

        //continue; no need for a continue here as its the first check
      }
    }

    bool checkStraight = false;
    for (var i = 0; i < password.length - 3; i++) {
      var charCrnt = password[i];

      int codeCrnt = charCrnt.codeUnitAt(0);
      if (
        password[i+1].codeUnitAt(0) == codeCrnt + 1 &&
        password[i+2].codeUnitAt(0) == codeCrnt + 2
      ) {
        checkStraight = true;
        break;
      }
    }
    if (!checkStraight) {
      //This can be faster
      //but implementing this is difficult
      //==================================

      // final tripletNext = getTripletNext(
      //   password.substring(password.length - 3)
      // );

      // final passwordStart = password.substring(0, password.length - 3);

      // password = tripletNext != null ?
      //   passwordStart + tripletNext :
      //   getSequenceNext(passwordStart) + 'abc';
      password = getSequenceNext(password);

      continue;
    }

    var pairsC = 0;
    for (var i = 0; i < password.length - 1;) {
      if (password[i] == password[i+1]) {
        pairsC++;
        i += 2;
        continue;
      }

      i++;
    }

    //This can be faster
    //but implementing this is difficult
    //==================================
    // if (pairsC < 1) {
    //   password =
    //     password.substring(0, password.length - 4) +
    //     getPairNext(password.substring(4, 6)) +
    //     'aa';

    //   continue;
    // }

    // if (pairsC < 2) {
    //   password = 
    //     password.substring(0, password.length - 2) +
    //     getPairNext(password.substring(6));

    //   continue;
    // }
    if (pairsC < 2) { 
      password = getSequenceNext(password);
      continue;
    }

    break;
  }

  return password;
}

String? getCharNext(String char) {
  if (char == 'z') return null;

  return String.fromCharCode(char.code() + 1);
}

String? getPairNext(String chars) {
  final a = chars[0];
  final b = chars[1];

  if (a == b) {
    final charNext = getCharNext(a);
    if (charNext == null) return null;

    return charNext + charNext;
  }

  return a.code() > b.code() ? a + a : b + b;
}

String getSequenceNext(String sequence) {
  for(var i = sequence.length - 1; i >= 0; i--) {    
    final charNext = getCharNext(sequence[i]);
    if (charNext != null) {
      sequence = sequence.setCharAt(i, charNext);
      break;
    }

    sequence = sequence.setCharAt(i, 'a');
  }

  return sequence;
}

String? getTripletNext(String chars) {
  final a = chars[0];
  final b = chars[1];
  final c = chars[2];
  final ac = a.code();
  final bc = b.code();
  final cc = c.code();

  final charMax = String.fromCharCode(max(ac, max(bc, cc)));
  final charMaxNext = getCharNext(charMax);
  if (charMaxNext == null) return null;
  final charMaxNextNext = getCharNext(charMaxNext);
  if (charMaxNextNext == null) return null;

  return
    charMax +
    charMaxNext +
    charMaxNextNext;
}