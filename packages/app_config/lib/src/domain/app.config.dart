import 'api.config.dart';
import 'app.environment.dart';
import 'feature.flags.dart';

final class AppConfig {
  const AppConfig({
    required this.environment,
    required this.api,
    this.featureFlags = const FeatureFlags(),
  });

  final AppEnvironment environment;
  final ApiConfig api;
  final FeatureFlags featureFlags;

  bool get isProduction => environment == AppEnvironment.production;
}
