import 'dart:convert';
import 'dart:io';
import 'dart:math';

void run() async {
  var total = 0;

  await for (final line in File('lib/2015/2/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
  ) {
    final ds = line.split('x').map((d)=>int.parse(d)).toList();
    final d0Min = min(ds[0], ds[1]);
    final d1Min = max(min(ds[0], ds[2]), min(ds[1], ds[2]));

    total += 2*(d0Min + d1Min) + ds[0]*ds[1]*ds[2];
  }

  print(total);
}