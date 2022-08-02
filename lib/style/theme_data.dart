import 'package:flutter/material.dart';

class Style {
  static ThemeData themedata(
      {required BuildContext context, required bool isDark}) {
    // isDark = false;
    return ThemeData(
        brightness: isDark ? Brightness.light : Brightness.dark,
        primaryColor: isDark ? Colors.blue : Colors.amber,
        cardColor: isDark ? Colors.black : Colors.grey,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: isDark ? Colors.black : Colors.white,
              brightness: isDark ? Brightness.light : Brightness.dark,
            )

        // colorScheme: const ColorScheme.light(),
        );
  }
}
