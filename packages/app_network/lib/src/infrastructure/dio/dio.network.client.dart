import 'dart:convert';

import 'package:dio/dio.dart';

import '../../application/network.retry.policy.dart';
import '../../domain/http.method.dart';
import '../../domain/network.client.dart';
import '../../domain/network.request.dart';
import '../../domain/network.response_body_type.dart';
import '../../domain/network.response.dart';
import 'dio.api_log.interceptor.dart';
import 'dio.error.mapper.dart';

final class DioNetworkClient implements NetworkClient {
  DioNetworkClient({
    required String baseUrl,
    Dio? dio,
    DioErrorMapper errorMapper = const DioErrorMapper(),
    NetworkRetryPolicy retryPolicy = const NetworkRetryPolicy(),
    Map<String, String> defaultHeaders = const <String, String>{},
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 20),
    Duration sendTimeout = const Duration(seconds: 20),
    bool enableApiLogs = true,
  }) : _errorMapper = errorMapper,
       _retryPolicy = retryPolicy {
    _dio =
        dio ??
        Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: defaultHeaders,
            connectTimeout: connectTimeout,
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
          ),
        );

    if (enableApiLogs) {
      _dio.interceptors.add(const DioApiLogInterceptor());
    }
  }

  late final Dio _dio;
  final DioErrorMapper _errorMapper;
  final NetworkRetryPolicy _retryPolicy;

  @override
  Future<NetworkResponse<T>> send<T>(NetworkRequest request) async {
    var attempt = 1;

    while (true) {
      try {
        final response = await _dio.request<Object?>(
          request.path,
          data: request.body,
          queryParameters: request.queryParameters,
          options: Options(
            method: _methodName(request.method),
            headers: request.headers,
            sendTimeout: request.timeout,
            receiveTimeout: request.timeout,
            responseType: _responseType(request.responseBodyType),
          ),
        );

        return NetworkResponse<T>(
          statusCode: response.statusCode ?? 0,
          data: _responseData<T>(response.data, request.responseBodyType),
          headers: response.headers.map,
        );
      } catch (error, stackTrace) {
        final failure = _errorMapper.map(error, stackTrace);

        if (!_retryPolicy.shouldRetry(failure: failure, attempt: attempt)) {
          throw failure;
        }

        await Future<void>.delayed(_retryPolicy.delayForAttempt(attempt));
        attempt++;
      }
    }
  }

  String _methodName(HttpMethod method) {
    return switch (method) {
      HttpMethod.get => 'GET',
      HttpMethod.post => 'POST',
      HttpMethod.put => 'PUT',
      HttpMethod.patch => 'PATCH',
      HttpMethod.delete => 'DELETE',
    };
  }

  ResponseType _responseType(NetworkResponseBodyType bodyType) {
    return switch (bodyType) {
      NetworkResponseBodyType.json => ResponseType.json,
      NetworkResponseBodyType.plainText => ResponseType.plain,
    };
  }

  T _responseData<T>(Object? data, NetworkResponseBodyType bodyType) {
    if (bodyType == NetworkResponseBodyType.plainText && T == String) {
      return switch (data) {
        String value => value as T,
        null => '' as T,
        _ => jsonEncode(data) as T,
      };
    }

    return data as T;
  }
}
