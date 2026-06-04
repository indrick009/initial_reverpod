import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/notification.failure.dart';
import '../../domain/notification.permission.service.dart';
import '../../domain/notification.permission.status.dart';

final class FirebaseNotificationPermissionService
    implements NotificationPermissionService {
  FirebaseNotificationPermissionService({FirebaseMessaging? firebaseMessaging})
    : _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _firebaseMessaging;

  @override
  Future<NotificationPermissionStatus> status() async {
    try {
      final settings = await _firebaseMessaging.getNotificationSettings();
      return _mapAuthorizationStatus(settings.authorizationStatus);
    } catch (error, stackTrace) {
      throw NotificationPermissionFailure(
        'Failed to read notification permission status.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<NotificationPermissionStatus> requestPermission() async {
    try {
      final settings = await _firebaseMessaging.requestPermission();
      return _mapAuthorizationStatus(settings.authorizationStatus);
    } catch (error, stackTrace) {
      throw NotificationPermissionFailure(
        'Failed to request notification permission.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  NotificationPermissionStatus _mapAuthorizationStatus(
    AuthorizationStatus status,
  ) {
    return switch (status) {
      AuthorizationStatus.authorized => NotificationPermissionStatus.granted,
      AuthorizationStatus.denied => NotificationPermissionStatus.denied,
      AuthorizationStatus.provisional =>
        NotificationPermissionStatus.provisional,
      AuthorizationStatus.notDetermined => NotificationPermissionStatus.unknown,
    };
  }
}
