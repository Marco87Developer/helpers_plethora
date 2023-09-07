![Pub Version (including pre-releases)](https://img.shields.io/pub/v/helpers_plethora?include_prereleases)
![Dart GitHub Actions](https://github.com/Marco87Developer/helpers_plethora/actions/workflows/dart.yml/badge.svg)
![GitHub Top Language](https://img.shields.io/github/languages/top/Marco87Developer/helpers_plethora)

An helpful variety of extensions.

## Features

### `DateTime` extension methods

You can determine if a date is **after or at the same moment** or **before or at the same moment** as other date:

```dart
bool afterOrSameMoment = DateTime(2022, 9, 7).isAfterOrAtSameMomentAs(DateTime(2022)); // true
bool beforeOrSameMoment = DateTime(2022).isBeforeOrAtSameMomentAs(DateTime(2022)); // true
```

You can also determine if a date is **between** two other dates or if it **coincides** with one of these two dates.

```dart
bool between = DateTime(2022).isBetween(
    start: DateTime(2022),
    end: DateTime(2022, 9),
); // false
bool betweenOrSameMoment = DateTime(2022).isBetweenOrAtSameMomentAs(
    start: DateTime(2022),
    end: DateTime(2022, 9),
); // true
```

If you want to have a date consisting **only** of the **year**, **month** and **day** starting from any date, you can use the `onlyYMD` getter method:

```dart
DateTime date = DateTime(2022, 7, 5, 0, 15, 1, 2, 3).onlyYMD; // DateTime(2022, 7, 5)
```

The `thisMonthLastDay` getter method returns the number of **the last day of the month** of a date.

```dart
int lastDay1 = DateTime(2020, 2).thisMonthLastDay; // 29
int lastDay2 = DateTime(2022, 2).thisMonthLastDay; // 28
```

#### String representation of a date

You can get the *localized string representation* of a date with the *short name* of the **day of the week**:

```dart
String shortWeekDay1 = await DateTime(2022, 9, 7).toStringE(); // 'Wed'
String shortWeekDay2 = await DateTime(2022, 9, 7).toStringE(locale: 'it-IT', firstUpperCase: true); // 'Mer'
```

You can get the *localized string representation* of a date with the *full name* of the **day of the week**:

```dart
String fullWeekDay1 = await DateTime(2022, 9, 7).toStringEEEE(); // 'Wednesday'
String fullWeekDay2 = await DateTime(2022, 9, 7).toStringEEEE(locale: 'it-IT', firstUpperCase: true); // 'Mercoledì'
```

You can get the *localized string representation* of the **time** of a date in the *“hour:minute”* format:

```dart
String time1 = await DateTime(2022, 9, 8, 15, 15, 35).toStringHm(); // '15:15'
String time2 = await DateTime(2022, 9, 8, 7, 15, 35).toStringHm(locale: 'it-IT'); // '07:15'
String time3 = await DateTime(2022, 9, 8, 7, 15, 35).toStringHm(locale: 'es-ES'); // '7:15'
```

You can get the *localized string representation* of a date with the *short name* of the **month**:

```dart
String shortMonth1 = await DateTime(2022, 9, 7).toStringMMM(); // 'Sep'
String shortMonth2 = await DateTime(2022, 9, 7).toStringMMM(locale: 'it-IT'); // 'set'
String shortMonth3 = await DateTime(2022, 9, 7).toStringMMM(locale: 'es-ES', firstUpperCase: true); // 'Sept.'
```

You can get the *localized string representation* of a date with the *full name* of the **month**:

```dart
String fullMonth1 = await DateTime(2022, 9, 7).toStringMMMM(); // 'September'
String fullMonth2 = await DateTime(2022, 9, 7).toStringMMMM(locale: 'it-IT'); // 'settembre'
String fullMonth3 = await DateTime(2022, 9, 7).toStringMMMM(locale: 'es-ES', firstUpperCase: true); // 'Septiembre'
```

You can get the *string representation* of a date in the **“yyyy-mm-dd”** format:

```dart
String yyyMmDd = DateTime(2022, 9, 7).toStringyMMd(); // '2022-09-07'
```

You can get the *localized string representation* of a date with the **year** and the *short name* of the **month**:

```dart
String yearShortMonth1 = await DateTime(2022, 9, 7).toStringyMMM(); // 'Sep 2022'
String yearShortMonth2 = await DateTime(2022, 9, 7).toStringyMMM(locale: 'it-IT'); // 'set 2022'
String yearShortMonth3 = await DateTime(2022, 9, 7).toStringyMMM(locale: 'es-ES', firstUpperCase: true); // 'Sept. 2022'
```

You can get the *localized string representation* of a date with the **year**, the *short name* of the **month** and the **day number**:

```dart
String yearShortMonthDayNumber1 = await DateTime(2022, 9, 7).toStringyMMMd(); // 'Sep 7, 2022'
String yearShortMonthDayNumber2 = await DateTime(2022, 9, 7).toStringyMMMd(locale: 'it-IT', firstUpperCase: true); // '7 Set 2022'
```

You can get the *localized string representation* of a date with the **year**, the *short name* of the **month**, the *short name* of the **day** and the **day number**:

```dart
String yearShortMonthShortDayNumber1 =  await DateTime(2022, 9, 7).toStringyMMMEd(); // 'Wed, Sep 7, 2022'
String yearShortMonthShortDayNumber2 =  await DateTime(2022, 9, 7).toStringyMMMEd(locale: 'es-ES', firstsUpperCase: true); // 'Mié., 7 Sept. 2022'
```

You can get the *localized string representation* of a date with the **year** and the *full name* of the **month**:

```dart
String yearFullMonth1 = await DateTime(2022, 9, 7).toStringyMMMM(); // 'September 2022'
String yearFullMonth2 = await DateTime(2022, 9, 7).toStringyMMMM(locale: 'it-IT', firstUpperCase: true); // 'Settembre 2022'
```

You can get the *localized string representation* of a date with the **year**, the *full name* of the **month**, the *full name* of the **day** and the **day number**:

```dart
String yearFullMonthFullDayNumber1 = await DateTime(2022, 9, 7).toStringyMMMMEEEEd(); // 'Wednesday, September 7, 2022'
String yearFullMonthFullDayNumber2 = await DateTime(2022, 9, 7).toStringyMMMMEEEEd(locale: 'it-IT', firstUpperCase: true); // 'Mercoledì 7 settembre 2022'
```

### `double` extension methods

To get the string representation of a `double` number with thousands separators, you can use the `toStringWithThousandsSeparator` method:

```dart
String representation1 = 1357.175.toStringWithThousandsSeparator(); // '1,357.2'
String representation2 = 1357.175.toStringWithThousandsSeparator(decimals: 1, locale: 'it-IT'); // '1.357,2'
String representation3 = 1357.175.toStringWithThousandsSeparator(decimals: 3, maxDecimals: 2); // '1,357.175'
String representation4 = 1357.175.toStringWithThousandsSeparator(decimals: 3, locale: 'es-ES', maxDecimals: 2); // '1.357,175'
String representation5 = 1357.176.toStringWithThousandsSeparator(maxDecimals: 2); // '1,357.18'
```

### `int` extension methods

To get the string representation of a `int` number with thousands separators, you can use the `toStringWithThousandsSeparator` method:

```dart
String representation1 = 1234.toStringWithThousandsSeparator(); // '1,234'
String representation2 = 1234.toStringWithThousandsSeparator(locale: 'es-ES'); // '1.234'
String representation3 = 12345.toStringWithThousandsSeparator(locale: 'it-IT'); // '12.345'
```

### `List<Comparable>` extension methods

If you want to eliminate repetitions from a list and, at the same time, sort it, you can use the `distinctSort` method:

```dart
List<int> sortedAndWithoutRepetitions = [2, 3, 1, 2, 3, 4, 5, 6, 7, 7].distinctSort(); // [1, 2, 3, 4, 5, 6, 7]
```

### `List<num>` extension methods

If you want to get a list of numbers, where each one is equal to the sum of the elements of another one *up to* that point, use the `progressiveSum` method:

```dart
[1, 2, 3, 4, 5].progressiveSum(); // [1, 3, 6, 10, 15]
[1, 3, 2, 5, 4].progressiveSum(); // [1, 4, 6, 11, 15]
```

### `String` extension methods

Use the `allCurrenciesSymbols` method to get a list of **all currency symbols** found in a string, in the order they appear in that string. If *no currency symbol* is encountered, an *empty list* is returned:

```dart
List<String> currencies1 = ''.allCurrenciesSymbols(); // <String>[]
List<String> currencies2 = 'A string with no currency.'.allCurrenciesSymbols(); // <String>[]
List<String> currencies3 = r'This is the euro symbol: €. And this is the dollar symbol: $.'.allCurrenciesSymbols(); // ['€', r'$']
List<String> currencies4 = r'This is the dollar symbol: $. And this is the euro symbol: €.'.allCurrenciesSymbols(); // [r'$', '€']
```

Use the `firstCurrencySymbol` method to get the **first currency symbol** found in a string. If *no currency symbol* is encountered, an *empty string* is returned:

```dart
String firstCurrency1 = ''.firstCurrencySymbol(); // ''
String firstCurrency2 = 'A string with no currency.'.firstCurrencySymbol(); // ''
String firstCurrency3 = r'This is the euro symbol: €. And this is the dollar symbol: $.'.firstCurrencySymbol(); // '€'
String firstCurrency4 = r'This is the dollar symbol: $. And this is the euro symbol: €.'.firstCurrencySymbol(); // r'$'
```

If you want to get the same string, but with the **first alphabetic** character *of all substrings* determined by a pattern in **uppercase**, use the `firstsUpperCase` method. If this string is empty, an empty string is returned.

```dart
String string1 = ' This package is helpers_plethora. '.firstsUpperCase(); // 'This Package Is Helpers_plethora.'
String string2 = ' This package is helpers_plethora. '.firstsUpperCase(splitPattern: '_'); // 'This package is helpers_Plethora.'
String string3 = ' This package is helpers_plethora. '.firstsUpperCase(splitPattern: '_', trim: false); // ' This package is helpers_Plethora. '
```

If you want to get the same string, but with the **first alphabetic** character **uppercase**, use the `firstUpperCase` method. If this string is empty, an empty string is returned.

```dart
String string1 = ' this package is helpers_plethora. '.firstUpperCase(); // 'This package is helpers_plethora.'
String string2 = ' this package is helpers_plethora. '.firstUpperCase(trim: false); // ' This package is helpers_plethora. '
```
