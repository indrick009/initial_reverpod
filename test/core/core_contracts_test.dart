import 'package:flutter_test/flutter_test.dart';
import 'package:test_riverpod/core/error/exceptions.dart';
import 'package:test_riverpod/core/error/failures.dart';
import 'package:test_riverpod/core/usecase/usecase.dart';

void main() {
  group('Failure', () {
    test('keeps the error context', () {
      final cause = StateError('invalid state');
      final failure = UnexpectedFailure(
        'Something went wrong.',
        code: 'unexpected',
        cause: cause,
      );

      expect(failure.message, 'Something went wrong.');
      expect(failure.code, 'unexpected');
      expect(failure.cause, same(cause));
    });
  });

  group('AppException', () {
    test('prints its code when available', () {
      const exception = UnexpectedAppException(
        'Something went wrong.',
        code: 'unexpected',
      );

      expect(
        exception.toString(),
        'UnexpectedAppException(unexpected): Something went wrong.',
      );
    });
  });

  group('UseCase', () {
    test('can model an async application action', () async {
      final useCase = _DoubleNumberUseCase();

      await expectLater(useCase(21), completion(42));
    });
  });
}

final class _DoubleNumberUseCase implements UseCase<int, int> {
  @override
  Future<int> call(int input) async {
    return input * 2;
  }
}
