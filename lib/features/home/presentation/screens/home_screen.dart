import 'package:app_notifications/app_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../providers/app_core_providers.dart';
import '../../../../shared/localization/app_locale_providers.dart';
import '../../../../shared/theme/app_theme_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final themeController = ref.watch(appThemeControllerProvider);
    final localeController = ref.watch(appLocaleProvider.notifier);
    final notificationService = ref.watch(localNotificationServiceProvider);
    final notificationPermissionService = ref.watch(
      notificationPermissionServiceProvider,
    );

    return SizedBox.expand(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.homeTestTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final permissionStatus = await notificationPermissionService
                        .requestPermission();

                    final hasPermission =
                        permissionStatus ==
                            NotificationPermissionStatus.granted ||
                        permissionStatus ==
                            NotificationPermissionStatus.provisional;

                    if (!hasPermission) {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text(
                            l10n.notificationPermissionDeniedMessage,
                          ),
                        ),
                      );
                      return;
                    }

                    try {
                      await notificationService.show(
                        NotificationMessage(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          title: l10n.appName,
                          body: l10n.testNotificationButton,
                        ),
                      );

                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.notificationSentMessage)),
                      );
                    } catch (_) {
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.notificationFailedMessage)),
                      );
                    }
                  },
                  child: Text(l10n.testNotificationButton),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: themeController.useLightTheme,
                  child: Text(l10n.useLightThemeButton),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: themeController.canUseDarkTheme
                      ? themeController.useDarkTheme
                      : null,
                  child: Text(l10n.useDarkThemeButton),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: localeController.useFrench,
                  child: Text(l10n.useFrenchButton),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: localeController.useEnglish,
                  child: Text(l10n.useEnglishButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
