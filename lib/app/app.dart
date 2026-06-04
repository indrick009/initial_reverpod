import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../l10n/app_localizations.dart';
import '../shared/theme/app_theme_providers.dart';
import '../shared/ui/responsive/app_breakpoints.dart';
import 'router/app_router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeConfig = ref.watch(appThemeConfigProvider);
    final themeMode = ref.watch(effectiveThemeModeProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: themeConfig.lightTheme,
      darkTheme: themeConfig.darkTheme,
      themeMode: themeMode,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: AppBreakpoints.values,
        child: child!,
      ),
      routerConfig: router,
    );
  }
}
