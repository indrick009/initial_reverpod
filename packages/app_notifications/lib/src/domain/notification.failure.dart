sealed class NotificationFailure implements Exception {
  const NotificationFailure(this.message, {this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

final class NotificationInitializationFailure extends NotificationFailure {
  const NotificationInitializationFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}

final class NotificationPermissionFailure extends NotificationFailure {
  const NotificationPermissionFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}

final class NotificationDisplayFailure extends NotificationFailure {
  const NotificationDisplayFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}

final class NotificationTokenFailure extends NotificationFailure {
  const NotificationTokenFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}

final class NotificationRoutingFailure extends NotificationFailure {
  const NotificationRoutingFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}
