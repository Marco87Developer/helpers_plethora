import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/list_comparable_x.dart';

void main() {
  test('distinctSort()', () {
    final List<double> listDouble = [-1, 2.0, 3, 4.5, 5.7, 5.7, -1];
    final List<String> listString = ['a', 'z', 'd', 'c', 'c', 'z', 'p'];

    expect(listDouble.distinctSort(), [-1, 2, 3, 4.5, 5.7]);
    expect(listString.distinctSort(), ['a', 'c', 'd', 'p', 'z']);
  });
}
