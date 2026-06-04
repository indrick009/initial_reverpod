sealed class StorageFailure implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const StorageFailure(this.message, {this.cause, this.stackTrace});

  @override
  String toString() => message;
}

final class StorageInitializationFailure extends StorageFailure {
  const StorageInitializationFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}

final class StorageReadFailure extends StorageFailure {
  const StorageReadFailure(super.message, {super.cause, super.stackTrace});
}

final class StorageWriteFailure extends StorageFailure {
  const StorageWriteFailure(super.message, {super.cause, super.stackTrace});
}

final class StorageDeleteFailure extends StorageFailure {
  const StorageDeleteFailure(super.message, {super.cause, super.stackTrace});
}

final class StorageEncryptionFailure extends StorageFailure {
  const StorageEncryptionFailure(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}
