import 'package:helpers_plethora/src/extensions/int_extension.dart';
import 'package:test/test.dart';

void main() {
  group('toStringWithThousandsSeparator:', () {
    test(
      'Must return the matching string of this number, with the thousands'
      ' separator, which depends on [locale].',
      () {
        expect(123.toStringWithThousandsSeparator(), '123');
        expect(1234.toStringWithThousandsSeparator(), '1,234');
        expect(1234.toStringWithThousandsSeparator(locale: 'it-IT'), '1.234');
        expect(1234.toStringWithThousandsSeparator(locale: 'es-ES'), '1.234');
        expect(12345.toStringWithThousandsSeparator(), '12,345');
        expect(12345.toStringWithThousandsSeparator(locale: 'it-IT'), '12.345');
        expect(12345.toStringWithThousandsSeparator(locale: 'es-ES'), '12.345');
      },
    );
  });
}
