![](https://img.shields.io/badge/pub-0.1.0--nullsafety.1-yellow)

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

## `extension` on `List<DateTimeRange>`

The following additional functionality are provided in this extension:

* `duration`. Returns the sum of all date-time ranges by counting overlapping ranges once. It uses the `minimize()` method in order to eliminate duplicate ranges where there are overlaps.
* `minimize()`. Returns a list of date-time ranges that cover the totality of the period of the sum of the ranges of this list, but without repeating any overlaps.
