// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Crina';

  @override
  String get homeTitle => 'Crina';

  @override
  String get navHome => 'Accueil';

  @override
  String get navProducts => 'Produits';

  @override
  String get navOrders => 'Commandes';

  @override
  String get navMessages => 'Messages';

  @override
  String get navAccount => 'Compte';

  @override
  String get homeTestTitle => 'Tests de fondation';

  @override
  String get testNotificationButton => 'Tester la notification';

  @override
  String get notificationSentMessage => 'Notification envoyee';

  @override
  String get notificationPermissionDeniedMessage =>
      'Permission notification refusee';

  @override
  String get notificationFailedMessage =>
      'Impossible d\'afficher la notification';

  @override
  String get useLightThemeButton => 'Theme clair';

  @override
  String get useDarkThemeButton => 'Theme sombre';

  @override
  String get useFrenchButton => 'Francais';

  @override
  String get useEnglishButton => 'Anglais';
}
