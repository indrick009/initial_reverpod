import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppProviderObserver extends ProviderObserver {
  const AppProviderObserver();

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (!kDebugMode) return;

    debugPrint(
      '[Riverpod] ${context.provider.name ?? context.provider.runtimeType} '
      '$previousValue -> $newValue',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    if (!kDebugMode) return;

    debugPrint(
      '[Riverpod][Error] '
      '${context.provider.name ?? context.provider.runtimeType}: $error',
    );
  }
}
