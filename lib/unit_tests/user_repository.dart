import 'package:yandex_flutter_handbook/unit_tests/user_model.dart';

abstract interface class IUserRepository {
  Future<UserModel> getUserById(int id);

  Future<bool> removeUserById(int id);

  Future<UserModel> createUser(String name);

  Future<UserModel> updateUserName(int id, String name);
}

final class UserRepositoryImpl implements IUserRepository {
  @override
  Future<UserModel> createUser(String name) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeUserById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUserName(int id, String name) {
    throw UnimplementedError();
  }
}