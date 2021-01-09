/// This extension provides additional functionality for the `String` class.
///
extension StringX on String {
  /// Returns this string, but with 1º character uppercase. If the string is
  /// empty, a empty string (`''`) is returned.
  ///
  /// If the string contains leading or trailing whitespaces, a new string with
  /// no leading and no trailing whitespaces is returned before to apply the
  /// uppercase. In order to change this behavior, just assign `false` to the
  /// [trim] parameter.
  ///
  String firstUpperCase({bool trim = true}) {
    if (isEmpty) return '';

    final String string = trim ? this.trim() : this;

    return '${string[0].toUpperCase()}${string.substring(1)}';
  }

  /// Returns this string with the strings out of the [splitPattern] with 1º
  /// character uppercase. If the string is empty, a empty string (`''`) is
  /// returned.
  ///
  /// If the string contains leading or trailing whitespaces, a new string with
  /// no leading and no trailing whitespaces is returned before to apply the
  /// uppercase. In order to change this behavior, just assign `false` to the
  /// [trim] parameter.
  ///
  String firstsUppercase({
    String splitPattern = ' ',
    bool trim = true,
  }) {
    final String string = trim ? this.trim() : this;

    if (!contains(splitPattern)) return string;

    final List<String> strings = string
        .split(splitPattern)
        .map((string) => string.firstUpperCase())
        .toList();

    final StringBuffer buffer = StringBuffer()..write(strings[0]);
    for (int i = 1; i < strings.length; i++)
      buffer.write('$splitPattern${strings[i]}');

    return buffer.toString();
  }
}
