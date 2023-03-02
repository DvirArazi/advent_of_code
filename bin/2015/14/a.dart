import 'dart:convert';
import 'dart:io';

import 'package:advent_of_code/utils/funcs.dart';

import 'tools.dart';

void main() async {
  const timeEnd = 2503;

  final lineStream = File('${getPath()}/input.txt')
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