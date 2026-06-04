import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/notification.failure.dart';
import '../../domain/notification.token.provider.dart';

final class FirebaseNotificationTokenProvider
    implements NotificationTokenProvider {
  FirebaseNotificationTokenProvider({FirebaseMessaging? firebaseMessaging})
    : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _firebaseMessaging;

  @override
  Future<String?> getToken() async {
    try {
      return _firebaseMessaging.getToken();
    } catch (error, stackTrace) {
      throw NotificationTokenFailure(
        'Failed to read Firebase notification token.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _firebaseMessaging.deleteToken();
    } catch (error, stackTrace) {
      throw NotificationTokenFailure(
        'Failed to delete Firebase notification token.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
