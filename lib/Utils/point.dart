class Int2D {
  int x;
  int y;

  Int2D(this.x, this.y);

  Int2D copy() {
    return Int2D(x, y);
  }
}