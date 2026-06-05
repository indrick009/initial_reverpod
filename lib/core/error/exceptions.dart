sealed class AppException implements Exception {
  const AppException(this.message, {this.code, this.cause, this.stackTrace});

  final String message;
  final String? code;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() {
    final exceptionCode = code;

    if (exceptionCode == null || exceptionCode.isEmpty) {
      return '$runtimeType: $message';
    }

    return '$runtimeType($exceptionCode): $message';
  }
}

final class UnexpectedAppException extends AppException {
  const UnexpectedAppException(
    super.message, {
    super.code,
    super.cause,
    super.stackTrace,
  });
}

final class ValidationAppException extends AppException {
  const ValidationAppException(
    super.message, {
    super.code,
    super.cause,
    super.stackTrace,
  });
}
