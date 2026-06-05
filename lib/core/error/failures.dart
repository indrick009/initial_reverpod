sealed class Failure {
  const Failure(this.message, {this.code, this.cause, this.stackTrace});

  final String message;
  final String? code;
  final Object? cause;
  final StackTrace? stackTrace;
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure(
    super.message, {
    super.code,
    super.cause,
    super.stackTrace,
  });
}

final class ValidationFailure extends Failure {
  const ValidationFailure(
    super.message, {
    super.code,
    super.cause,
    super.stackTrace,
  });
}

final class PermissionFailure extends Failure {
  const PermissionFailure(
    super.message, {
    super.code,
    super.cause,
    super.stackTrace,
  });
}
