import 'package:app_routing/app_routing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('OpenHomeIntent resolves to root location', () {
    final location = const OpenHomeIntent().location;

    expect(location.path, '/');
    expect(location.toString(), '/');
  });

  test('RouteLocation builds URI with query parameters', () {
    const location = RouteLocation(
      path: '/target',
      queryParameters: {'from': 'notification'},
    );

    expect(location.toString(), '/target?from=notification');
  });
}
