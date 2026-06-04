import '../domain/background.notification.handler.dart';
import '../domain/notification.message.dart';

final class DefaultBackgroundNotificationHandler
    implements BackgroundNotificationHandler {
  const DefaultBackgroundNotificationHandler();

  @override
  Future<void> handle(NotificationMessage message) async {
    // Background processing is intentionally empty by default.
    // Concrete apps can persist the message, show a local notification, or queue
    // a sync task from their composition layer.
  }
}
