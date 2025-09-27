import 'package:dio/dio.dart';
import 'package:yandex_flutter_handbook/interceptors/with_dio/models/user_iwd.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract interface class ApiService {
  factory ApiService(Dio dio, {final String? baseUrl}) = _ApiService;

  @GET('/users/{id}')
  Future<UserIWD> getUser(@Path("id") String id);

  @POST("/users")
  Future<UserIWD> createUser(@Body() UserIWD user);
}
