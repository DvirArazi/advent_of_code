import 'dart:convert';
import 'dart:io';
import 'package:advent_of_code/utils/funcs.dart';
import 'package:crypto/crypto.dart' as crypto;

void main() {
  late int md5I;

  final key = File('${getPath()}/input.txt').readAsStringSync();

  for (var i = 0;; i++) {
    final hash = key + i.toString();
    final md5 = crypto.md5.convert(utf8.encode(hash)).toString();

    if (md5.startsWith('00000')) {
      md5I = i;
      break;
    }
  }

  print(md5I);
}