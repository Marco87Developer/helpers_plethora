import 'package:helpers_plethora/src/extensions/string_extension.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// This extension adds features to the [DateTime] class.
///
extension DateTimeExtension on DateTime {
  /// Returns if this date is **after or at the same moment** as [other] date
  /// (this ⩾ [other]).
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2022).isAfterOrAtSameMomentAs(DateTime(2021, 12, 7)); // isTrue
  /// DateTime(2022).isAfterOrAtSameMomentAs(DateTime(2021, 12, 31, 12, 59, 59)); // isTrue
  /// DateTime(2022).isAfterOrAtSameMomentAs(DateTime(2022)); // isTrue
  /// DateTime(2022, 9, 7).isAfterOrAtSameMomentAs(DateTime(2022, 9, 7)); // isTrue
  /// ```
  ///
  bool isAfterOrAtSameMomentAs(final DateTime other) =>
      isAfter(other) || isAtSameMomentAs(other);

  /// Returns if this date is **before or at the same moment** as [other] date
  /// (this ⩽ [other]).
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2021, 12, 7).isBeforeOrAtSameMomentAs(DateTime(2022)); // isTrue
  /// DateTime(2021, 12, 31, 12, 59, 59).isBeforeOrAtSameMomentAs(DateTime(2022)); // isTrue
  /// DateTime(2022).isBeforeOrAtSameMomentAs(DateTime(2022)); // isTrue
  /// DateTime(2022, 9, 7).isBeforeOrAtSameMomentAs(DateTime(2022, 9, 7)); // isTrue
  /// ```
  ///
  bool isBeforeOrAtSameMomentAs(final DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);

  /// Returns if this date is between [start] date and [end] date, excluding the
  /// extremes ([start] < this < [end]).
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2022).isBetween(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isFalse
  /// DateTime(2022, 9).isBetween(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isFalse
  /// DateTime(2022, 10).isBetween(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isFalse
  /// DateTime(2022, 7, 5).isBetween(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isTrue
  /// ```
  ///
  bool isBetween({
    required final DateTime start,
    required final DateTime end,
  }) =>
      isAfter(start) && isBefore(end);

  /// Returns whether this date **is between** [start] and [end] dates, or **at
  /// the same moment** as [start] date or [end] date (that is, *extremes are
  /// included*: [start] ⩽ this ⩽ [end]).
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2022).isBetweenOrAtSameMomentAs(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isTrue
  /// DateTime(2022, 9).isBetweenOrAtSameMomentAs(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isTrue
  /// DateTime(2022, 10).isBetweenOrAtSameMomentAs(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isFalse
  /// DateTime(2022, 7, 5).isBetweenOrAtSameMomentAs(
  ///   start: DateTime(2022),
  ///   end: DateTime(2022, 9),
  /// ); // isTrue
  /// ```
  ///
  bool isBetweenOrAtSameMomentAs({
    required final DateTime start,
    required final DateTime end,
  }) {
    final bool isIncluded = isBetween(start: start, end: end);

    final bool coincidesWithStart = isAtSameMomentAs(start);
    final bool coincidesWithEnd = isAtSameMomentAs(end);

    return isIncluded || coincidesWithStart || coincidesWithEnd;
  }

  /// Returns this same date, but **without any time information**. In other
  /// words, it only keeps the [year], [month] and [day].
  ///
  /// If this date is UTC, the returned date will also be UTC.
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2022, 7, 5, 0, 15, 1, 2, 3).onlyYMD; // DateTime(2022, 7, 5)
  /// ```
  ///
  DateTime get onlyYMD =>
      isUtc ? DateTime.utc(year, month, day) : DateTime(year, month, day);

  /// Returns the number of **the last day of the month** of this date.
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2020, 2).thisMonthLastDay; // 29
  /// DateTime(2022, 2).thisMonthLastDay; // 28
  /// ```
  ///
  int get thisMonthLastDay => DateTime(year, month + 1, 0).day;

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the *short name* of the **[day] of the week**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase].
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringE(); // 'Wed'
  /// await DateTime(2022, 9, 7).toStringE(locale: 'it-IT'); // 'mer'
  /// await DateTime(2022, 9, 7).toStringE(locale: 'it-IT', firstUpperCase: true); // 'Mer'
  /// await DateTime(2022, 9, 7).toStringE(locale: 'es-ES'); // 'mié'
  /// await DateTime(2022, 9, 7).toStringE(locale: 'es-ES', firstUpperCase: true); // 'Mié'
  /// ```
  ///
  Future<String> toStringE({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.E(locale).format(this).firstUpperCase()
        : DateFormat.E(locale).format(this);
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the *full name* of the **[day] of the week**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase].
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringEEEE(); // 'Wednesday'
  /// await DateTime(2022, 9, 7).toStringEEEE(locale: 'it-IT'); // 'mercoledì'
  /// await DateTime(2022, 9, 7)
  ///     .toStringEEEE(locale: 'it-IT', firstUpperCase: true); // 'Mercoledì'
  /// await DateTime(2022, 9, 7).toStringEEEE(locale: 'es-ES'); // 'miércoles'
  /// await DateTime(2022, 9, 7)
  ///     .toStringEEEE(locale: 'es-ES', firstUpperCase: true); // 'Miércoles'
  /// ```
  ///
  Future<String> toStringEEEE({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.EEEE(locale).format(this).firstUpperCase()
        : DateFormat.EEEE(locale).format(this);
  }

  /// Returns the *localized string representation* of:
  ///
  /// * the **time** of this date in the *“hour:minute”* format.
  ///
  /// Location is determined by [locale].
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 8, 15, 15, 35).toStringHm(); // '15:15'
  /// await DateTime(2022, 9, 8, 7, 15, 35).toStringHm(locale: 'it-IT'); // '07:15'
  /// await DateTime(2022, 9, 8, 7, 15, 35).toStringHm(locale: 'es-ES'); // '7:15'
  /// ```
  ///
  Future<String> toStringHm({
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    return DateFormat.Hm(locale).format(this);
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the *short name* of the **[month]**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase].
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringMMM(); // 'Sep'
  /// await DateTime(2022, 9, 7).toStringMMM(locale: 'it-IT'); // 'set'
  /// await DateTime(2022, 9, 7)
  ///     .toStringMMM(locale: 'it-IT', firstUpperCase: true); // 'Set'
  /// await DateTime(2022, 9, 7).toStringMMM(locale: 'es-ES'); // 'sept'
  /// await DateTime(2022, 9, 7)
  ///     .toStringMMM(locale: 'es-ES', firstUpperCase: true); // 'Sept'
  /// ```
  ///
  Future<String> toStringMMM({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.MMM(locale).format(this).firstUpperCase()
        : DateFormat.MMM(locale).format(this);
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the *full name* of the **[month]**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase].
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringMMMM(); // 'September'
  /// await DateTime(2022, 9, 7).toStringMMMM(locale: 'it-IT'); // 'settembre'
  /// await DateTime(2022, 9, 7)
  ///     .toStringMMMM(locale: 'it-IT', firstUpperCase: true); // 'Settembre'
  /// await DateTime(2022, 9, 7).toStringMMMM(locale: 'es-ES'); // 'septiembre'
  /// await DateTime(2022, 9, 7)
  ///     .toStringMMMM(locale: 'es-ES', firstUpperCase: true); // 'Septiembre'
  /// ```
  ///
  Future<String> toStringMMMM({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.MMMM(locale).format(this).firstUpperCase()
        : DateFormat.MMMM(locale).format(this);
  }

  /// Returns:
  ///
  /// * **this date** in the *“yyyy-mm-dd”* format.
  ///
  /// Examples:
  ///
  /// ```dart
  /// DateTime(2022).toStringyMMd(); // '2022-01-01'
  /// DateTime(2022, 7).toStringyMMd(); // '2022-07-01'
  /// DateTime(2022, 9, 7).toStringyMMd(); // '2022-09-07'
  /// ```
  ///
  String toStringyMMd() => DateFormat().addPattern('y-MM-dd').format(this);

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the **[year]** and
  /// * the *short name* of the **[month]**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase].
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringyMMM(); // 'Sep 2022'
  /// await DateTime(2022, 9, 7).toStringyMMM(locale: 'it-IT'); // 'set 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMM(locale: 'it-IT', firstUpperCase: true); // 'Set 2022'
  /// await DateTime(2022, 9, 7).toStringyMMM(locale: 'es-ES'); // 'sept 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMM(locale: 'es-ES', firstUpperCase: true); // 'Sept 2022'
  /// ```
  ///
  Future<String> toStringyMMM({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    return firstUpperCase
        ? DateFormat.yMMM(locale).format(this).firstUpperCase()
        : DateFormat.yMMM(locale).format(this);
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the **[year]**,
  /// * the *short name* of the **[month]** and
  /// * the **[day] number**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase] (in this case, it is ensured by referencing the first
  /// occurrence in the string of the following *regular expression*:
  /// `'([a-zA-z])'`).
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringyMMMd(); // 'Sep 7, 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMd(locale: 'it-IT'); // '7 set 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMd(locale: 'it-IT', firstUpperCase: true); // '7 Set 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMd(locale: 'es-ES'); // '7 sept 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMd(locale: 'es-ES', firstUpperCase: true); // '7 Sept 2022'
  /// ```
  ///
  Future<String> toStringyMMMd({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    final String string = DateFormat.yMMMd(locale).format(this);

    if (!firstUpperCase) {
      return string;
    } else {
      final RegExp regExp = RegExp('([a-zA-z])');
      final RegExpMatch? regExpMatch = regExp.firstMatch(string);

      if (regExpMatch != null) {
        return string.replaceFirst(
          regExp,
          string[regExpMatch.start].toUpperCase(),
        );
      } else {
        return string;
      }
    }
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the **[year]**,
  /// * the *short name* of the **[month]**,
  /// * the *short name* of the **[day]** and
  /// * the **[day] number**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letters of the string is uppercase, assign `true` to
  /// [firstsUpperCase] (in this case, it is ensured by referencing the first
  /// occurrences in the string of the following *regular expressions*:
  /// `'([a-zA-z])'` and `r'(\s[a-zA-Z])'`).
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringyMMMEd(); // 'Wed, Sep 7, 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMEd(locale: 'it-IT'); // 'mer 7 set 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMEd(locale: 'it-IT', firstsUpperCase: true); // 'Mer 7 Set 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMEd(locale: 'es-ES'); // 'mié, 7 sept 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMEd(locale: 'es-ES', firstsUpperCase: true); // 'Mié, 7 Sept 2022'
  /// ```
  ///
  Future<String> toStringyMMMEd({
    final bool firstsUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    final String string = DateFormat.yMMMEd(locale).format(this);

    if (!firstsUpperCase) {
      return string;
    } else {
      final RegExp regExp1 = RegExp('([a-zA-z])');
      final RegExpMatch? regExpMatch1 = regExp1.firstMatch(string);
      final RegExp regExp2 = RegExp(r'(\s[a-zA-Z])');
      final RegExpMatch? regExp2Match = regExp2.firstMatch(string);

      if (regExpMatch1 != null && regExp2Match != null) {
        return string
            .replaceFirst(
              regExp1,
              string[regExpMatch1.start].toUpperCase(),
            )
            .replaceFirst(
              regExp2,
              ' ${string[regExp2Match.start + 1].toUpperCase()}',
            );
      } else {
        return string;
      }
    }
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the **[year]** and
  /// * the *full name* of the **[month]**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase] (in this case, it is ensured by referencing the first
  /// occurrence in the string of the following *regular expression*:
  /// `'([a-zA-z])'`).
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringyMMMM(); // 'September 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMM(locale: 'it-IT'); // 'settembre 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMM(locale: 'it-IT', firstUpperCase: true); // 'Settembre 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMM(locale: 'es-ES'); // 'septiembre de 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMM(locale: 'es-ES', firstUpperCase: true); // 'Septiembre de 2022'
  /// ```
  ///
  Future<String> toStringyMMMM({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    final String string = DateFormat.yMMMM(locale).format(this);

    if (!firstUpperCase) {
      return string;
    } else {
      final RegExp regExp = RegExp('([a-zA-z])');
      final RegExpMatch? regExpMatch = regExp.firstMatch(string);

      if (regExpMatch != null) {
        return string.replaceFirst(
          regExp,
          string[regExpMatch.start].toUpperCase(),
        );
      } else {
        return string;
      }
    }
  }

  /// Returns the *localized string representation* of this date with:
  ///
  /// * the **[year]**,
  /// * the *full name* of the **[month]**,
  /// * the *full name* of the **[day]** and
  /// * the **[day] number**
  ///
  /// of this date. Location is determined by [locale]. In order to ensure that
  /// the first letter of the string is uppercase, assign `true` to
  /// [firstUpperCase] (in this case, it is ensured by referencing the first
  /// occurrence in the string of the following *regular expression*:
  /// `'([a-zA-z])'`).
  ///
  /// Examples:
  ///
  /// ```dart
  /// await DateTime(2022, 9, 7).toStringyMMMMEEEEd(); // 'Wednesday, September 7, 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMMEEEEd(locale: 'it-IT'); // 'mercoledì 7 settembre 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMMEEEEd(locale: 'it-IT', firstUpperCase: true); // 'Mercoledì 7 settembre 2022'
  /// await DateTime(2022, 9, 7).toStringyMMMMEEEEd(locale: 'es-ES'); // 'miércoles, 7 de septiembre de 2022'
  /// await DateTime(2022, 9, 7)
  ///     .toStringyMMMMEEEEd(locale: 'es-ES', firstUpperCase: true); // 'Miércoles, 7 de septiembre de 2022'
  /// ```
  ///
  Future<String> toStringyMMMMEEEEd({
    final bool firstUpperCase = false,
    final String? locale,
  }) async {
    await initializeDateFormatting(locale);

    final String string = DateFormat.yMMMMEEEEd(locale).format(this);

    if (!firstUpperCase) {
      return string;
    } else {
      final RegExp regExp = RegExp('([a-zA-z])');
      final RegExpMatch? regExpMatch = regExp.firstMatch(string);

      if (regExpMatch != null) {
        return string.replaceFirst(
          regExp,
          string[regExpMatch.start].toUpperCase(),
        );
      } else {
        return string;
      }
    }
  }
}
