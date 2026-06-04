import 'package:app_config/app_config.dart';
import 'package:app_notifications/app_notifications.dart';
import 'package:app_store/app_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/assets/asset_preloader.dart';
import '../shared/assets/flutter_asset_preloader.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  throw UnimplementedError('AppConfig must be provided during bootstrap.');
});

final storageBootstrapperProvider = Provider<StorageBootstrapper>((ref) {
  throw UnimplementedError(
    'StorageBootstrapper must be provided during bootstrap.',
  );
});

final localNotificationServiceProvider = Provider<LocalNotificationService>((
  ref,
) {
  throw UnimplementedError(
    'LocalNotificationService must be provided during bootstrap.',
  );
});

final pushNotificationServiceProvider = Provider<PushNotificationService>((
  ref,
) {
  throw UnimplementedError(
    'PushNotificationService must be provided during bootstrap.',
  );
});

final notificationTokenProvider = Provider<NotificationTokenProvider>((ref) {
  throw UnimplementedError(
    'NotificationTokenProvider must be provided during bootstrap.',
  );
});

final notificationPermissionServiceProvider =
    Provider<NotificationPermissionService>((ref) {
      throw UnimplementedError(
        'NotificationPermissionService must be provided during bootstrap.',
      );
    });

final assetPreloaderProvider = Provider<AssetPreloader>((ref) {
  return const FlutterAssetPreloader();
});
