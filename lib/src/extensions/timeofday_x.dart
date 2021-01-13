import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// This extension provides additional functionality for the `TimeOfDay` class.
///
extension TimeOfDayX on TimeOfDay {
  /// Returns `true` if this time is after the [other] one.
  ///
  bool isAfter(TimeOfDay other) =>
      hour > other.hour || (hour == other.hour && minute > other.minute);

  /// Returns `true` if this time is before the [other] one.
  ///
  bool isBefore(TimeOfDay other) =>
      hour < other.hour || (hour == other.hour && minute < other.minute);

  /// Returns a string representation of this time, which shows:
  ///
  /// * the hours,
  /// * the minute.
  ///
  /// The localization is setted by [locale].
  ///
  String toStringHm({String? locale}) {
    initializeDateFormatting(locale);
    final DateTime dT = DateTime(0, 0, 0, hour, minute);
    return DateFormat.Hm(locale).format(dT);
  }
}
