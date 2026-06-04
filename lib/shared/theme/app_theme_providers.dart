import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';
import 'app_theme_config.dart';

final appThemeConfigProvider = Provider<AppThemeConfig>((ref) {
  return AppTheme.config;
});

final requestedThemeModeProvider =
    NotifierProvider<RequestedThemeModeNotifier, ThemeMode>(
      RequestedThemeModeNotifier.new,
    );

final class RequestedThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
  }
}

final effectiveThemeModeProvider = Provider<ThemeMode>((ref) {
  final config = ref.watch(appThemeConfigProvider);
  final requestedMode = ref.watch(requestedThemeModeProvider);

  return config.resolveThemeMode(requestedMode);
});

final appThemeControllerProvider = Provider<AppThemeController>((ref) {
  return AppThemeController(ref);
});

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
