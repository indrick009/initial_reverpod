import 'route.location.dart';

sealed class NavigationIntent {
  const NavigationIntent();

  RouteLocation get location;
}

final class OpenHomeIntent extends NavigationIntent {
  const OpenHomeIntent();

  @override
  RouteLocation get location => const RouteLocation(path: '/');
}
