class InfiniteMatrix<T> {
  final cantorMap = <int, MatrixItem<T>>{};

  T? get(int x, int y) => cantorMap[_cantor(x, y)]?.value;

  void set(int x, int y, T value) =>
      cantorMap[_cantor(x, y)] = MatrixItem(x, y, value);

  List<MatrixItem> get all => cantorMap.values.toList();

  int _cantor(int x, int y) {
    x = _transformSign(x);
    y = _transformSign(y);
    return (x + y) * (x + y + 1) ~/ 2 + y;
  }

  int _transformSign(int x) {
    if (x < 0) {
      return x * -2 - 1;
    } else {
      return x * 2;
    }
  }
}

class MatrixItem<T> {
  int x;
  int y;
  T value;

  MatrixItem(this.x, this.y, this.value);
}
