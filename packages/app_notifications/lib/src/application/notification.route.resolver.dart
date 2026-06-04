import 'package:app_routing/app_routing.dart';

import '../domain/notification.message.dart';

abstract interface class NotificationRouteResolver {
  NavigationIntent resolve(NotificationMessage message);
}

final class DefaultNotificationRouteResolver
    implements NotificationRouteResolver {
  const DefaultNotificationRouteResolver();

  @override
  NavigationIntent resolve(NotificationMessage message) {
    return const OpenHomeIntent();
  }
}
