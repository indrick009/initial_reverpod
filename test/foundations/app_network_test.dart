import 'package:app_network/app_network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NetworkRetryPolicy', () {
    test('retries timeout failures before max attempts', () {
      const policy = NetworkRetryPolicy(maxAttempts: 3);

      expect(
        policy.shouldRetry(
          failure: const NetworkTimeoutFailure('timeout'),
          attempt: 1,
        ),
        isTrue,
      );
    });

    test('does not retry unauthorized failures', () {
      const policy = NetworkRetryPolicy(maxAttempts: 3);

      expect(
        policy.shouldRetry(
          failure: const UnauthorizedFailure('unauthorized'),
          attempt: 1,
        ),
        isFalse,
      );
    });

    test('uses zero delay for the first attempt', () {
      const policy = NetworkRetryPolicy();

      expect(policy.delayForAttempt(1), Duration.zero);
    });
  });
}
