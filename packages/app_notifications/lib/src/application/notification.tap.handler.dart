import 'package:app_routing/app_routing.dart';

import '../domain/notification.failure.dart';
import '../domain/notification.message.dart';
import 'notification.route.resolver.dart';

final class NotificationTapHandler {
  const NotificationTapHandler({
    required NotificationRouteResolver routeResolver,
    required void Function(NavigationIntent intent) onIntentResolved,
  }) : _routeResolver = routeResolver,
       _onIntentResolved = onIntentResolved;

  final NotificationRouteResolver _routeResolver;
  final void Function(NavigationIntent intent) _onIntentResolved;

  void handle(NotificationMessage message) {
    try {
      final intent = _routeResolver.resolve(message);
      _onIntentResolved(intent);
    } catch (error, stackTrace) {
      throw NotificationRoutingFailure(
        'Failed to resolve notification tap.',
        cause: error,
        stackTrace: stackTrace,
      );
    }
  }
}
