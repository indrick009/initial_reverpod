import 'package:flutter/foundation.dart';

import '../../domain/error_reporter.dart';

final class NoopErrorReporter implements ErrorReporter {
  const NoopErrorReporter();

  @override
  Future<void> setCollectionEnabled(bool enabled) async {}

  @override
  Future<void> recordError(
    Object error,
    StackTrace stackTrace, {
    bool fatal = false,
    String? reason,
  }) async {}

  @override
  Future<void> recordFlutterError(
    FlutterErrorDetails details, {
    bool fatal = false,
  }) async {}

  @override
  Future<void> setUserId(String userId) async {}

  @override
  Future<void> setCustomKey(String key, Object value) async {}

  @override
  void log(String message) {}
}
