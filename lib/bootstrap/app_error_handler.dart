import 'dart:async';

import 'package:app_monitoring/app_monitoring.dart';
import 'package:flutter/foundation.dart';

final class AppErrorHandler {
  const AppErrorHandler._();

  static void install(ErrorReporter reporter) {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);

      unawaited(reporter.recordFlutterError(details, fatal: true));
    };

    PlatformDispatcher.instance.onError = (error, stackTrace) {
      unawaited(
        reporter.recordError(
          error,
          stackTrace,
          fatal: true,
          reason: 'Unhandled platform error',
        ),
      );

      return true;
    };
  }
}
