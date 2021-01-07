import 'package:flutter/material.dart';

import 'datetime_x.dart';

/// This extension provides additional functionality for the `DateTimeRange`
/// class.
///
extension DateTimeRangeX on DateTimeRange {
  /// Returns `true` if this date-time range belongs to the [other], that is,
  /// it’s completely included in the [other].
  ///
  bool belongsTo(DateTimeRange other) {
    final bool startBelongsTo = start.belongsTo(other);
    final bool endBelongsTo = end.belongsTo(other);

    return startBelongsTo && endBelongsTo;
  }

  /// Returns `true` if this date-time range overlaps, in part or completely,
  /// with the [other].
  ///
  bool overlapWith(DateTimeRange other) {
    final bool startBelongsTo = start.belongsTo(other);
    final bool endBelongsTo = end.belongsTo(other);

    return startBelongsTo || endBelongsTo;
  }
}
