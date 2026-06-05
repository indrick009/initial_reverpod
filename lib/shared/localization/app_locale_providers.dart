import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale_providers.g.dart';

@Riverpod(keepAlive: true)
final class AppLocale extends _$AppLocale {
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
