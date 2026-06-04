import 'package:app_config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppConfig exposes production state', () {
    final config = AppConfig(
      environment: AppEnvironment.production,
      api: ApiConfig(baseUrl: Uri.parse('https://api.example.com')),
    );

    expect(config.isProduction, isTrue);
    expect(config.api.baseUrl.host, 'api.example.com');
    expect(config.featureFlags.enableOfflineMode, isTrue);
    expect(config.monitoring.enabled, isFalse);
    expect(config.monitoring.crashReportingEnabled, isTrue);
    expect(config.monitoring.shouldReportCrashes, isFalse);
  });

  test('AppConfig can enable monitoring explicitly', () {
    final config = AppConfig(
      environment: AppEnvironment.production,
      api: ApiConfig(baseUrl: Uri.parse('https://api.example.com')),
      monitoring: const MonitoringConfig(enabled: true),
    );

    expect(config.monitoring.enabled, isTrue);
    expect(config.monitoring.shouldReportCrashes, isTrue);
  });

  test('AppConfig can disable crash reporting while monitoring is enabled', () {
    final config = AppConfig(
      environment: AppEnvironment.production,
      api: ApiConfig(baseUrl: Uri.parse('https://api.example.com')),
      monitoring: const MonitoringConfig(
        enabled: true,
        crashReportingEnabled: false,
      ),
    );

    expect(config.monitoring.enabled, isTrue);
    expect(config.monitoring.shouldReportCrashes, isFalse);
  });
}
