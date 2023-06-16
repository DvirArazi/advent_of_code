import 'package:advent_of_code/Utils/list_ext.dart';
import 'package:advent_of_code/utils/string_ext.dart';

class Room {
  late String letters; 
  late String checksum; 
  late int id;

  Room(String line) {
    final parts = line.split('[');
    final segmentsAndId = parts[0].split('-');

    letters = segmentsAndId.sub(0, -1).join();
    checksum = parts[1].sub(0, -1);
    id = int.tryParse(segmentsAndId.last)!;
  }

  bool isValid() {
    List<Check> checks = [];

    for (final letter in letters.chars) {
      final check = checks.find((check) => check.letter == letter);
      if (check != null) {
        check.count += 1;
      } else {
        checks.add(Check(letter, 1));
      }
    }

    checks.sort((a, b) {
      final diff = b.count - a.count;
      if (diff != 0) return diff;

      return a.letter.code - b.letter.code;
    });

    return checks.map((check) => check.letter).join().sub(0, 5) == checksum;
  }
}

class RoomWithOrigin extends Room {
  late String origin;

  RoomWithOrigin(String line) : super(line) {
    origin = line.split('-').sub(0, -1).join('-');
  }
}

class Check {
  String letter;
  int count;

  Check(this.letter, this.count);
}