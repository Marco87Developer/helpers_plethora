import 'package:intl/intl.dart';

/// This extension adds features to the [double] class.
///
extension DoubleExtension on double {
  /// Returns the **matching string** of this number, with the **thousands
  /// separator**, which depends on [locale].
  ///
  /// [decimals] indicates exactly how many decimals the representation of this
  /// number will have, regardless of how many decimals this number has. If
  /// [decimals] is specified, [maxDecimals] is ignored.
  ///
  /// [maxDecimals] indicates the maximum number of decimals that this
  /// representation will have. In the event that this representation would end
  /// with non-significant zeros, the latter would be eliminated, and this
  /// representation will contain only the significant decimal places.
  ///
  /// Examples:
  ///
  /// ```dart
  /// 1357.175.toStringWithThousandsSeparator(); // '1,357.2'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 1); // '1,357.2'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 1, locale: 'it-IT'); // '1.357,2'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 1, locale: 'es-ES'); // '1.357,2'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 2); // '1,357.17'
  /// 1357.176.toStringWithThousandsSeparator(decimals: 2); // '1,357.18'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 3); // '1,357.175'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 3, maxDecimals: 2); // '1,357.175'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 3, locale: 'it-IT', maxDecimals: 2); // '1.357,175'
  /// 1357.175.toStringWithThousandsSeparator(decimals: 3, locale: 'es-ES', maxDecimals: 2); // '1.357,175'
  /// 1357.175.toStringWithThousandsSeparator(maxDecimals: 2); // '1,357.17'
  /// 1357.175.toStringWithThousandsSeparator(maxDecimals: 2, locale: 'it-IT'); // '1.357,17'
  /// 1357.175.toStringWithThousandsSeparator(maxDecimals: 2, locale: 'es-ES'); // '1.357,17'
  /// 1357.176.toStringWithThousandsSeparator(maxDecimals: 2); // '1,357.18'
  /// 1357.1750.toStringWithThousandsSeparator(maxDecimals: 4); // '1,357.175'
  /// ```
  ///
  String toStringWithThousandsSeparator({
    final int? decimals,
    final String? locale,
    final int maxDecimals = 1,
  }) {
    final StringBuffer buffer = StringBuffer('#,###');

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
