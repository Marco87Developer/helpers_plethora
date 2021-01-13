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

  test('lastMonthDay()', () {
    final DateTime dateTime1 = DateTime(2020, 12, 31);
    final DateTime dateTime2 = DateTime(2020, 2, 5);
    final DateTime dateTime3 = DateTime(2021, 1, 10);

    expect(dateTime1.lastMonthDay, 31);
    expect(dateTime2.lastMonthDay, 29);
    expect(dateTime3.lastMonthDay, 31);
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

  test('toStringE()', () {
    final DateTime dateTime1 = DateTime(2020, 12, 31, 0, 30);

    expect(dateTime1.toStringE(), 'Thu');
    expect(dateTime1.toStringE(locale: 'it_IT'), 'gio');
    expect(dateTime1.toStringE(locale: 'it_IT', firstUpperCase: true), 'Gio');
  });

  test('toStringEEEE()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);

    expect(dateTime1.toStringEEEE(), 'Friday');
    expect(dateTime1.toStringEEEE(locale: 'it_IT'), 'venerdì');
    expect(dateTime1.toStringEEEE(locale: 'it_IT', firstUpperCase: true),
        'Venerdì');
  });

  test('toStringHm()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);

    expect(dateTime1.toStringHm(), '15:30');
    expect(dateTime1.toStringHm(locale: 'en_GB'), '15:30');
  });

  test('toStringMMM()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);

    expect(dateTime1.toStringMMM(), 'Jan');
    expect(dateTime1.toStringMMM(locale: 'it_IT'), 'gen');
    expect(dateTime1.toStringMMM(locale: 'it_IT', firstUpperCase: true), 'Gen');
  });

  test('toStringMMMM()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);

    expect(dateTime1.toStringMMMM(), 'January');
    expect(dateTime1.toStringMMMM(locale: 'it_IT'), 'gennaio');
    expect(dateTime1.toStringMMMM(locale: 'it_IT', firstUpperCase: true),
        'Gennaio');
  });

  test('toStringyMMd()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);
    final DateTime dateTime2 = DateTime(2020, 7, 7, 10, 35);

    expect(dateTime1.toStringyMMd(), '2021-01-01');
    expect(dateTime2.toStringyMMd(), '2020-07-07');
  });

  test('toStringyMMM()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);
    final DateTime dateTime2 = DateTime(2020, 7, 7, 10, 35);

    expect(dateTime1.toStringyMMM(), 'Jan 2021');
    expect(dateTime2.toStringyMMM(locale: 'it_IT'), 'lug 2020');
  });

  test('toStringyMMMd()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);
    final DateTime dateTime2 = DateTime(2020, 7, 7, 10, 35);

    expect(dateTime1.toStringyMMMd(), 'Jan 1, 2021');
    expect(dateTime1.toStringyMMMd(locale: 'it_IT'), '1 gen 2021');
    expect(dateTime2.toStringyMMMd(locale: 'it_IT'), '7 lug 2020');
  });

  test('toStringyMMMEd()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);
    final DateTime dateTime2 = DateTime(2020, 7, 7, 10, 35);

    expect(dateTime1.toStringyMMMEd(), 'Fri, Jan 1, 2021');
    expect(dateTime1.toStringyMMMEd(locale: 'it_IT'), 'ven 1 gen 2021');
    expect(dateTime2.toStringyMMMEd(locale: 'it_IT'), 'mar 7 lug 2020');
  });

  test('toStringyMMMM()', () {
    final DateTime dateTime1 = DateTime(2021, 1, 1, 15, 30);
    final DateTime dateTime2 = DateTime(2020, 7, 7, 10, 35);

    expect(dateTime1.toStringyMMMM(), 'January 2021');
    expect(dateTime1.toStringyMMMM(locale: 'it_IT'), 'gennaio 2021');
    expect(dateTime2.toStringyMMMM(locale: 'it_IT'), 'luglio 2020');
  });
}
