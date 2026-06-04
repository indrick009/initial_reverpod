import 'package:flutter/foundation.dart';

abstract interface class ErrorReporter {
  Future<void> setCollectionEnabled(bool enabled);

  Future<void> recordError(
    Object error,
    StackTrace stackTrace, {
    bool fatal = false,
    String? reason,
  });

  Future<void> recordFlutterError(
    FlutterErrorDetails details, {
    bool fatal = false,
  });

  Future<void> setUserId(String userId);

  Future<void> setCustomKey(String key, Object value);

  void log(String message);
}
