import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_riverpod/shared/theme/app_theme_config.dart';

void main() {
  test('forces light mode when dark theme is not provided', () {
    final config = AppThemeConfig(lightTheme: ThemeData.light());

    expect(config.supportsDarkTheme, isFalse);
    expect(config.resolveThemeMode(ThemeMode.dark), ThemeMode.light);
    expect(config.resolveThemeMode(ThemeMode.system), ThemeMode.light);
  });

  test('allows requested mode when dark theme is provided', () {
    final config = AppThemeConfig(
      lightTheme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );

    expect(config.supportsDarkTheme, isTrue);
    expect(config.resolveThemeMode(ThemeMode.dark), ThemeMode.dark);
    expect(config.resolveThemeMode(ThemeMode.system), ThemeMode.system);
  });
}
