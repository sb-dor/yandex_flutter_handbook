import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/api_service/logging_interceptor.dart';
import 'package:yandex_flutter_handbook/retrofit/api_service/api_service.dart';

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

  dio.interceptors.addAll([LoggingInterceptor(logger)]);

  final retrofitApiService = ApiService(dio);

  final user = await retrofitApiService.getUser("1");

  final userCreate = await retrofitApiService.createUser(user);

  logger.log(Level.info, "User: ${user.toJson()}");
  logger.log(Level.info, "User creation: $userCreate");
}
