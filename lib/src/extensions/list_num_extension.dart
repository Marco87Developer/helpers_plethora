/// This extension adds features to the [List<T extends num>] class.
///
extension ListNumExtension<T extends num> on List<T> {
  /// Returns a list of numbers, where **each one is equal to the sum of the
  /// elements of this list *up to* that point**.
  ///
  /// Examples:
  ///
  /// ```dart
  /// <double>[].progressiveSum(); // <double>[]
  /// [1, 2, 3, 4, 5].progressiveSum(); // [1, 3, 6, 10, 15]
  /// [1, 3, 2, 5, 4].progressiveSum(); // [1, 4, 6, 11, 15]
  /// [1.25, -3, 2.05, -2, 15.7].progressiveSum();
  ///     // [
  ///     //   1.25,
  ///     //   1.25 - 3,
  ///     //   1.25 - 3 + 2.05,
  ///     //   1.25 - 3 + 2.05 - 2,
  ///     //   1.25 - 3 + 2.05 - 2 + 15.7,
  ///     // ]
  /// ```
  ///
  List<T> progressiveSum() {
    final List<T> progressive = [];
    for (int i = 0; i < length; i++) {
      var sum = T == int ? 0 : 0.0;
      for (int k = 0; k <= i; k++) {
        sum += this[k];
      }
      progressive.add(sum as T);
    }
    return progressive;
  }
}
