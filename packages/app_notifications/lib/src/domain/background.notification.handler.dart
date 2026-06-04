import 'notification.message.dart';

abstract interface class BackgroundNotificationHandler {
  Future<void> handle(NotificationMessage message);
}
