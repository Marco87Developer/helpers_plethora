/// This extension adds features to the [String] class.
///
extension StringExtension on String {
  /// Returns a list of **all currency symbols** found in this string, in the
  /// order they appear in this string. If *no currency symbol* is encountered,
  /// an *empty list* is returned.
  ///
  /// Examples:
  ///
  /// ```dart
  /// ''.allCurrenciesSymbols(); // <String>[]
  /// 'A string with no currency.'.allCurrenciesSymbols(); // <String>[]
  ///
  /// 'This is the euro symbol: €.'.allCurrenciesSymbols(); // ['€']
  /// r'This is the euro symbol: €. And this is the dollar symbol: $.'.allCurrenciesSymbols(); // ['€', r'$']
  /// r'This is the dollar symbol: $. And this is the euro symbol: €.'.allCurrenciesSymbols(); // [r'$', '€']
  /// ```
  ///
  List<String> allCurrenciesSymbols() {
    final RegExp regExp = RegExp(r'\p{Sc}', unicode: true);
    final Iterable<Match> matches = regExp.allMatches(this);
    final List<String> result = [];
    for (final Match match in matches) {
      if (match.group(0) != null) {
        result.add(match.group(0)!);
      }
    }
    return result;
  }

  /// Returns the **first currency symbol** found in this string. If *no
  /// currency symbol* is encountered, an *empty string* is returned.
  ///
  /// Examples:
  ///
  /// ```dart
  /// ''.firstCurrencySymbol(); // ''
  /// 'A string with no currency.'.firstCurrencySymbol(); // ''
  ///
  /// 'This is the euro symbol: €.'.firstCurrencySymbol(); // '€'
  /// r'This is the euro symbol: €. And this is the dollar symbol: $.'.firstCurrencySymbol(); // '€'
  /// r'This is the dollar symbol: $. And this is the euro symbol: €.'.firstCurrencySymbol(); // r'$'
  /// ```
  ///
  String firstCurrencySymbol() {
    final RegExp regExp = RegExp(r'\p{Sc}', unicode: true);
    final Iterable<Match> matches = regExp.allMatches(this);
    return matches.isEmpty ? '' : matches.first.group(0)!;
  }

  /// Returns this same string, but with the **first alphabetic** character *of
  /// all substrings* determined by the [splitPattern] in **uppercase**. If this
  /// string is empty, an empty string is returned.
  ///
  /// The default [splitPattern] is given by the space string (`' '`).
  ///
  /// Before capitalizing all the first few characters, the leading and trailing
  /// whitespaces of this string are eliminated. To change this behavior just
  /// assign `false` to the [trim] parameter.
  ///
  /// Examples:
  ///
  /// ```dart
  /// ' This package is helpers_plethora. '
  ///     .firstsUpperCase(); // 'This Package Is Helpers_plethora.'
  /// ' This package is helpers_plethora. '
  ///     .firstsUpperCase(splitPattern: '_'); // 'This package is helpers_Plethora.'
  /// ' This package is helpers_plethora. '
  ///     .firstsUpperCase(splitPattern: '_', trim: false); // ' This package is helpers_Plethora. '
  /// ```
  ///
  String firstsUpperCase({
    final String splitPattern = ' ',
    final bool trim = true,
  }) {
    if (isEmpty) return '';

    final String string = trim ? this.trim() : this;

    if (!contains(splitPattern)) return string;

    final RegExp regExp = RegExp('(^|$splitPattern)[a-zA-Z]');
    String replace(final Match match) => match[0]!.toUpperCase();
    return string.replaceAllMapped(regExp, replace);
  }

  /// Returns this same string, but with the **first alphabetic** character
  /// **uppercase**. If this string is empty, an empty string is returned.
  ///
  /// Before making the first character uppercase, the leading and trailing
  /// whitespaces of this string are eliminated. To change this behavior just
  /// assign `false` to the [trim] parameter.
  ///
  /// Examples:
  ///
  /// ```dart
  /// ' this package is helpers_plethora. '.firstUpperCase();
  ///     // 'This package is helpers_plethora.'
  /// ' this package is helpers_plethora. '.firstUpperCase(trim: false);
  ///     // ' This package is helpers_plethora. '
  /// ```
  ///
  String firstUpperCase({
    final bool trim = true,
  }) {
    if (isEmpty) return '';

    final String string = trim ? this.trim() : this;

    final RegExp regExp = RegExp('([a-zA-Z])');
    return string.replaceFirstMapped(
      regExp,
      (final match) => match[0]!.toUpperCase(),
    );
  }
}
