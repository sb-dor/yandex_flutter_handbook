import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/api_service/api_service_iwd.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/api_service/logging_interceptor.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/api_service/token_interceptor.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/api_service/token_refresh_on_error_interceptor.dart';

Map<String, Object?> localHash = {
  'token': 'RealTokenWhichIsNotRealI1notRealTokenR5cCI6IkpXVCJ9.ey',
  'db_name': "Database name",
};

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

  final logger = Logger();
  dio.interceptors.addAll([
    TokenInterceptor(localHash: localHash, logger: logger),
    LoggingInterceptor(logger),
    TokenRefreshOnErrorInterceptor(localHash: localHash, dio: dio),
  ]);

  final apiService = ApiServiceIwd(dio: dio);

  await apiService.getUser("1");
}
