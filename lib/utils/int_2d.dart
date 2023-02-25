class Int2D {
  int a;
  int b;

  Int2D(this.a, this.b);

  Int2D copy() {
    return Int2D(a, b);
  }
}