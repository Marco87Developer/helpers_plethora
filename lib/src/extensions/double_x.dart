import 'package:intl/intl.dart';

/// This extension provides additional functionality for the `double` class.
///
extension DoubleX on double {
  /// Returns the corresponding string to this number, with thousands separator,
  /// depending on [locale].
  ///
  /// [decimals] indicates how many decimals exactly the number representation
  /// will have, regardless of how many decimal places this number has. If
  /// [decimals] is specified, [maxDecimals] is ignored.
  ///
  /// [maxDecimals] indicates the maximum number of decimal places that the
  /// representation of this number will have. In the event that the expression
  /// of this number with [maxDecimals] decimal digits has non-significant
  /// zeros, the decimal digits will be limited to the significant ones.
  ///
  String toStringWithThousands({
    int? decimals,
    String? locale,
    int maxDecimals = 1,
  }) {
    final StringBuffer buffer = StringBuffer()..write('#,###');

    if (decimals != null) {
      for (int i = 1; i <= decimals; i++) {
        i == 1 ? buffer.write('.0') : buffer.write('0');
      }
    } else {
      for (int i = 1; i <= maxDecimals; i++) {
        i == 1 ? buffer.write('.#') : buffer.write('#');
      }
    }

    return NumberFormat(buffer.toString(), locale).format(this);
  }
}
