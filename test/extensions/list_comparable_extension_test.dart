import 'package:helpers_plethora/src/extensions/list_comparable_extension.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  group('distinctSort:', () {
    test('Must return this list sorted and without repetitions.', () {
      expect(
        [2, 3, 1, 2, 3, 4, 5, 6, 7, 7].distinctSort(),
        [1, 2, 3, 4, 5, 6, 7],
      );
      expect(
        [
          const MyTestClass(number: 2, string: 'c'),
          const MyTestClass(number: 1, string: 'b'),
          const MyTestClass(number: 2, string: 'a'),
          const MyTestClass(number: 1, string: 'b'),
        ].distinctSort(),
        [
          const MyTestClass(number: 1, string: 'b'),
          const MyTestClass(number: 2, string: 'a'),
          const MyTestClass(number: 2, string: 'c'),
        ],
      );
    });
  });
}

@immutable
class MyTestClass implements Comparable<MyTestClass> {
  const MyTestClass({
    required this.number,
    required this.string,
  });

  final double number;
  final String string;

  @override
  int compareTo(covariant final MyTestClass other) {
    // 1º comparison
    final int comparison1 = number.compareTo(other.number);
    if (comparison1 != 0) return comparison1;
    // Last comparison
    final int comparison2 = string.compareTo(other.string);
    return comparison2;
  }

  @override
  String toString() => 'Number: $number. String: $string.';

  @override
  bool operator ==(covariant final MyTestClass other) =>
      number == other.number && string == other.string;

  @override
  int get hashCode => Object.hash(number, string);
}
