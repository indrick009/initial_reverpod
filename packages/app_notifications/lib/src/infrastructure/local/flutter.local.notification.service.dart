import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../domain/local.notification.service.dart';
import '../../domain/notification.failure.dart';
import '../../domain/notification.message.dart';

final class FlutterLocalNotificationService
    implements LocalNotificationService {
  FlutterLocalNotificationService({
    FlutterLocalNotificationsPlugin? plugin,
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher'),
    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings(),
  }) : _plugin = plugin ?? FlutterLocalNotificationsPlugin(),
       _androidInitializationSettings = androidInitializationSettings,
       _darwinInitializationSettings = darwinInitializationSettings;

  final FlutterLocalNotificationsPlugin _plugin;
  final AndroidInitializationSettings _androidInitializationSettings;
  final DarwinInitializationSettings _darwinInitializationSettings;

  @override
  Future<void> initialize({
    required void Function(NotificationMessage message) onNotificationTap,
  }) async {
    try {
      final settings = InitializationSettings(
        android: _androidInitializationSettings,
        iOS: _darwinInitializationSettings,
        macOS: _darwinInitializationSettings,
      );

      await _plugin.initialize(
        settings,
        onDidReceiveNotificationResponse: (response) {
          final message = _messageFromPayload(response.payload);
          if (message != null) {
            onNotificationTap(message);
          }
        },
      );
    } catch (error, stackTrace) {
      throw NotificationInitializationFailure(
        'Failed to initialize local notifications.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> show(NotificationMessage message) async {
    try {
      await _plugin.show(
        message.id.hashCode,
        message.title,
        message.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            message.channelId,
            message.channelName,
          ),
          iOS: const DarwinNotificationDetails(),
          macOS: const DarwinNotificationDetails(),
        ),
        payload: jsonEncode(<String, Object?>{
          'id': message.id,
          'title': message.title,
          'body': message.body,
          'payload': message.payload,
          'channelId': message.channelId,
          'channelName': message.channelName,
        }),
      );
    } catch (error, stackTrace) {
      throw NotificationDisplayFailure(
        'Failed to show local notification.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> cancel(String id) async {
    try {
      await _plugin.cancel(id.hashCode);
    } catch (error, stackTrace) {
      throw NotificationDisplayFailure(
        'Failed to cancel local notification.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> cancelAll() async {
    try {
      await _plugin.cancelAll();
    } catch (error, stackTrace) {
      throw NotificationDisplayFailure(
        'Failed to cancel all local notifications.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }

  NotificationMessage? _messageFromPayload(String? payload) {
    if (payload == null || payload.isEmpty) return null;

    final decoded = jsonDecode(payload);
    if (decoded is! Map<String, Object?>) return null;

    final rawPayload = decoded['payload'];

    return NotificationMessage(
      id: decoded['id'] as String? ?? '',
      title: decoded['title'] as String? ?? '',
      body: decoded['body'] as String? ?? '',
      payload: rawPayload is Map
          ? rawPayload.map(
              (key, value) => MapEntry(key.toString(), value.toString()),
            )
          : const <String, String>{},
      channelId: decoded['channelId'] as String? ?? 'default',
      channelName: decoded['channelName'] as String? ?? 'Default',
    );
  }
}
