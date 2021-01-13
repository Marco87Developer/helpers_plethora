/// This extension provides additional functionality for `List<T extends Comparable>`.
///
extension ListComparableX<T extends Comparable> on List<T> {
  /// Returns this list sorted and without any repetition.
  ///
  List<T> distinctSort() => {...this}.toList()..sort();
}
