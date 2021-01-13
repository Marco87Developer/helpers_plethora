import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/list_num_x.dart';

void main() {
  test('progressiveSum()', () {
    final List<int> intList = [1, 5, 2, -1, 7, 0, 2];
    final List<double> doubleList = [-1.5, 1.5, 5, -1, 3, 10, -5];

    expect(intList.progressiveSum(), [1, 6, 8, 7, 14, 14, 16]);
    expect(doubleList.progressiveSum(), [-1.5, 0, 5, 4, 7, 17, 12]);
  });

  test('sum()', () {
    final List<int> intList = [1, 5, 2, -1, 7, 0, 2];
    final List<double> doubleList = [-1.5, 1.5, 5, -1, 3, 10, -5];

    expect(intList.sum(0), 16);
    expect(intList.sum(1), 17);
    expect(doubleList.sum(0), 12);
    expect(doubleList.sum(-2), 10);
  });
}
