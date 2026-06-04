import 'package:dio/dio.dart';

final class DioApiLogInterceptor extends Interceptor {
  const DioApiLogInterceptor({this.enabled = true});

  static const _green = '\x1B[32m';
  static const _red = '\x1B[31m';
  static const _reset = '\x1B[0m';

  final bool enabled;

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (_shouldLog) {
      final request = response.requestOptions;
      final statusCode = response.statusCode ?? 0;

      _write(
        '$_green[API][${request.method}] '
        '${request.uri} -> $statusCode$_reset',
      );
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldLog) {
      final request = err.requestOptions;
      final statusCode = err.response?.statusCode;
      final status = statusCode == null ? 'FAILED' : statusCode.toString();

      _write(
        '$_red[API][${request.method}] '
        '${request.uri} -> $status (${err.type.name})$_reset',
      );
    }

    handler.next(err);
  }

  bool get _shouldLog {
    var isDebug = false;

    assert(() {
      isDebug = true;
      return true;
    }());

    return enabled && isDebug;
  }

  void _write(String message) {
    // ignore: avoid_print
    print(message);
  }
}
