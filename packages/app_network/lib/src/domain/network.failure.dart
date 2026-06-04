sealed class NetworkFailure implements Exception {
  const NetworkFailure(
    this.message, {
    this.statusCode,
    this.cause,
    this.stackTrace,
  });

  final String message;
  final int? statusCode;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

final class NoInternetFailure extends NetworkFailure {
  const NoInternetFailure(super.message, {super.cause, super.stackTrace});
}

final class NetworkTimeoutFailure extends NetworkFailure {
  const NetworkTimeoutFailure(super.message, {super.cause, super.stackTrace});
}

final class RequestCancelledFailure extends NetworkFailure {
  const RequestCancelledFailure(super.message, {super.cause, super.stackTrace});
}

final class UnauthorizedFailure extends NetworkFailure {
  const UnauthorizedFailure(
    super.message, {
    super.statusCode = 401,
    super.cause,
    super.stackTrace,
  });
}

final class ForbiddenFailure extends NetworkFailure {
  const ForbiddenFailure(
    super.message, {
    super.statusCode = 403,
    super.cause,
    super.stackTrace,
  });
}

final class NotFoundFailure extends NetworkFailure {
  const NotFoundFailure(
    super.message, {
    super.statusCode = 404,
    super.cause,
    super.stackTrace,
  });
}

final class BadResponseFailure extends NetworkFailure {
  const BadResponseFailure(
    super.message, {
    required super.statusCode,
    super.cause,
    super.stackTrace,
  });
}

final class ServerFailure extends NetworkFailure {
  const ServerFailure(
    super.message, {
    required super.statusCode,
    super.cause,
    super.stackTrace,
  });
}

final class SerializationFailure extends NetworkFailure {
  const SerializationFailure(super.message, {super.cause, super.stackTrace});
}

final class UnknownNetworkFailure extends NetworkFailure {
  const UnknownNetworkFailure(super.message, {super.cause, super.stackTrace});
}
