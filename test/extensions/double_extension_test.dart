import 'package:helpers_plethora/src/extensions/double_extension.dart';
import 'package:test/test.dart';

void main() {
  group('toStringWithThousandsSeparator:', () {
    test('Without parameters.', () {
      expect(1357.175.toStringWithThousandsSeparator(), '1,357.2');
    });
    test(
        '[decimals] indicates exactly how many decimals the'
        ' representation of this number will have.', () {
      expect(1357.175.toStringWithThousandsSeparator(decimals: 1), '1,357.2');
      expect(
        1357.175.toStringWithThousandsSeparator(decimals: 1, locale: 'it-IT'),
        '1.357,2',
      );
      expect(
        1357.175.toStringWithThousandsSeparator(decimals: 1, locale: 'es-ES'),
        '1.357,2',
      );
      expect(1357.175.toStringWithThousandsSeparator(decimals: 2), '1,357.17');
      expect(1357.176.toStringWithThousandsSeparator(decimals: 2), '1,357.18');
      expect(1357.175.toStringWithThousandsSeparator(decimals: 3), '1,357.175');
    });
    test('If [decimals] is specified, [maxDecimals] is ignored.', () {
      expect(
        1357.175.toStringWithThousandsSeparator(decimals: 3, maxDecimals: 2),
        '1,357.175',
      );
      expect(
        1357.175.toStringWithThousandsSeparator(
          decimals: 3,
          locale: 'it-IT',
          maxDecimals: 2,
        ),
        '1.357,175',
      );
      expect(
        1357.175.toStringWithThousandsSeparator(
          decimals: 3,
          locale: 'es-ES',
          maxDecimals: 2,
        ),
        '1.357,175',
      );
    });
    test(
      '[maxDecimals] indicates the maximum number of decimals that this'
      ' representation will have.',
      () {
        expect(
          1357.175.toStringWithThousandsSeparator(maxDecimals: 2),
          '1,357.17',
        );
        expect(
          1357.175
              .toStringWithThousandsSeparator(maxDecimals: 2, locale: 'it-IT'),
          '1.357,17',
        );
        expect(
          1357.175
              .toStringWithThousandsSeparator(maxDecimals: 2, locale: 'es-ES'),
          '1.357,17',
        );
        expect(
          1357.176.toStringWithThousandsSeparator(maxDecimals: 2),
          '1,357.18',
        );
        expect(
          1357.1750.toStringWithThousandsSeparator(maxDecimals: 4),
          '1,357.175',
        );
      },
    );
  });
}
