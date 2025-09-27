import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor(this._logger);

  final Logger _logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _logger.log(
      Level.info,
      "➡️ METHOD: ${options.method}\n"
      "URI: ${options.uri}\n"
      "SENDING DATA: ${options.data}\n"
      "SENDING QUERY_PARAMS: ${options.queryParameters}\n",
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.log(
      Level.info,
      "✅ STATUS: ${response.statusCode}\n"
      "URI: ${response.requestOptions.uri}\n"
      "COMING DATA: ${response.data}",
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.log(
      Level.error,
      "❌ STATUS: ${err.response?.statusCode}\n"
      "Message: ${err.message}\n"
      "Error: ${err.error}\n"
      "Stacktrace: ${err.stackTrace}\n",
    );
    return handler.next(err);
  }
}
