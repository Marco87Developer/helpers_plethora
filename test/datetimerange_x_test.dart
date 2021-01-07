import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:helpers_plethora/src/extensions/datetimerange_x.dart';

void main() {
  test('belongsTo()', () {
    final DateTimeRange ref = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 1, 31),
    );
    final DateTimeRange range1 = DateTimeRange(
      start: DateTime(2019, 12, 1),
      end: DateTime(2019, 12, 31),
    );
    final DateTimeRange range2 = DateTimeRange(
      start: DateTime(2019, 12, 1),
      end: DateTime(2020, 1, 1),
    );
    final DateTimeRange range3 = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 1, 10),
    );
    final DateTimeRange range4 = DateTimeRange(
      start: DateTime(2020, 1, 10),
      end: DateTime(2020, 1, 31),
    );
    final DateTimeRange range5 = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 1, 31),
    );
    final DateTimeRange range6 = DateTimeRange(
      start: DateTime(2020, 1, 10),
      end: DateTime(2020, 2, 1),
    );
    final DateTimeRange range7 = DateTimeRange(
      start: DateTime(2020, 2, 1),
      end: DateTime(2020, 2, 10),
    );

    expect(range1.belongsTo(ref), false);
    expect(range2.belongsTo(ref), false);
    expect(range3.belongsTo(ref), true);
    expect(range4.belongsTo(ref), true);
    expect(range5.belongsTo(ref), true);
    expect(range6.belongsTo(ref), false);
    expect(range7.belongsTo(ref), false);
  });

  test('overlapWith()', () {
    final DateTimeRange ref = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 1, 31),
    );
    final DateTimeRange range1 = DateTimeRange(
      start: DateTime(2019, 12, 1),
      end: DateTime(2019, 12, 31),
    );
    final DateTimeRange range2 = DateTimeRange(
      start: DateTime(2019, 12, 1),
      end: DateTime(2020, 1, 1),
    );
    final DateTimeRange range3 = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 1, 10),
    );
    final DateTimeRange range4 = DateTimeRange(
      start: DateTime(2020, 1, 10),
      end: DateTime(2020, 1, 31),
    );
    final DateTimeRange range5 = DateTimeRange(
      start: DateTime(2020, 1, 1),
      end: DateTime(2020, 1, 31),
    );
    final DateTimeRange range6 = DateTimeRange(
      start: DateTime(2020, 1, 10),
      end: DateTime(2020, 2, 1),
    );
    final DateTimeRange range7 = DateTimeRange(
      start: DateTime(2020, 2, 1),
      end: DateTime(2020, 2, 10),
    );

    expect(range1.overlapWith(ref), false);
    expect(range2.overlapWith(ref), true);
    expect(range3.overlapWith(ref), true);
    expect(range4.overlapWith(ref), true);
    expect(range5.overlapWith(ref), true);
    expect(range6.overlapWith(ref), true);
    expect(range7.overlapWith(ref), false);
  });
}
