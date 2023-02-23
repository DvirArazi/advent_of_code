import 'dart:convert';
import 'dart:io';

void run() async {
  var result = 0;

  await for (final data in File('lib/2015/1/input.txt')
    .openRead()
    .transform(utf8.decoder)
  ) {
    for(final rune in data.runes) {
      final char = String.fromCharCode(rune);
      result += char == '(' ? 1 : -1;
    }
  }

  print(result);
}