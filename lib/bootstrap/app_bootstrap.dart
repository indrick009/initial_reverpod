import 'package:app_config/app_config.dart';
import 'package:app_notifications/app_notifications.dart';
import 'package:app_store/app_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_riverpod/firebase_options.dart';

final class AppBootstrap {
  const AppBootstrap._();

  static Future<AppBootstrapResult> initialize() async {
    final config = AppConfig(
      environment: AppEnvironment.development,
      api: ApiConfig(baseUrl: Uri.parse('https://api.crina.dev')),
    );

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final appDirectory = await getApplicationDocumentsDirectory();
    final storageBootstrapper = StorageBootstrapper(
      initializers: [HiveStorageInitializer(storagePath: appDirectory.path)],
    );

    await storageBootstrapper.initialize();

    final localNotificationService = FlutterLocalNotificationService();
    final notificationTapHandler = NotificationTapHandler(
      routeResolver: const DefaultNotificationRouteResolver(),
      onIntentResolved: (_) {},
    );

    await localNotificationService.initialize(
      onNotificationTap: notificationTapHandler.handle,
    );

    final pushNotificationService = FirebasePushNotificationService();
    final notificationTokenProvider = FirebaseNotificationTokenProvider();
    final notificationPermissionService =
        FirebaseNotificationPermissionService();

    await pushNotificationService.initialize(
      onForegroundMessage: (message) async {
        await localNotificationService.show(message);
      },
      onNotificationOpened: notificationTapHandler.handle,
    );

    return AppBootstrapResult(
      config: config,
      storageBootstrapper: storageBootstrapper,
      localNotificationService: localNotificationService,
      pushNotificationService: pushNotificationService,
      notificationTokenProvider: notificationTokenProvider,
      notificationPermissionService: notificationPermissionService,
    );
  }
}

final class AppBootstrapResult {
  const AppBootstrapResult({
    required this.config,
    required this.storageBootstrapper,
    required this.localNotificationService,
    required this.pushNotificationService,
    required this.notificationTokenProvider,
    required this.notificationPermissionService,
  });

  final AppConfig config;
  final StorageBootstrapper storageBootstrapper;
  final LocalNotificationService localNotificationService;
  final PushNotificationService pushNotificationService;
  final NotificationTokenProvider notificationTokenProvider;
  final NotificationPermissionService notificationPermissionService;
}
