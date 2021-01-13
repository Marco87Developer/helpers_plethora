import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/timeofday_x.dart';

void main() {
  test('isAfter()', () {
    final TimeOfDay time1 = TimeOfDay(hour: 7, minute: 35);
    final TimeOfDay time2 = TimeOfDay(hour: 15, minute: 5);
    final TimeOfDay time3 = TimeOfDay(hour: 7, minute: 25);

    expect(time1.isAfter(time1), false);
    expect(time1.isAfter(time2), false);
    expect(time1.isAfter(time3), true);
    expect(time2.isAfter(time1), true);
  });

  test('isBefore()', () {
    final TimeOfDay time1 = TimeOfDay(hour: 7, minute: 35);
    final TimeOfDay time2 = TimeOfDay(hour: 15, minute: 5);
    final TimeOfDay time3 = TimeOfDay(hour: 7, minute: 25);

    expect(time1.isBefore(time1), false);
    expect(time1.isBefore(time2), true);
    expect(time1.isBefore(time3), false);
    expect(time2.isBefore(time1), false);
  });

  test('toStringHm()', () {
    final TimeOfDay time1 = TimeOfDay(hour: 7, minute: 35);
    final TimeOfDay time2 = TimeOfDay(hour: 15, minute: 5);

    expect(time1.toStringHm(), '07:35');
    expect(time1.toStringHm(locale: 'it_IT'), '07:35');
    expect(time2.toStringHm(), '15:05');
    expect(time2.toStringHm(locale: 'en_GB'), '15:05');
  });
}
