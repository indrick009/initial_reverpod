sealed class CacheFailure implements Exception {
  const CacheFailure(this.message, {this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

final class CacheReadFailure extends CacheFailure {
  const CacheReadFailure(super.message, {super.cause, super.stackTrace});
}

final class CacheWriteFailure extends CacheFailure {
  const CacheWriteFailure(super.message, {super.cause, super.stackTrace});
}

final class CacheDeleteFailure extends CacheFailure {
  const CacheDeleteFailure(super.message, {super.cause, super.stackTrace});
}

final class CacheSerializationFailure extends CacheFailure {
  const CacheSerializationFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}
