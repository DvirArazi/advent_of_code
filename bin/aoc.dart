import 'dart:io';

Future<void> main(List<String> args) async {
  if (args.length < 3 || args.length > 4) {
    stderr.writeln('Usage: dart run :aoc <year> <day> <part> [e]');
    stderr.writeln('Example: dart run :aoc 2025 1 1');
    stderr.writeln('Example input: dart run :aoc 2025 1 1 e');
    exitCode = 64;
    return;
  }

  final year = args[0];
  final day = int.parse(args[1]).toString().padLeft(2, '0');
  final part = int.parse(args[2]);

  final useExampleInput = args.length == 4 && args[3] == 'e';

  if (args.length == 4 && args[3] != 'e') {
    stderr.writeln('Unknown option: ${args[3]}');
    stderr.writeln('Use "e" to run with input_example.txt');
    exitCode = 64;
    return;
  }

  final dayDir = Directory('solutions/$year/day$day');
  final partFile = File('${dayDir.path}/part$part.dart');

  final inputFileName = useExampleInput ? 'input_example.txt' : 'input.txt';
  final inputFile = File('${dayDir.path}/$inputFileName');

  final runnerFile = File('${dayDir.path}/.aoc_runner.dart');

  if (!dayDir.existsSync()) {
    stderr.writeln('Day folder not found: ${dayDir.path}');
    exitCode = 1;
    return;
  }

  if (!partFile.existsSync()) {
    stderr.writeln('Part file not found: ${partFile.path}');
    exitCode = 1;
    return;
  }

  if (!inputFile.existsSync()) {
    stderr.writeln('Input file not found: ${inputFile.path}');
    exitCode = 1;
    return;
  }

  await runnerFile.writeAsString('''
import 'dart:io';

import 'part$part.dart' as solution;

void main() {
  final input = File('$inputFileName').readAsStringSync();
  final answer = solution.solve(input);
  print(answer);
}
''');

  try {
    final process = await Process.start(
      Platform.resolvedExecutable,
      ['run', '.aoc_runner.dart'],
      workingDirectory: dayDir.path,
      mode: ProcessStartMode.inheritStdio,
    );

    final code = await process.exitCode;
    exitCode = code;
  } finally {
    if (runnerFile.existsSync()) {
      runnerFile.deleteSync();
    }
  }
}