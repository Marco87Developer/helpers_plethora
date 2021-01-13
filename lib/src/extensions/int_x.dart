import 'package:intl/intl.dart';

/// This extension provides additional functionality for the `int` class.
///
extension IntX on int {
  /// Returns the corresponding string to this number, with thousands separator,
  /// depending on [locale].
  ///
  String toStringWithThousands({String? locale}) =>
      NumberFormat('#,###', locale).format(this);
}
