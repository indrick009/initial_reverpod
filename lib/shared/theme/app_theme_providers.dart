import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_theme.dart';
import 'app_theme_config.dart';

part 'app_theme_providers.g.dart';

@Riverpod(keepAlive: true)
AppThemeConfig appThemeConfig(Ref ref) {
  return AppTheme.config;
}

@Riverpod(keepAlive: true)
final class RequestedThemeMode extends _$RequestedThemeMode {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
  }
}

@Riverpod(keepAlive: true)
ThemeMode effectiveThemeMode(Ref ref) {
  final config = ref.watch(appThemeConfigProvider);
  final requestedMode = ref.watch(requestedThemeModeProvider);

  return config.resolveThemeMode(requestedMode);
}

@Riverpod(keepAlive: true)
AppThemeController appThemeController(Ref ref) {
  return AppThemeController(ref);
}

final class AppThemeController {
  const AppThemeController(this._ref);

  final Ref _ref;

  bool get canUseDarkTheme {
    return _ref.read(appThemeConfigProvider).supportsDarkTheme;
  }

  void useLightTheme() {
    _ref
        .read(requestedThemeModeProvider.notifier)
        .setThemeMode(ThemeMode.light);
  }

  void useDarkTheme() {
    if (!canUseDarkTheme) return;

    _ref.read(requestedThemeModeProvider.notifier).setThemeMode(ThemeMode.dark);
  }

  void useSystemTheme() {
    if (!canUseDarkTheme) {
      useLightTheme();
      return;
    }

    _ref
        .read(requestedThemeModeProvider.notifier)
        .setThemeMode(ThemeMode.system);
  }
}
