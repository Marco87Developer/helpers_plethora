import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/double_x.dart';

void main() {
  test('toStringWithThousands()', () {
    const double double1 = 45.1234567;
    const double double2 = -2;

    expect(double1.toStringWithThousands(), '45.1');
    expect(double1.toStringWithThousands(decimals: 0), '45');
    expect(double1.toStringWithThousands(decimals: 10), '45.1234567000');
    expect(
        double1.toStringWithThousands(decimals: 4, locale: 'it_IT'), '45,1235');
    expect(double1.toStringWithThousands(maxDecimals: 4), '45.1235');
    expect(double2.toStringWithThousands(), '-2');
    expect(double2.toStringWithThousands(decimals: 3), '-2.000');
  });
}
