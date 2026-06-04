final class RouteLocation {
  const RouteLocation({
    required this.path,
    this.queryParameters = const <String, String>{},
  });

  final String path;
  final Map<String, String> queryParameters;

  Uri toUri() {
    return Uri(
      path: path,
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );
  }

  @override
  String toString() => toUri().toString();
}
