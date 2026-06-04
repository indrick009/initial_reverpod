import '../domain/local.notification.service.dart';
import '../domain/notification.failure.dart';
import '../domain/notification.message.dart';

final class ForegroundNotificationHandler {
  const ForegroundNotificationHandler({
    required LocalNotificationService localNotificationService,
  }) : _localNotificationService = localNotificationService;

  final LocalNotificationService _localNotificationService;

  Future<void> handle(NotificationMessage message) async {
    try {
      await _localNotificationService.show(message);
    } on NotificationFailure {
      rethrow;
    } catch (error, stackTrace) {
      throw NotificationDisplayFailure(
        'Failed to handle foreground notification.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
