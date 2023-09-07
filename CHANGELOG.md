## 2.2.0

Release date: 2023-09-07.

### Fixed

* Now the `onlyYMD` getter method, if the date is UTC, returns a UTC date.

## 2.1.0

Release date: 2022-09-27.

### Removed

* The dependence on Flutter and, therefore, also on:
  * `DateTimeRange` extension methods.
  * `List<DateTimeRange>` extension methods.
  * `TimeOfDay` extension methods.
* The `AuthProvider` enumeration.

### Changed

* Minimum Dart SDK was updated to `2.18.1` version.

## 2.0.6

Release date: 2021-08-16.

### Added

* The `onlyYMD` getter to the `DateTime` extension methods.

## 2.0.5

Release date: 2021-07-30.

### Added

* Added `allCurrenciesSymbols` and `firstCurrencySymbol` extension methods for `String` class.

## 2.0.4

Release date: 2021-07-29.

### Fixed

* An error in the `toAuthProvider` method of `AuthProvider` enumeration.

## 2.0.3

Release date: 2021-07-29.

### Added

* Added `compareTo` method to `AuthProvider` enumeration.
* Now this package exports package `package:collection/collection.dart`.
* The `sum` extension method for `List<T extends num>` has been deprecated in favor of the `sum` property of `package:collection/collection.dart`.

## 2.0.2

Release date: 2021-07-23.

### Changed

* Now the extension methods for `String` `firstsUpperCase` and `firstUpperCase` use `replaceAllMapped` and `replaceFirstMapped` `String` methods respectively.

## 2.0.1

Release date: 2021-07-21.

### Added

* Missing exports.

## 2.0.0

Release date: 2021-07-21.

### Removed

* **Breaking change.** The getter extension methods `buttonBackgroundColor`, `pressedButtonColor`, `buttonTextColor` and colors. They have been temporarily removed. The idea is that in a future version of this package they will be included in an improved way.

### Fixed

* An error in the minimize method of the extension to the `List<DateTimeRange>` class was fixed.

### Changed

* **Breaking change.** The name of the `SocialAccountProvider` enumeration has been changed to `AuthProvider`.
* **Breaking change.** The name of the getter extension method `lastMonthDay` for `DateTime` class has been changed to the more correct `thisMonthLastDay`.
* **Breaking change.** The name of the extension method `overlapWith` for `DateTimeRange` class has been changed to the more correct `overlapsWith`.
* **Breaking change.** The name of the extension method `toStringWithThousands` for `double` class has been changed to the more descriptive `toStringWithThousandsSeparator`.
* **Breaking change.** The name of the extension method `toStringWithThousands` for `int` class has been changed to the more descriptive `toStringWithThousandsSeparator`.
* Updated all the dependencies.
* Minimum Dart SDK was updated to `2.13.4` version and Flutter to `2.2.3` version.

## 1.2.0

Release date: 2021-05-20.

### Removed

* Removed `pedantic` developer dependency.

### Changed

* This now uses the newer `lints` developer dependency.
* Minimum Dart SDK was updated to `2.13.0` version and Flutter to `2.0.0` version.

## 1.1.2

Release date: 2021-04-12.

### Changed

* `firstsUppercase` method name into `firstsUpperCase`.

## 1.1.1

Release date: 2021-03-17.

### Fixed

* Some color.

## 1.1.0

Release date: 2021-03-17.

### Added

* `SocialAccountProvider` enumeration and several other methods in its extension.

## 1.0.0

Release date: 2021-02-17.

### Changed

* Stable null safety release.

## 0.2.0-nullsafety.1

Release date: 2021-01-12.

### Added

* `lastMonthDay` as extension getter method for `DateTime`, and several other methods for representing the date-time as a string.
* Extension methods for `double` class.
* Extension methods for `int` class.
* Extension methods for `List<Comparable>` class.
* Extension methods for `List<num>` class.
* Extension methods for `String` class.
* Extension methods for `TimeOfDay` class.

## 0.1.0-nullsafety.1

Release date: 2021-01-07.

* First pre-release.

### Added

* Additional functionality are provided to `DateTime`, `DateTimeRange` and `List<DateTimeRange>`.
