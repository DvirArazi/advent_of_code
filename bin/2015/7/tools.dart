library utils;

Map<String, Wire> getWires(List<String> lines) {
  final Map<String, Wire> wires = {};

  for (final line in lines) {
    final parts = line.split(' -> ');
    final signal = int.tryParse(parts[0]);

    wires[parts[1]] = signal == null ? 
      WireUnsolved(parts[0]) :
      WireSolved(signal);
  }

  return wires;
}

int solveMut(Map<String, Wire> wires, String iden) {
  var signal = int.tryParse(iden);

  if (signal != null) return signal;

  signal = ((){
    final wire = wires[iden]!;

    if (wire is WireSolved) return wire.signal;

    if (wire is! WireUnsolved) throw Exception();

    final parts = wire.instruction.split(' ');

    if (parts[0] == 'NOT') {
      return ~solveMut(wires, parts[1]);
    }

    if (parts.length == 1) {
      return solveMut(wires, parts[0]);
    }

    if (parts[1] == 'AND') {
      return solveMut(wires, parts[0]) & solveMut(wires, parts[2]);
    }

    if (parts[1] == 'OR') {
      return solveMut(wires, parts[0]) | solveMut(wires, parts[2]);
    }

    if (parts[1] == 'LSHIFT') {
      return solveMut(wires, parts[0]) << int.tryParse(parts[2])!;
    }

    if (parts[1] == 'RSHIFT') {
      return solveMut(wires, parts[0]) >> int.tryParse(parts[2])!;
    }

    throw Exception();
  })();

  wires[iden] = WireSolved(signal);

  return signal;
} 

abstract class Wire {}

class WireUnsolved extends Wire {
  String instruction;

  WireUnsolved(this.instruction);
}

class WireSolved extends Wire {
  int signal;

  WireSolved(this.signal);
}