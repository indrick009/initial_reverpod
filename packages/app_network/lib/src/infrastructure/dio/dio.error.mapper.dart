import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/network.failure.dart';

final class DioErrorMapper {
  const DioErrorMapper();

  NetworkFailure map(Object error, StackTrace stackTrace) {
    if (error is! DioException) {
      return UnknownNetworkFailure(
        'Unknown network failure.',
        cause: error,
        stackTrace: stackTrace,
      );
    }

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => NetworkTimeoutFailure(
        'Network request timed out.',
        cause: error,
        stackTrace: stackTrace,
      ),
      DioExceptionType.cancel => RequestCancelledFailure(
        'Network request was cancelled.',
        cause: error,
        stackTrace: stackTrace,
      ),
      DioExceptionType.badCertificate => BadResponseFailure(
        'Network request failed because of a bad certificate.',
        statusCode: error.response?.statusCode ?? 0,
        cause: error,
        stackTrace: stackTrace,
      ),
      DioExceptionType.connectionError => _mapConnectionError(
        error,
        stackTrace,
      ),
      DioExceptionType.badResponse => _mapBadResponse(error, stackTrace),
      DioExceptionType.unknown => _mapUnknown(error, stackTrace),
    };
  }

  NetworkFailure _mapConnectionError(
    DioException error,
    StackTrace stackTrace,
  ) {
    return NoInternetFailure(
      'No internet connection.',
      cause: error,
      stackTrace: stackTrace,
    );
  }

  NetworkFailure _mapUnknown(DioException error, StackTrace stackTrace) {
    if (error.error is SocketException) {
      return NoInternetFailure(
        'No internet connection.',
        cause: error,
        stackTrace: stackTrace,
      );
    }

    return UnknownNetworkFailure(
      'Unknown network failure.',
      cause: error,
      stackTrace: stackTrace,
    );
  }

  NetworkFailure _mapBadResponse(DioException error, StackTrace stackTrace) {
    final statusCode = error.response?.statusCode ?? 0;

    return switch (statusCode) {
      401 => UnauthorizedFailure(
        'Unauthorized request.',
        cause: error,
        stackTrace: stackTrace,
      ),
      403 => ForbiddenFailure(
        'Forbidden request.',
        cause: error,
        stackTrace: stackTrace,
      ),
      404 => NotFoundFailure(
        'Requested resource was not found.',
        cause: error,
        stackTrace: stackTrace,
      ),
      >= 500 => ServerFailure(
        'Server failure.',
        statusCode: statusCode,
        cause: error,
        stackTrace: stackTrace,
      ),
      _ => BadResponseFailure(
        'Bad network response.',
        statusCode: statusCode,
        cause: error,
        stackTrace: stackTrace,
      ),
    };
  }
}
