extension StringExt on String {
  String setCharAt(int index, String char) {
    return
      substring(0, index) +
      char +
      substring(index+1);
  }

  int code() {
    return codeUnitAt(0);
  }

  String cutTail(int count) {
    return substring(0, length - count);
  }

  List<String> get chars {
    return runes.map((rune) => String.fromCharCode(rune)).toList();
  }
}