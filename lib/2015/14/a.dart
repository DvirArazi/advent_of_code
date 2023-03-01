import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/2015/14/utils.dart';

void run() async {
  const timeEnd = 2503;

  final lineStream = File('lib/2015/14/input.txt')
    .openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter())
    .asBroadcastStream();

  var distanceMax = getDistanceByLine(timeEnd, await lineStream.first);

  await for (final line in lineStream) {
    final distanceCrnt = getDistanceByLine(timeEnd, line);
    if (distanceMax < distanceCrnt) distanceMax = distanceCrnt;
  }

  print(distanceMax);
}