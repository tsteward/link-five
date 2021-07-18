import 'package:flutter_test/flutter_test.dart';
import 'package:link_five/src/game_logic/infinite_matrix.dart';

void main() {
  test('Read and Write to Infinite Matrix', () {
    final matrix = InfiniteMatrix<int>();

    var i = 0;
    for (var x = -5; x <= 5; x++) {
      for (var y = -5; y <= 5; y++) {
        matrix.set(x, y, i);
        i++;
      }
    }

    i = 0;
    for (var x = -5; x <= 5; x++) {
      for (var y = -5; y <= 5; y++) {
        expect(matrix.get(x, y), equals(i));
        i++;
      }
    }

    for (var i = -5; i <= 5; i++) {
      expect(matrix.get(-6, i), isNull);
      expect(matrix.get(6, i), isNull);
      expect(matrix.get(i, -6), isNull);
      expect(matrix.get(i, 6), isNull);
    }
  });
}
