final class NetworkResponse<T> {
  const NetworkResponse({
    required this.statusCode,
    required this.data,
    this.headers = const <String, List<String>>{},
  });

  final int statusCode;
  final T data;
  final Map<String, List<String>> headers;

  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}
