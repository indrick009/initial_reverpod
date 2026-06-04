import 'package:flutter/material.dart';

final class AppThemeConfig {
  const AppThemeConfig({required this.lightTheme, this.darkTheme});

  final ThemeData lightTheme;
  final ThemeData? darkTheme;

  bool get supportsDarkTheme => darkTheme != null;

  ThemeMode resolveThemeMode(ThemeMode requestedMode) {
    if (supportsDarkTheme) return requestedMode;

    return ThemeMode.light;
  }
}
