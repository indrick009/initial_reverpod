import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/notification.failure.dart';
import '../../domain/notification.message.dart';
import '../../domain/push.notification.service.dart';
import 'firebase.notification.message.mapper.dart';

final class FirebasePushNotificationService implements PushNotificationService {
  FirebasePushNotificationService({
    FirebaseMessaging? firebaseMessaging,
    FirebaseNotificationMessageMapper mapper =
        const FirebaseNotificationMessageMapper(),
  }) : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance,
       _mapper = mapper;

  final FirebaseMessaging _firebaseMessaging;
  final FirebaseNotificationMessageMapper _mapper;
  StreamSubscription<RemoteMessage>? _foregroundSubscription;
  StreamSubscription<RemoteMessage>? _openedSubscription;

  @override
  Future<void> initialize({
    required FutureOr<void> Function(NotificationMessage message)
    onForegroundMessage,
    required FutureOr<void> Function(NotificationMessage message)
    onNotificationOpened,
  }) async {
    try {
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      _foregroundSubscription?.cancel();
      _foregroundSubscription = FirebaseMessaging.onMessage.listen(
        (message) => onForegroundMessage(_mapper.map(message)),
      );

      _openedSubscription?.cancel();
      _openedSubscription = FirebaseMessaging.onMessageOpenedApp.listen(
        (message) => onNotificationOpened(_mapper.map(message)),
      );

      final initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage != null) {
        onNotificationOpened(_mapper.map(initialMessage));
      }
    } catch (error, stackTrace) {
      throw NotificationInitializationFailure(
        'Failed to initialize Firebase push notifications.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
    } catch (error, stackTrace) {
      throw NotificationInitializationFailure(
        'Failed to subscribe to Firebase notification topic "$topic".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
    } catch (error, stackTrace) {
      throw NotificationInitializationFailure(
        'Failed to unsubscribe from Firebase notification topic "$topic".',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> dispose() async {
    await _foregroundSubscription?.cancel();
    await _openedSubscription?.cancel();
  }
}
