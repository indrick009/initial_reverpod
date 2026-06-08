sealed class ProductFailure implements Exception {
  const ProductFailure(this.message, {this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() {
    final rootCause = cause;

    if (rootCause == null) {
      return message;
    }

    return '$message Cause: $rootCause';
  }
}

final class ProductLoadFailure extends ProductFailure {
  const ProductLoadFailure(super.message, {super.cause, super.stackTrace});
}

final class ProductParsingFailure extends ProductFailure {
  const ProductParsingFailure(super.message, {super.cause, super.stackTrace});
}
