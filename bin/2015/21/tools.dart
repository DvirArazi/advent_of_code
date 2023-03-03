import 'package:advent_of_code/utils/list_of_list_ext.dart';

class Item {
  final int cost;
  final int damage;
  final int armor;

  const Item(this.cost, this.damage, this.armor);
}

const weapons = [
  Item(8, 4, 0),
  Item(10, 5, 0),
  Item(25, 6, 0),
  Item(40, 7, 0),
  Item(74, 8, 0),
];
const armors = [
  Item(0, 0, 0),
  Item(13, 0, 1),
  Item(31, 0, 2),
  Item(53, 0, 3),
  Item(75, 0, 4),
  Item(102, 0, 5),
];
const rings = [
  Item(25, 1, 0),
  Item(50, 2, 0),
  Item(100, 3, 0),
  Item(20, 0, 1),
  Item(40, 0, 2),
  Item(80, 0, 3),
];

List<List<bool>> getOptions(int m, int n) {
  if (m == n) return [List.filled(m, true)];
  if (n == 1) return List.generate(m, (i) => List.generate(m, (j) => i == j));

  return 
    getOptions(m - 1, n - 1).map((tail) => [true] + tail).toList() +
    getOptions(m - 1, n).map((tail) => [false] + tail).toList();
}

List<List<bool>> getAllOptions(int m, int nMax) {
  return List.generate(nMax, (n) => getOptions(m, n + 1)).combine() +
    [List.filled(m, false)];
}

bool canWinBoss(
  int ph, int pa, int pd,
  int bh, int ba, int bd,
) {
  final pm = ba - pd;
  final bm = pa - bd;
  return (ph / (pm > 0 ? pm : 1)).ceil() >= (bh / (bm > 0 ? bm : 1)).ceil();
}

int getCostTotal(List<Item> items) {
  var total = 0;

  for (final item in items) {
    total += item.cost;
  }

  return total;
}

Item getTotal(List<Item> items) {
  var damageTotal = 0;
  var armorTotal = 0;
  var costTotal = 0;

  for (final item in items) {
    damageTotal += item.damage;
    armorTotal += item.armor;
    costTotal += item.cost;
  }

  return Item(costTotal, damageTotal, armorTotal);
}