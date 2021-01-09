import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/string_x.dart';

void main() {
  test('firstUpperCase()', () {
    const String string1 = '';
    const String string2 = 'hey, how are you?';
    const String string3 = ' hello!';
    const String string4 = 'hello!';

    expect(string1.firstUpperCase(), '');
    expect(string2.firstUpperCase(), 'Hey, how are you?');
    expect(string3.firstUpperCase(), 'Hello!');
    expect(string3.firstUpperCase(trim: false), ' hello!');
    expect(string4.firstUpperCase(trim: false), 'Hello!');
  });

  test('firstsUpperCase()', () {
    const String string1 = '';
    const String string2 = 'hello, how are you?';
    const String string3 = ' hello, how are you?';

    expect(string1.firstsUppercase(), '');
    expect(string2.firstsUppercase(), 'Hello, How Are You?');
    expect(string2.firstsUppercase(splitPattern: '-'), 'hello, how are you?');
    expect(
      string3.firstsUppercase(trim: false),
      ' Hello, How Are You?',
    );
  });
}
