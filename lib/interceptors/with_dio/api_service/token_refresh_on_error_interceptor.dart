import 'package:dio/dio.dart';

class TokenRefreshOnErrorInterceptor extends Interceptor {
  TokenRefreshOnErrorInterceptor({
    required final Map<String, Object?> localHash,
    required final Dio dio,
  }) : _dio = dio,
       _localHash = localHash;

  final Dio _dio;
  final Map<String, Object?> _localHash;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _refreshToken();
      final token = _localHash['token'];
      err.requestOptions.headers['Authorization'] = 'Bearer $token';

      // Instead of throwing an error to the app, the interceptor re-sends the same request to the server, now with a fresh token.
      final response = await _dio.fetch(err.requestOptions);

      // This tells Dio:
      // “Don’t treat this as an error anymore. Replace the failed request’s result with this new successful response.”
      // 	So, your app receives the original response it expected, without ever knowing the token had expired.
      return handler.resolve(response);
    }

    return handler.next(err);
  }

  Future<void> _refreshToken() async {
    // imitate the request
    // final response = await _dio.post(
    //   "https://example.com/api/refresh",
    //   data: {"refresh_token": _localHash['token']},
    // );

    _localHash['token'] = "NewRealTokenWhichIsNotRealI1notRealTokenR5cCI6IkpXVCJ9.ey";
  }
}
