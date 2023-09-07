import 'package:intl/intl.dart';

/// This extension adds features to the [int] class.
///
extension IntExtension on int {
  /// Returns the **matching string** of this number, with the **thousands
  /// separator**, which depends on [locale].
  ///
  /// Examples:
  ///
  /// ```dart
  /// 123.toStringWithThousandsSeparator(); // '123'
  /// 1234.toStringWithThousandsSeparator(); // '1,234'
  /// 1234.toStringWithThousandsSeparator(locale: 'it-IT'); // '1.234'
  /// 1234.toStringWithThousandsSeparator(locale: 'es-ES'); // '1.234'
  /// 12345.toStringWithThousandsSeparator(); // '12,345'
  /// 12345.toStringWithThousandsSeparator(locale: 'it-IT'); // '12.345'
  /// 12345.toStringWithThousandsSeparator(locale: 'es-ES'); // '12.345'
  /// ```
  ///
  String toStringWithThousandsSeparator({final String? locale}) =>
      NumberFormat('#,###', locale).format(this);
}
