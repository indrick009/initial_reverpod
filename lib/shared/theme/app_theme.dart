import 'package:flutter/material.dart';

import 'app_theme_config.dart';

final class AppTheme {
  const AppTheme._();

  static AppThemeConfig get config {
    return AppThemeConfig(lightTheme: light, darkTheme: dark);
  }

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF146C63),
        seedColor: const Color(0xFF146C63),
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: const Color.fromARGB(255, 0, 0, 0),
        seedColor: const Color.fromARGB(255, 0, 0, 0),
        brightness: Brightness.dark,
      ),
    );
  }
}
