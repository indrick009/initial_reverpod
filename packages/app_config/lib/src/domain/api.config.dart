final class ApiConfig {
  const ApiConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 20),
    this.sendTimeout = const Duration(seconds: 20),
  });

  final Uri baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;
}
