import 'package:app_notifications/app_notifications.dart';
import 'package:app_routing/app_routing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'NotificationTapHandler resolves notification into navigation intent',
    () {
      NavigationIntent? resolvedIntent;
      final handler = NotificationTapHandler(
        routeResolver: const DefaultNotificationRouteResolver(),
        onIntentResolved: (intent) => resolvedIntent = intent,
      );

      handler.handle(
        const NotificationMessage(
          id: 'notification-1',
          title: 'Order',
          body: 'Ready',
        ),
      );

      expect(resolvedIntent, isA<OpenHomeIntent>());
    },
  );

  test(
    'ForegroundNotificationHandler delegates to local notification service',
    () async {
      final service = _FakeLocalNotificationService();
      final handler = ForegroundNotificationHandler(
        localNotificationService: service,
      );
      const message = NotificationMessage(
        id: 'notification-1',
        title: 'Order',
        body: 'Ready',
      );

      await handler.handle(message);

      expect(service.shownMessages, [message]);
    },
  );
}

final class _FakeLocalNotificationService implements LocalNotificationService {
  final shownMessages = <NotificationMessage>[];

  @override
  Future<void> initialize({
    required void Function(NotificationMessage message) onNotificationTap,
  }) async {}

  @override
  Future<void> show(NotificationMessage message) async {
    shownMessages.add(message);
  }

  @override
  Future<void> cancel(String id) async {}

  @override
  Future<void> cancelAll() async {}
}
