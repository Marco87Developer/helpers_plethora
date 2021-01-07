import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:helpers_plethora/src/extensions/list_datetimerange_x.dart';

void main() {
  test('duration getter', () {
    final List<DateTimeRange> initial = [
      DateTimeRange(start: DateTime(2020, 1, 1), end: DateTime(2020, 1, 31)),
      DateTimeRange(start: DateTime(2020, 1, 5), end: DateTime(2020, 2, 5)),
    ];

    expect(initial.duration, Duration(days: 35));
  });

  test('minimize()', () {
    final List<DateTimeRange> initial = [
      DateTimeRange(start: DateTime(2020, 1, 1), end: DateTime(2020, 1, 31)),
      DateTimeRange(start: DateTime(2020, 1, 5), end: DateTime(2020, 2, 1)),
      DateTimeRange(start: DateTime(2020, 2, 3), end: DateTime(2020, 3, 15)),
      DateTimeRange(start: DateTime(2020, 3, 15), end: DateTime(2020, 7, 8)),
      DateTimeRange(start: DateTime(2020, 8, 1), end: DateTime(2020, 11, 17)),
      DateTimeRange(start: DateTime(2020, 12, 1), end: DateTime(2020, 12, 31)),
    ];

    expect(initial.minimize(), [
      DateTimeRange(start: DateTime(2020, 1, 1), end: DateTime(2020, 2, 1)),
      DateTimeRange(start: DateTime(2020, 2, 3), end: DateTime(2020, 7, 8)),
      DateTimeRange(start: DateTime(2020, 8, 1), end: DateTime(2020, 11, 17)),
      DateTimeRange(start: DateTime(2020, 12, 1), end: DateTime(2020, 12, 31)),
    ]);
  });
}
