import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../../domain/error_reporter.dart';

final class FirebaseCrashlyticsErrorReporter implements ErrorReporter {
  FirebaseCrashlyticsErrorReporter({FirebaseCrashlytics? crashlytics})
    : _crashlytics = crashlytics ?? FirebaseCrashlytics.instance;

  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    await _guard(() => _crashlytics.setCrashlyticsCollectionEnabled(enabled));
  }

  @override
  Future<void> recordError(
    Object error,
    StackTrace stackTrace, {
    bool fatal = false,
    String? reason,
  }) async {
    await _guard(
      () => _crashlytics.recordError(
        error,
        stackTrace,
        fatal: fatal,
        reason: reason,
      ),
    );
  }

  @override
  Future<void> recordFlutterError(
    FlutterErrorDetails details, {
    bool fatal = false,
  }) async {
    if (fatal) {
      await _guard(() => _crashlytics.recordFlutterFatalError(details));
      return;
    }

    await _guard(() => _crashlytics.recordFlutterError(details));
  }

  @override
  Future<void> setUserId(String userId) async {
    await _guard(() => _crashlytics.setUserIdentifier(userId));
  }

  @override
  Future<void> setCustomKey(String key, Object value) async {
    await _guard(() => _crashlytics.setCustomKey(key, value));
  }

  @override
  void log(String message) {
    _guardSync(() => _crashlytics.log(message));
  }

  Future<void> _guard(Future<void> Function() action) async {
    try {
      await action();
    } catch (error, stackTrace) {
      _debugLog(error, stackTrace);
    }
  }

  void _guardSync(void Function() action) {
    try {
      action();
    } catch (error, stackTrace) {
      _debugLog(error, stackTrace);
    }
  }

  void _debugLog(Object error, StackTrace stackTrace) {
    if (!kDebugMode) return;

    debugPrint('[Crashlytics disabled] $error');
    debugPrintStack(stackTrace: stackTrace);
  }
}
