import '../domain/network.failure.dart';

final class NetworkRetryPolicy {
  const NetworkRetryPolicy({
    this.maxAttempts = 3,
    this.baseDelay = const Duration(milliseconds: 300),
    this.maxDelay = const Duration(seconds: 3),
  }) : assert(maxAttempts >= 1);

  final int maxAttempts;
  final Duration baseDelay;
  final Duration maxDelay;

  bool shouldRetry({required NetworkFailure failure, required int attempt}) {
    if (attempt >= maxAttempts) return false;

    return switch (failure) {
      NoInternetFailure() ||
      NetworkTimeoutFailure() ||
      RequestCancelledFailure() => true,
      ServerFailure(statusCode: final statusCode) => _isRetryableServerStatus(
        statusCode,
      ),
      _ => false,
    };
  }

  Duration delayForAttempt(int attempt) {
    if (attempt <= 1) return Duration.zero;

    final multiplier = 1 << (attempt - 2);
    final delay = baseDelay * multiplier;

    if (delay > maxDelay) return maxDelay;

    return delay;
  }

  bool _isRetryableServerStatus(int? statusCode) {
    return statusCode == 408 ||
        statusCode == 429 ||
        statusCode == 500 ||
        statusCode == 502 ||
        statusCode == 503 ||
        statusCode == 504;
  }
}
