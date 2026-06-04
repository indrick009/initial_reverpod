import 'http.method.dart';

final class NetworkRequest {
  const NetworkRequest({
    required this.method,
    required this.path,
    this.queryParameters = const <String, Object?>{},
    this.headers = const <String, String>{},
    this.body,
    this.timeout,
  });

  final HttpMethod method;
  final String path;
  final Map<String, Object?> queryParameters;
  final Map<String, String> headers;
  final Object? body;
  final Duration? timeout;
}
