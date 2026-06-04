import 'package:app_notifications/app_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_app_initializer.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await FirebaseAppInitializer.initializeDefaultApp();

  final notificationMessage = const FirebaseNotificationMessageMapper().map(
    message,
  );

  await const DefaultBackgroundNotificationHandler().handle(
    notificationMessage,
  );
}
