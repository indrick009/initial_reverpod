import 'api.config.dart';
import 'app.environment.dart';
import 'feature.flags.dart';
import 'monitoring.config.dart';

final class AppConfig {
  const AppConfig({
    required this.environment,
    required this.api,
    this.featureFlags = const FeatureFlags(),
    this.monitoring = const MonitoringConfig(),
  });

  final AppEnvironment environment;
  final ApiConfig api;
  final FeatureFlags featureFlags;
  final MonitoringConfig monitoring;

  bool get isProduction => environment == AppEnvironment.production;
}
