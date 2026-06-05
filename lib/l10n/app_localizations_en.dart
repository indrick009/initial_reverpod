// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Crina';

  @override
  String get homeTitle => 'Crina';

  @override
  String get navHome => 'Home';

  @override
  String get navProducts => 'Products';

  @override
  String get navOrders => 'Orders';

  @override
  String get navMessages => 'Messages';

  @override
  String get navAccount => 'Account';

  @override
  String get homeTestTitle => 'Foundation tests';

  @override
  String get testNotificationButton => 'Test notification';

  @override
  String get notificationSentMessage => 'Notification sent';

  @override
  String get notificationPermissionDeniedMessage =>
      'Notification permission denied';

  @override
  String get notificationFailedMessage => 'Unable to show notification';

  @override
  String get useLightThemeButton => 'Light theme';

  @override
  String get useDarkThemeButton => 'Dark theme';

  @override
  String get useFrenchButton => 'French';

  @override
  String get useEnglishButton => 'English';
}
