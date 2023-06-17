import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';
import 'package:crypto/crypto.dart';

void main() {
  final id = File('${getPath()}/input.txt').readAsStringSync();

  var password = "********";
  var foundC = 0;

  for (var i = 0; foundC < 8; i++) {
    final hash = md5.convert(utf8.encode(id + i.toString()));
    final hashStr = hash.toString();
    final pos = int.tryParse(hashStr[5]);

    if (
      hashStr.startsWith('00000') &&
      pos != null && pos < 8 &&
      password[pos] == '*'
    ) {
      password = password.setCharAt(pos, hashStr[6]);
      foundC++;
      print(password);
    }
  }

  print(password);
}