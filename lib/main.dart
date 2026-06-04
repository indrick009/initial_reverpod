import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app/app.dart';
import 'bootstrap/app_error_handler.dart';
import 'bootstrap/app_bootstrap.dart';
import 'bootstrap/firebase_app_initializer.dart';
import 'bootstrap/firebase_background_notification_handler.dart';
import 'providers/app_core_providers.dart';
import 'providers/app_provider_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseAppInitializer.initializeDefaultApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final bootstrap = await AppBootstrap.initialize();
  AppErrorHandler.install(bootstrap.errorReporter);

  runApp(
    ProviderScope(
      observers: const [AppProviderObserver()],
      overrides: [
        appConfigProvider.overrideWithValue(bootstrap.config),
        storageBootstrapperProvider.overrideWithValue(
          bootstrap.storageBootstrapper,
        ),
        localNotificationServiceProvider.overrideWithValue(
          bootstrap.localNotificationService,
        ),
        pushNotificationServiceProvider.overrideWithValue(
          bootstrap.pushNotificationService,
        ),
        notificationTokenProvider.overrideWithValue(
          bootstrap.notificationTokenProvider,
        ),
        notificationPermissionServiceProvider.overrideWithValue(
          bootstrap.notificationPermissionService,
        ),
        errorReporterProvider.overrideWithValue(bootstrap.errorReporter),
      ],
      child: const App(),
    ),
  );
}
