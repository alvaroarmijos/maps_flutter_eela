import 'package:flutter/material.dart';
import 'package:flutter_maps_eela/packages/core/ui/ui.dart';

class AppTheme {
  AppTheme._();

  static final colorScheme = ColorScheme.light(
    primary: AppColors.primary,
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size.fromHeight(44),
    ),
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: colorScheme,
    ).copyWith(
      elevatedButtonTheme: _elevatedButtonTheme,
    );
  }
}
