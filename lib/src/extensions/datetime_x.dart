import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'string_x.dart';

/// This extension provides additional functionality for the `DateTime` class.
///
extension DateTimeX on DateTime {
  /// Returns `true` if this date belongs to the [dateTimeRange].
  ///
  bool belongsTo(DateTimeRange dateTimeRange) {
    final bool isIncluded =
        isAfter(dateTimeRange.start) && isBefore(dateTimeRange.end);
    final bool coincidesWithStart = isAtSameMomentAs(dateTimeRange.start);
    final bool coincidesWithEnd = isAtSameMomentAs(dateTimeRange.end);

    return isIncluded || coincidesWithEnd || coincidesWithStart;
  }

  /// Returns the number of the last day of the month, starting from this
  /// date-time.
  ///
  int get lastMonthDay => DateTime(year, month + 1, 0).day;

  /// Returns `true` if this date is after or at same moment as [other].
  ///
  bool isAfterOrAtSameMomentAs(DateTime other) =>
      isAfter(other) || isAtSameMomentAs(other);

  /// Returns `true` if this date is before or at same moment as [other].
  ///
  bool isBeforeOrAtSameMomentAs(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);

  /// Returns `true` if this date is between [start] and [end] ([start] < this <
  /// [end]).
  ///
  bool isBetween({
    required DateTime start,
    required DateTime end,
  }) {
    return isAfter(start) && isBefore(end);
  }

  /// Returns `true` if this date is between [start] and [end] or at same moment
  /// as [start] or as [end] ([start] ⩽ this ⩽ [end]).
  ///
  bool isBetweenOrAtSameMomentAs({
    required DateTime start,
    required DateTime end,
  }) {
    final bool isIncluded = isBetween(start: start, end: end);
    final bool coincidesWithStart = isAtSameMomentAs(start);
    final bool coincidesWithEnd = isAtSameMomentAs(end);

    return isIncluded || coincidesWithEnd || coincidesWithStart;
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the *short* name of the day of the week
  ///
  /// of this date. The localization is setted by [locale]. You can assure that
  /// the 1º letter will be uppercase by setting [firstUpperCase] to `true`.
  ///
  String toStringE({
    String? locale,
    bool firstUpperCase = false,
  }) {
    initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.E(locale).format(this).firstUpperCase()
        : DateFormat.E(locale).format(this);
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the *complete* name of the day of the week
  ///
  /// of this date. The localization is setted by [locale]. You can assure that
  /// the 1º letter will be uppercase by setting [firstUpperCase] to `true`.
  ///
  String toStringEEEE({
    String? locale,
    bool firstUpperCase = false,
  }) {
    initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.EEEE(locale).format(this).firstUpperCase()
        : DateFormat.EEEE(locale).format(this);
  }

  /// Returns the localized string representation of:
  ///
  /// * this time
  ///
  /// in the “hh:mm” format. The localization is setted by [locale].
  ///
  String toStringHm({
    String? locale,
  }) {
    initializeDateFormatting(locale);

    return DateFormat.Hm(locale).format(this).firstUpperCase();
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the *short* month name
  ///
  /// this date belongs to. The localization is setted by [locale]. You can
  /// assure that the 1º letter will be uppercase by setting [firstUpperCase] to
  /// `true`.
  ///
  String toStringMMM({
    String? locale,
    bool firstUpperCase = false,
  }) {
    initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.MMM(locale).format(this).firstUpperCase()
        : DateFormat.MMM(locale).format(this);
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the *complete* month name
  ///
  /// this date belongs to. The localization is setted by [locale]. You can
  /// assure that the 1º letter will be uppercase by setting [firstUpperCase] to
  /// `true`.
  ///
  String toStringMMMM({
    String? locale,
    bool firstUpperCase = false,
  }) {
    initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.MMMM(locale).format(this).firstUpperCase()
        : DateFormat.MMMM(locale).format(this);
  }

  /// Returns the string representation of this date in the “yyyy-mm-dd” format.
  ///
  String toStringyMMd() => DateFormat().addPattern('y-MM-dd').format(this);

  /// Returns the localized string representation of this date with:
  ///
  /// * the [year],
  /// * the *short* [month] name,
  /// * the [day] number.
  ///
  /// The localization is setted by [locale].
  ///
  String toStringyMMMd({
    String? locale,
  }) {
    initializeDateFormatting(locale);

    return DateFormat.yMMMd(locale).format(this);
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the [year],
  /// * the *short* [month] name,
  /// * the *short* [day] name,
  /// * the [day] number.
  ///
  /// The localization is setted by [locale].
  ///
  String toStringyMMMEd({
    String? locale,
  }) {
    initializeDateFormatting(locale);

    return DateFormat.yMMMEd(locale).format(this);
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the [year],
  /// * the *short* [month] name.
  ///
  /// The localization is setted by [locale].
  ///
  String toStringyMMM({
    String? locale,
  }) {
    initializeDateFormatting(locale);

    return DateFormat.yMMM(locale).format(this);
  }

  /// Returns the localized string representation of this date with:
  ///
  /// * the [year],
  /// * the *complete* [month] name.
  ///
  /// The localization is setted by [locale].
  ///
  String toStringyMMMM({
    String? locale,
  }) {
    initializeDateFormatting(locale);

    return DateFormat.yMMMM(locale).format(this);
  }
}
