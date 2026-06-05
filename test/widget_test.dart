import 'package:app_notifications/app_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/app/app.dart';
import 'package:test_riverpod/features/home/presentation/screens/home_screen.dart';
import 'package:test_riverpod/providers/app_core_providers.dart';

void main() {
  testWidgets('renders app shell', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localNotificationServiceProvider.overrideWithValue(
            const _FakeLocalNotificationService(),
          ),
          notificationPermissionServiceProvider.overrideWithValue(
            const _FakeNotificationPermissionService(),
          ),
        ],
        child: const App(),
      ),
    );

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

final class _FakeLocalNotificationService implements LocalNotificationService {
  const _FakeLocalNotificationService();

  @override
  Future<void> initialize({
    required void Function(NotificationMessage message) onNotificationTap,
  }) async {}

  @override
  Future<void> show(NotificationMessage message) async {}

  @override
  Future<void> cancel(String id) async {}

  @override
  Future<void> cancelAll() async {}
}

final class _FakeNotificationPermissionService
    implements NotificationPermissionService {
  const _FakeNotificationPermissionService();

  @override
  Future<NotificationPermissionStatus> status() async {
    return NotificationPermissionStatus.granted;
  }

  @override
  Future<NotificationPermissionStatus> requestPermission() async {
    return NotificationPermissionStatus.granted;
  }
}
