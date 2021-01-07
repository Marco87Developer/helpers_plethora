import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/datetime_x.dart';

void main() {
  test('belongsTo()', () {
    final DateTimeRange dateTimeRange = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 3, 1),
    );
    final DateTime dateTime1 = DateTime(2019, 12, 31);
    final DateTime dateTime2 = DateTime(2020, 1, 1);
    final DateTime dateTime3 = DateTime(2020, 1, 15);
    final DateTime dateTime4 = DateTime(2020, 3, 1);
    final DateTime dateTime5 = DateTime(2020, 3, 2);

    expect(dateTime1.belongsTo(dateTimeRange), false);
    expect(dateTime2.belongsTo(dateTimeRange), true);
    expect(dateTime3.belongsTo(dateTimeRange), true);
    expect(dateTime4.belongsTo(dateTimeRange), true);
    expect(dateTime5.belongsTo(dateTimeRange), false);
  });

  test('isAfterOrAtSameMomentAs', () {
    final DateTime dateTime = DateTime(2020, 1, 1);
    final DateTime dateTimeBefore = DateTime(2019, 1, 1);
    final DateTime dateTimeSameMoment = DateTime(2020, 1, 1);
    final DateTime dateTimeAfter = DateTime(2020, 1, 2);

    expect(dateTime.isAfterOrAtSameMomentAs(dateTimeBefore), true);
    expect(dateTime.isAfterOrAtSameMomentAs(dateTimeSameMoment), true);
    expect(dateTime.isAfterOrAtSameMomentAs(dateTimeAfter), false);
  });

  test('isBeforeOrAtSameMomentAs', () {
    final DateTime dateTime = DateTime(2020, 1, 1);
    final DateTime dateTimeBefore = DateTime(2019, 1, 1);
    final DateTime dateTimeSameMoment = DateTime(2020, 1, 1);
    final DateTime dateTimeAfter = DateTime(2020, 1, 2);

    expect(dateTime.isBeforeOrAtSameMomentAs(dateTimeBefore), false);
    expect(dateTime.isBeforeOrAtSameMomentAs(dateTimeSameMoment), true);
    expect(dateTime.isBeforeOrAtSameMomentAs(dateTimeAfter), true);
  });

  test('isBetween() and isBetweenOrAtSameMomentAs()', () {
    final DateTime start = DateTime(2020, 1, 1);
    final DateTime end = DateTime(2020, 2, 1);
    final DateTime dateTime1 = DateTime(2019, 12, 31);
    final DateTime dateTime2 = DateTime(2020, 1, 1);
    final DateTime dateTime3 = DateTime(2020, 1, 10);
    final DateTime dateTime4 = DateTime(2020, 2, 1);
    final DateTime dateTime5 = DateTime(2020, 3, 1);

    expect(dateTime1.isBetween(start: start, end: end), false);
    expect(dateTime2.isBetween(start: start, end: end), false);
    expect(dateTime3.isBetween(start: start, end: end), true);
    expect(dateTime4.isBetween(start: start, end: end), false);
    expect(dateTime5.isBetween(start: start, end: end), false);

    expect(dateTime1.isBetweenOrAtSameMomentAs(start: start, end: end), false);
    expect(dateTime2.isBetweenOrAtSameMomentAs(start: start, end: end), true);
    expect(dateTime3.isBetweenOrAtSameMomentAs(start: start, end: end), true);
    expect(dateTime4.isBetweenOrAtSameMomentAs(start: start, end: end), true);
    expect(dateTime5.isBetweenOrAtSameMomentAs(start: start, end: end), false);
  });
}
