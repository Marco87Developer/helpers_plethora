import 'package:flutter/material.dart';

import 'datetimerange_x.dart';

/// This extension provides additional functionality to a `List<DateTimeRange>`
/// instance.
///
extension ListOfDateTimeRangeX on List<DateTimeRange> {
  /// Returns the sum of all date-time ranges by counting overlapping ranges
  /// once.
  ///
  /// It uses the `minimize()` method in order to eliminate duplicate ranges
  /// where there are overlaps.
  ///
  Duration get duration {
    final List<DateTimeRange> minimized = minimize();

    return minimized.fold<Duration>(
      Duration(),
      (previousValue, element) => previousValue + element.duration,
    );
  }

  /// Returns a list of date-time ranges that cover the totality of the period
  /// of the sum of the ranges of this list, but without repeating any overlaps.
  ///
  List<DateTimeRange> minimize() {
    final List<DateTimeRange> result = [];
    List<DateTimeRange> resultTemp = [];

    /// Internal recursive method that is used to perform the necessary
    /// iterations.
    ///
    List<DateTimeRange> minimizeInternal(List<DateTimeRange> initial) {
      bool hasAnythingBeenRemoved = false;

      initial.sort((r1, r2) {
        // 1º comparison
        final int comparison1 = r1.start.compareTo(r2.start);
        if (comparison1 != 0) return comparison1;

        // Last comparison
        final int comparison2 = r1.start.compareTo(r2.start);
        return comparison2;
      });

      result.add(initial[0]);

      for (int i = 1; i < initial.length; i++) {
        if (initial[i].overlapWith(initial[i - 1])) {
          final List<DateTime> fourDates = [
            initial[i - 1].start,
            initial[i - 1].end,
            initial[i].start,
            initial[i].end,
          ]..sort();

          final DateTimeRange joinRange = DateTimeRange(
            start: fourDates.first,
            end: fourDates.last,
          );

          result
            ..removeLast()
            ..add(joinRange);

          hasAnythingBeenRemoved = true;
        } else {
          result.add(initial[i]);
        }
      }

      if (hasAnythingBeenRemoved) {
        resultTemp = [...result];
        result.clear();
        minimizeInternal(resultTemp);
      }

      return result;
    }

    minimizeInternal(this);

    return result;
  }
}
