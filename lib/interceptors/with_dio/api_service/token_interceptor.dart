import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({required final Map<String, Object?> localHash, required final Logger logger})
    : _localHash = localHash,
      _logger = logger;

  final Map<String, Object?> _localHash;
  final Logger _logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _localHash['token'];
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['X-DB-Name'] = _localHash['db_name'];
    _logger.log(Level.debug, 'Request headers: ${options.headers}');
    return handler.next(options);
  }
}
