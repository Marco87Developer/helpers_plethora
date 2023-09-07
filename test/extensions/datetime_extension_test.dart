import 'package:helpers_plethora/src/extensions/datetime_extension.dart';
import 'package:test/test.dart';

void main() {
  group('isAfterOrAtSameMomentAs:', () {
    test('With two different dates.', () {
      expect(
        DateTime(2022).isAfterOrAtSameMomentAs(DateTime(2021, 12, 7)),
        isTrue,
      );
      expect(
        DateTime(2022)
            .isAfterOrAtSameMomentAs(DateTime(2021, 12, 31, 12, 59, 59)),
        isTrue,
      );
    });
    test('With the same date.', () {
      expect(DateTime(2022).isAfterOrAtSameMomentAs(DateTime(2022)), isTrue);
      expect(
        DateTime(2022, 9, 7).isAfterOrAtSameMomentAs(DateTime(2022, 9, 7)),
        isTrue,
      );
    });
  });

  group('isBeforeOrAtSameMomentAs:', () {
    test('With two different dates.', () {
      expect(
        DateTime(2021, 12, 7).isBeforeOrAtSameMomentAs(DateTime(2022)),
        isTrue,
      );
      expect(
        DateTime(2021, 12, 31, 12, 59, 59)
            .isBeforeOrAtSameMomentAs(DateTime(2022)),
        isTrue,
      );
    });
    test('With the same date.', () {
      expect(DateTime(2022).isBeforeOrAtSameMomentAs(DateTime(2022)), isTrue);
      expect(
        DateTime(2022, 9, 7).isBeforeOrAtSameMomentAs(DateTime(2022, 9, 7)),
        isTrue,
      );
    });
  });

  group('isBetween:', () {
    test(
      'Must return true only when the date is between and not at the same'
      ' moment as.',
      () {
        expect(
          DateTime(2022).isBetween(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isFalse,
        );
        expect(
          DateTime(2022, 9).isBetween(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isFalse,
        );
        expect(
          DateTime(2022, 10).isBetween(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isFalse,
        );
        expect(
          DateTime(2022, 7, 5).isBetween(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isTrue,
        );
      },
    );
  });

  group('isBetweenOrAtSameMomentAs:', () {
    test(
      'Must return true only when the date is between and not at the same'
      ' moment as.',
      () {
        expect(
          DateTime(2022).isBetweenOrAtSameMomentAs(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isTrue,
        );
        expect(
          DateTime(2022, 9).isBetweenOrAtSameMomentAs(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isTrue,
        );
        expect(
          DateTime(2022, 10).isBetweenOrAtSameMomentAs(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isFalse,
        );
        expect(
          DateTime(2022, 7, 5).isBetweenOrAtSameMomentAs(
            start: DateTime(2022),
            end: DateTime(2022, 9),
          ),
          isTrue,
        );
      },
    );
  });

  group('onlyYMD:', () {
    test('Must return the same but without any time information.', () {
      expect(
        DateTime(2022, 7, 5, 0, 15, 1, 2, 3).onlyYMD,
        DateTime(2022, 7, 5),
      );
    });
    test(
        'Must return the same but without any time information. If this date'
        ' is UTC, the returned date will also be UTC.', () {
      expect(
        DateTime.utc(2022, 7, 5, 0, 15, 1, 2, 3).onlyYMD,
        DateTime.utc(2022, 7, 5),
      );
    });
  });

  group('thisMonthLastDay:', () {
    test('Must return the number of the last day of the month of this date.',
        () {
      expect(DateTime(2020, 2).thisMonthLastDay, 29);
      expect(DateTime(2022, 2).thisMonthLastDay, 28);
    });
  });

  group('toStringE:', () {
    test('With different [locale] and [firstUpperCase] parameters.', () async {
      await expectLater(await DateTime(2022, 9, 7).toStringE(), 'Wed');
      await expectLater(
        await DateTime(2022, 9, 7).toStringE(locale: 'it-IT'),
        'mer',
      );
      await expectLater(
        await DateTime(2022, 9, 7)
            .toStringE(locale: 'it-IT', firstUpperCase: true),
        'Mer',
      );
      await expectLater(
        await DateTime(2022, 9, 7).toStringE(locale: 'es-ES'),
        'mié',
      );
      await expectLater(
        await DateTime(2022, 9, 7)
            .toStringE(locale: 'es-ES', firstUpperCase: true),
        'Mié',
      );
    });
  });

  group('toStringEEEE:', () {
    test('With different [locale] and [firstUpperCase] parameters.', () async {
      await expectLater(await DateTime(2022, 9, 7).toStringEEEE(), 'Wednesday');
      await expectLater(
        await DateTime(2022, 9, 7).toStringEEEE(locale: 'it-IT'),
        'mercoledì',
      );
      await expectLater(
        await DateTime(2022, 9, 7)
            .toStringEEEE(locale: 'it-IT', firstUpperCase: true),
        'Mercoledì',
      );
      await expectLater(
        await DateTime(2022, 9, 7).toStringEEEE(locale: 'es-ES'),
        'miércoles',
      );
      await expectLater(
        await DateTime(2022, 9, 7)
            .toStringEEEE(locale: 'es-ES', firstUpperCase: true),
        'Miércoles',
      );
    });
  });

  group('toStringHm:', () {
    test(
      'Must return the localized string representation of the time of this date'
      ' in the “hour:minute” format.',
      () async {
        await expectLater(
          await DateTime(2022, 9, 8, 15, 15, 35).toStringHm(),
          '15:15',
        );
        await expectLater(
          await DateTime(2022, 9, 8, 7, 15, 35).toStringHm(locale: 'it-IT'),
          '07:15',
        );
        await expectLater(
          await DateTime(2022, 9, 8, 7, 15, 35).toStringHm(locale: 'es-ES'),
          '7:15',
        );
      },
    );
  });

  group('toStringMMM:', () {
    test(
      'Must return the localized string representation of this date with the'
      ' short name of the month of this date.',
      () async {
        await expectLater(await DateTime(2022, 9, 7).toStringMMM(), 'Sep');
        await expectLater(
          await DateTime(2022, 9, 7).toStringMMM(locale: 'it-IT'),
          'set',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringMMM(locale: 'it-IT', firstUpperCase: true),
          'Set',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringMMM(locale: 'es-ES'),
          'sept',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringMMM(locale: 'es-ES', firstUpperCase: true),
          'Sept',
        );
      },
    );
  });

  group('toStringMMMM:', () {
    test(
        'Must return the localized string representation of this date with the'
        ' full name of the month of this date.', () async {
      await expectLater(await DateTime(2022, 9, 7).toStringMMMM(), 'September');
      await expectLater(
        await DateTime(2022, 9, 7).toStringMMMM(locale: 'it-IT'),
        'settembre',
      );
      await expectLater(
        await DateTime(2022, 9, 7)
            .toStringMMMM(locale: 'it-IT', firstUpperCase: true),
        'Settembre',
      );
      await expectLater(
        await DateTime(2022, 9, 7).toStringMMMM(locale: 'es-ES'),
        'septiembre',
      );
      await expectLater(
        await DateTime(2022, 9, 7)
            .toStringMMMM(locale: 'es-ES', firstUpperCase: true),
        'Septiembre',
      );
    });
  });

  group('toStringyMMd:', () {
    test('Must return this date in the “yyyy-mm-dd” format.', () {
      expect(DateTime(2022).toStringyMMd(), '2022-01-01');
      expect(DateTime(2022, 7).toStringyMMd(), '2022-07-01');
      expect(DateTime(2022, 9, 7).toStringyMMd(), '2022-09-07');
    });
  });

  group('toStringyMMM:', () {
    test(
      'Returns the localized string representation of this date with the year'
      ' and the short name of the month.',
      () async {
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMM(),
          'Sep 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMM(locale: 'it-IT'),
          'set 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMM(locale: 'it-IT', firstUpperCase: true),
          'Set 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMM(locale: 'es-ES'),
          'sept 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMM(locale: 'es-ES', firstUpperCase: true),
          'Sept 2022',
        );
      },
    );
  });

  group('toStringyMMMd:', () {
    test(
      'Must return the localized string representation of this date with the'
      ' year, the short name of the month and the day number.',
      () async {
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMd(),
          'Sep 7, 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMd(locale: 'it-IT'),
          '7 set 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMd(locale: 'it-IT', firstUpperCase: true),
          '7 Set 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMd(locale: 'es-ES'),
          '7 sept 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMd(locale: 'es-ES', firstUpperCase: true),
          '7 Sept 2022',
        );
      },
    );
  });

  group('toStringyMMMEd:', () {
    test(
      'Must Return the localized string representation of this date with the'
      ' year, the short name of the month, the short name of the day and the'
      ' day number.',
      () async {
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMEd(),
          'Wed, Sep 7, 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMEd(locale: 'it-IT'),
          'mer 7 set 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMEd(locale: 'it-IT', firstsUpperCase: true),
          'Mer 7 Set 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMEd(locale: 'es-ES'),
          'mié, 7 sept 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMEd(locale: 'es-ES', firstsUpperCase: true),
          'Mié, 7 Sept 2022',
        );
      },
    );
  });

  group('toStringyMMMM:', () {
    test(
      'Must return the localized string representation of this date with the'
      ' year and the full name of the month.',
      () async {
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMM(),
          'September 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMM(locale: 'it-IT'),
          'settembre 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMM(locale: 'it-IT', firstUpperCase: true),
          'Settembre 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMM(locale: 'es-ES'),
          'septiembre de 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMM(locale: 'es-ES', firstUpperCase: true),
          'Septiembre de 2022',
        );
      },
    );
  });

  group('toStringyMMMMEEEEd:', () {
    test(
      'Must return the localized string representation of this date with the'
      ' year, the full name of the month, the full name of the day and the day'
      ' number.',
      () async {
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMMEEEEd(),
          'Wednesday, September 7, 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMMEEEEd(locale: 'it-IT'),
          'mercoledì 7 settembre 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMMEEEEd(locale: 'it-IT', firstUpperCase: true),
          'Mercoledì 7 settembre 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7).toStringyMMMMEEEEd(locale: 'es-ES'),
          'miércoles, 7 de septiembre de 2022',
        );
        await expectLater(
          await DateTime(2022, 9, 7)
              .toStringyMMMMEEEEd(locale: 'es-ES', firstUpperCase: true),
          'Miércoles, 7 de septiembre de 2022',
        );
      },
    );
  });
}
