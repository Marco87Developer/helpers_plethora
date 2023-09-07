import 'package:helpers_plethora/src/extensions/list_num_extension.dart';
import 'package:test/test.dart';

void main() {
  group('progressiveSum:', () {
    test(
      'Must return a list of numbers, where each one is equal to the sum of the'
      ' elements of this list up to that point.',
      () {
        expect(<double>[].progressiveSum(), <double>[]);
        expect([1, 2, 3, 4, 5].progressiveSum(), [1, 3, 6, 10, 15]);
        expect([1, 3, 2, 5, 4].progressiveSum(), [1, 4, 6, 11, 15]);
        expect(
          [1.25, -3, 2.05, -2, 15.7].progressiveSum(),
          [
            1.25,
            1.25 - 3,
            1.25 - 3 + 2.05,
            1.25 - 3 + 2.05 - 2,
            1.25 - 3 + 2.05 - 2 + 15.7,
          ],
        );
      },
    );
  });
}
