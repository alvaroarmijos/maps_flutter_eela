import 'package:flutter/material.dart';

class AppTheme {
  static const colorScheme = ColorScheme.light(
    primary: Colors.purple,
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: colorScheme,
    );
  }
}
