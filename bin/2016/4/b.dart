
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';
import 'package:advent_of_code/utils/string_ext.dart';

import 'tools.dart';

void main() {
  final rooms = File('${getPath()}/input.txt')
    .readAsLinesSync()
    .map((line)=>RoomWithOrigin(line))
    .toList();

  for (final room in rooms) {
    if (room.isValid() && shift(room.origin, room.id).startsWith('north')) {
      // print('${shift(room.origin, room.id)} ${room.id}');
      print(room.id);
    }
  }
}

String shift(String origin, int times) {
  return origin.split('')
    .map((letter) => switch (letter) {
      '-' => ' ',
      _ => String.fromCharCode(
          (letter.code - 'a'.code + times) % 26 + 'a'.code
        )
    })
    .join();
}