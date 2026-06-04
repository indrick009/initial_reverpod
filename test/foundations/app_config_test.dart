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
  });
}
