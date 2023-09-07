import 'package:helpers_plethora/src/extensions/string_extension.dart';
import 'package:test/test.dart';

void main() {
  group('allCurrenciesSymbols:', () {
    test('If no currency symbol is encountered, an empty list is returned.',
        () {
      expect(''.allCurrenciesSymbols(), <String>[]);
      expect(
        'A string with no currency.'.allCurrenciesSymbols(),
        <String>[],
      );
    });
    test(
      'If the string contains some currency symbol, a list with them is'
      ' returned.',
      () {
        expect('This is the euro symbol: €.'.allCurrenciesSymbols(), ['€']);
        expect(
          r'This is the euro symbol: €. And this is the dollar symbol: $.'
              .allCurrenciesSymbols(),
          ['€', r'$'],
        );
        expect(
          r'This is the dollar symbol: $. And this is the euro symbol: €.'
              .allCurrenciesSymbols(),
          [r'$', '€'],
        );
      },
    );
  });

  group('firstCurrencySymbol:', () {
    test('If no currency symbol is encountered, an empty string is returned.',
        () {
      expect(''.firstCurrencySymbol(), '');
      expect('A string with no currency.'.firstCurrencySymbol(), '');
    });
    test(
      'If the string contains some currency symbol, the first one is returned.',
      () {
        expect('This is the euro symbol: €.'.firstCurrencySymbol(), '€');
        expect(
          r'This is the euro symbol: €. And this is the dollar symbol: $.'
              .firstCurrencySymbol(),
          '€',
        );
        expect(
          r'This is the dollar symbol: $. And this is the euro symbol: €.'
              .firstCurrencySymbol(),
          r'$',
        );
      },
    );
  });

  group('firstsUpperCase:', () {
    test(
      'Before anything a trim will be applied. With the default parameters as a'
      ' split pattern a space string will be used.',
      () {
        expect(
          ' This package is helpers_plethora. '.firstsUpperCase(),
          'This Package Is Helpers_plethora.',
        );
      },
    );
    test(
      'Before anything a trim will be applied. With _ split pattern.',
      () {
        expect(
          ' This package is helpers_plethora. '
              .firstsUpperCase(splitPattern: '_'),
          'This package is helpers_Plethora.',
        );
      },
    );
    test(
      'With _ split pattern and without a trim.',
      () {
        expect(
          ' This package is helpers_plethora. '
              .firstsUpperCase(splitPattern: '_', trim: false),
          ' This package is helpers_Plethora. ',
        );
      },
    );
  });

  group('firstUpperCase:', () {
    test(
      'Before anything a trim will be applied. With the default parameters as a'
      ' split pattern a space string will be used.',
      () {
        expect(
          ' this package is helpers_plethora. '.firstUpperCase(),
          'This package is helpers_plethora.',
        );
      },
    );
    test(
      'Without a trim.',
      () {
        expect(
          ' this package is helpers_plethora. '.firstUpperCase(trim: false),
          ' This package is helpers_plethora. ',
        );
      },
    );
  });
}
