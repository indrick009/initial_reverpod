import 'notification.permission.status.dart';

abstract interface class NotificationPermissionService {
  Future<NotificationPermissionStatus> status();

  Future<NotificationPermissionStatus> requestPermission();
}
