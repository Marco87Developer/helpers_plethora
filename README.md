![](https://img.shields.io/badge/pub-v1.0.0-blue)

# Helpers

A set of helpers that extends various classes.

## `extension` on `DateTime` class

The following additional functionality are provided in this extension:

* `belongsTo()`. Returns `true` if this date belongs to a date-time range.
* `isAfterOrAtSameMomentAs()`. Returns `true` if this date is *after* or at same moment as other.
* `isBeforeOrAtSameMomentAs()`. Returns `true` if this date is *before* or at same moment as other.
* `isBetween()`. Returns `true` if this date is between `start` and `end` (start < this < `end`).
* `isBetweenOrAtSameMomentAs()`. Returns `true` if this date is between `start` and `end` or at same moment as `start` or as `end` (`start` ⩽ this ⩽ `end`).

## `extension` on `DateTimeRange` class

The following additional functionality are provided in this extension:

* `belongsTo()`. Returns `true` if this date-time range belongs to another one, that is, it’s completely included in the another.
* `overlapWith()`. Returns `true` if this date-time range overlaps, in part or completely, with another one.

## `extension` on `double` class

The following additional functionality are provided in this extension:

* `toStringWithThousands()`. Returns the corresponding string to this number, with thousands separator, depending on locale.

## `extension` on `int` class

The following additional functionality are provided in this extension:

* `toStringWithThousands()`. Returns the corresponding string to this number, with thousands separator, depending on locale.

## `extension` on `List<Comparable>`

The following additional functionality are provided in this extension:

* `distinctSort()`. Returns this list sorted and without any repetition.

## `extension` on `List<DateTimeRange>`

The following additional functionality are provided in this extension:

* `duration`. Returns the sum of all date-time ranges by counting overlapping ranges once. It uses the `minimize()` method in order to eliminate duplicate ranges where there are overlaps.
* `minimize()`. Returns a list of date-time ranges that cover the totality of the period of the sum of the ranges of this list, but without repeating any overlaps.

## `extension` on `List<num>`

The following additional functionality are provided in this extension:

* `progressiveSum()`. Returns a list where each value corresponds to the sum of the elements up to that point of this list.
* `sum()`. Calculates and returns the sum of all the elements of this list.

## `extension` on `String` class

The following additional functionality are provided in this extension:

* `firstUpperCase()`. Returns this string, but with 1º character uppercase.
* `firstsUppercase()`. Returns this string with the strings out of the split pattern with 1º character uppercase.

## `extension` on `TimeOfDay` class

The following additional functionality are provided in this extension:

* `isAfter()`. Returns `true` if this time is after another one.
* `isBefore()`. Returns `true` if this time is before another one.
* `toStringHm()`. Returns a string representation of this time, which shows the hours and the minutes.
