sealed class ConfigFailure implements Exception {
  const ConfigFailure(this.message, {this.cause, this.stackTrace});

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

final class MissingConfigFailure extends ConfigFailure {
  const MissingConfigFailure(super.message, {super.cause, super.stackTrace});
}

final class InvalidConfigFailure extends ConfigFailure {
  const InvalidConfigFailure(super.message, {super.cause, super.stackTrace});
}
