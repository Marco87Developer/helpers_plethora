import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/int_x.dart';

void main() {
  test('toStringWithThousands()', () {
    const int int1 = 1234567;

    expect(int1.toStringWithThousands(), '1,234,567');
    expect(int1.toStringWithThousands(locale: 'it_IT'), '1.234.567');
  });
}
