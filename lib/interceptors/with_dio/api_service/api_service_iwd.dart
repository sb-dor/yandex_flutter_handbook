import 'package:dio/dio.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/exceptions/exceptions_iwd.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/models/user_iwd.dart';

class ApiServiceIwd {
  ApiServiceIwd({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<UserIWD> getUser(String id) async {
    try {
      final response = await _dio.get('/users/$id');

      print('response in function: ${response}');

      return UserIWD.fromJson(response.data);
    } on DioException catch (e) {
      print('При выполнении запроса возникла ошибка: ${e.message}');

      if (e.response?.statusCode == 401) {
        throw UnAuthenticatedExceptionIwd();
      }

      rethrow;
    }
  }

  /// Метод создания пользователя

  Future<UserIWD> createUser(UserIWD newUser) async {
    try {
      final response = await _dio.post(
        '/posts',
        data: newUser.toJson(),
      );

      return UserIWD.fromJson(response.data);
    } on DioException catch (e) {
      print('При выполнении запроса возникла ошибка: ${e.message}');

      if (e.response?.statusCode == 401) {
        throw UnAuthenticatedExceptionIwd();
      }

      rethrow;
    }
  }
}
