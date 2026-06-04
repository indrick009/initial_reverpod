import 'dart:async';

import 'notification.message.dart';

abstract interface class PushNotificationService {
  Future<void> initialize({
    required FutureOr<void> Function(NotificationMessage message)
    onForegroundMessage,
    required FutureOr<void> Function(NotificationMessage message)
    onNotificationOpened,
  });

  Future<void> subscribeToTopic(String topic);

  Future<void> unsubscribeFromTopic(String topic);
}
