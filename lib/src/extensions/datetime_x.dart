import 'package:flutter/material.dart';

/// This extension provides additional functionality for the `DateTime` class.
///
extension DateTimeX on DateTime {
  /// Returns `true` if this date belongs to the [dateTimeRange].
  ///
  bool belongsTo(DateTimeRange dateTimeRange) {
    final bool isIncluded =
        isAfter(dateTimeRange.start) && isBefore(dateTimeRange.end);
    final bool coincidesWithStart = isAtSameMomentAs(dateTimeRange.start);
    final bool coincidesWithEnd = isAtSameMomentAs(dateTimeRange.end);

    return isIncluded || coincidesWithEnd || coincidesWithStart;
  }

  /// Returns `true` if this date is after or at same moment as [other].
  ///
  bool isAfterOrAtSameMomentAs(DateTime other) =>
      isAfter(other) || isAtSameMomentAs(other);

  /// Returns `true` if this date is before or at same moment as [other].
  ///
  bool isBeforeOrAtSameMomentAs(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);

  /// Returns `true` if this date is between [start] and [end] ([start] < this <
  /// [end]).
  ///
  bool isBetween({
    required DateTime start,
    required DateTime end,
  }) {
    return isAfter(start) && isBefore(end);
  }

  /// Returns `true` if this date is between [start] and [end] or at same moment
  /// as [start] or as [end] ([start] ⩽ this ⩽ [end]).
  ///
  bool isBetweenOrAtSameMomentAs({
    required DateTime start,
    required DateTime end,
  }) {
    final bool isIncluded = isBetween(start: start, end: end);
    final bool coincidesWithStart = isAtSameMomentAs(start);
    final bool coincidesWithEnd = isAtSameMomentAs(end);

    return isIncluded || coincidesWithEnd || coincidesWithStart;
  }
}
