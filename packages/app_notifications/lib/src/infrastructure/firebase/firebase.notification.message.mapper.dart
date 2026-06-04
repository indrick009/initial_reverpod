import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/notification.message.dart';

final class FirebaseNotificationMessageMapper {
  const FirebaseNotificationMessageMapper();

  NotificationMessage map(RemoteMessage message) {
    return NotificationMessage(
      id: message.messageId ?? DateTime.now().microsecondsSinceEpoch.toString(),
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: message.data.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
      channelId: message.data['channelId']?.toString() ?? 'default',
      channelName: message.data['channelName']?.toString() ?? 'Default',
    );
  }
}
