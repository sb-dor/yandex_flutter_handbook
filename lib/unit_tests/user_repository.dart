import 'package:yandex_flutter_handbook/unit_tests/user_model.dart';

abstract interface class IUserRepository {
  UserModel getUserById(int id);

  void removeUserById(int id);

  UserModel createUser(String name);

  UserModel updateUserName(int id, String name);
}

final class UserRepositoryImpl implements IUserRepository {
  @override
  UserModel createUser(String name) {
    throw UnimplementedError();
  }

  @override
  UserModel getUserById(int id) {
    throw UnimplementedError();
  }

  @override
  void removeUserById(int id) {}

  @override
  UserModel updateUserName(int id, String name) {
    throw UnimplementedError();
  }
}