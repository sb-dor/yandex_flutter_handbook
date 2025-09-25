import 'package:dio/dio.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/api_service/api_service_iwd.dart';

Map<String, Object?> localHash = {};

void main() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 15),
      sendTimeout: Duration(seconds: 15),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers['X-Some-Data'] = "plaintext";

        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('coming response: $response');

        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) async {
        print("Coming error: ${error.message}");

        // if we are unauthorized using current token
        // we will get new token and make request once again
        if (error.response?.statusCode == 401) {
          print("Unauthenticated exception");
          await _refreshToken(dio);
          final opts = error.requestOptions;
          opts.headers['Authorization'] = 'Bearer ${localHash['token']}';
          final response = await dio.fetch(opts);
          return handler.resolve(response);
        }

        return handler.next(error);
      },
    ),
  );

  final apiService = ApiServiceIwd(dio: dio);

  await apiService.getUser("1");
}

// just an example
Future<void> _refreshToken(Dio dio) async {
  final response = await dio.post(
    "https://example.com/api/refresh",
    data: {"refresh_token": localHash['token']},
  );

  localHash['token'] = response.data;
}
