import 'dart:convert';
import 'dart:io';

void run() async {
  var charC = 0;

  await for (final line in File('lib/2015/8/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    charC += line.length;
    for (var i = 1; i < line.length - 1;) {
      i += 
        line[i] != '\\' ? 1 :
        line[i+1] == 'x' ? 4 : 2;
      
      charC--;
    }
  }

  print(charC);
}