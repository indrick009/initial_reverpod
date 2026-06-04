import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLocaleProvider = NotifierProvider<AppLocaleNotifier, Locale?>(
  AppLocaleNotifier.new,
);

final class AppLocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() {
    return null;
  }

  void useSystemLocale() {
    state = null;
  }

  void useFrench() {
    state = const Locale('fr');
  }

  void useEnglish() {
    state = const Locale('en');
  }
}
