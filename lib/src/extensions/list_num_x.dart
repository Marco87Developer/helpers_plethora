/// This extension provides additional functionality for `List<T extends num>`.
///
extension ListNumX<T extends num> on List<T> {
  /// Returns a list where each value corresponds to the sum of the elements up
  /// to that point of this list.
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

  /// Calculates and returns the sum of all the elements of this list.
  ///
  T sum(T initialValue) => fold(initialValue, (v1, v2) => v1 + v2 as T);
}
