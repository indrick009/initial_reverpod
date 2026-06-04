import 'notification.message.dart';

abstract interface class LocalNotificationService {
  Future<void> initialize({
    required void Function(NotificationMessage message) onNotificationTap,
  });

  Future<void> show(NotificationMessage message);

  Future<void> cancel(String id);

  Future<void> cancelAll();
}
