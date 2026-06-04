sealed class RoutingFailure implements Exception {
  const RoutingFailure(this.message, {this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

final class InvalidDeepLinkFailure extends RoutingFailure {
  const InvalidDeepLinkFailure(super.message, {super.cause, super.stackTrace});
}

final class UnsupportedRouteFailure extends RoutingFailure {
  const UnsupportedRouteFailure(super.message, {super.cause, super.stackTrace});
}

final class InvalidNotificationRouteFailure extends RoutingFailure {
  const InvalidNotificationRouteFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}
