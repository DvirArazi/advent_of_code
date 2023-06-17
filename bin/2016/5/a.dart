import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:crypto/crypto.dart';

void main() {
  final id = File('${getPath()}/input.txt').readAsStringSync();

  var password = "";

  for (var i = 0; password.length < 8; i++) {
    final hash = md5.convert(utf8.encode(id + i.toString()));
    if (hash.toString().startsWith('00000')) password += hash.toString()[5];
  }

  print(password);
}