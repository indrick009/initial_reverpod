import 'package:app_notifications/app_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  final notificationMessage = const FirebaseNotificationMessageMapper().map(
    message,
  );

  await const DefaultBackgroundNotificationHandler().handle(
    notificationMessage,
  );
}
