class Int2D {
  int a;
  int b;

  Int2D(this.a, this.b);

  Int2D copy() {
    return Int2D(a, b);
  }

  operator +(Int2D other) {
    return Int2D(a + other.a, b + other.b);
  }

  operator -(Int2D other) {
    return Int2D(a - other.a, b - other.b);
  }

  operator %(int other) {
    return Int2D(a % other, b % other);
  }

  @override
  int get hashCode {
    return Object.hash(a, b);
  }

  @override
  operator ==(Object other) {
    return other is Int2D
      && a == other.a
      && b == other.b;
  }

  @override
  String toString() {
    return '($a, $b)';
  }
}