import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_model.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_repository.dart';

final class MockedUserRepository implements IUserRepository {
  final Map<int, UserModel> _users = {5: UserModel(id: 5, name: "Test")};

  int generateId() => Random().nextInt(100);

  @override
  Future<UserModel> createUser(String name) async {
    if (name.isEmpty) throw ArgumentError("Name cannot be empty");
    final user = UserModel(id: generateId(), name: name);
    _users[user.id] = user;
    return user;
  }

  @override
  Future<UserModel> getUserById(int id) async {
    final user = _users[id];
    if (user == null) throw StateError("User was not found");
    return user;
  }

  @override
  Future<bool> removeUserById(int id) async {
    if (_users[id] == null) throw StateError("User was not found to delete");
    _users.remove(id);
    return true;
  }

  @override
  Future<UserModel> updateUserName(int id, String name) async {
    if (name.isEmpty) throw ArgumentError("Name cannot be empty");
    final user = _users[id];
    if (user == null) throw StateError("User was not found");
    final updatedUser = UserModel(id: id, name: name);
    _users[id] = updatedUser;
    return updatedUser;
  }
}

void main() {
  late MockedUserRepository mockedUserRepository;

  setUp(() {
    mockedUserRepository = MockedUserRepository();
  });

  group('UserRepository', () {
    group('getUserById method', () {
      //
      test('should return correct UserModel for existing user specified by Id', () async {
        final int userId = 5;
        final user = await mockedUserRepository.getUserById(userId);
        expect(user.id, userId);
      });

      test('should throw exception if user does not exist', () {
        final int userId = 10;
        expect(mockedUserRepository.getUserById(userId), throwsA(isA<StateError>()));
      });
    });

    group('removeUserById method', () {
      //
      test('should remove correctly an existing user specified by Id', () async {
        final userid = 5;
        final remove = await mockedUserRepository.removeUserById(userid);
        expect(remove, isTrue);
      });

      test('should throw exception if user does not exist', () {
        final userid = 10;
        final remove = mockedUserRepository.removeUserById(userid);
        expect(remove, throwsA(isA<StateError>()));
      });
    });

    group('createUser method', () {
      //
      test('should create new User if all conditions are correct', () async {
        //
        final name = "TestUser";
        final user = await mockedUserRepository.createUser(name);
        expect(user, isNotNull);
        expect(user.name, same(name));
      });

      test('should throw exception if user name is empty', () async {
        //
        final name = "";
        final user = mockedUserRepository.createUser(name);
        expect(user, throwsA(isA<ArgumentError>()));
      });
    });

    group('updateUserName method', () {
      //
      test('should return updated User model', () async {
        //
        final name = "TestUser 2";
        final id = 5;
        final updateUser = mockedUserRepository.updateUserName(id, name);
        expect(updateUser, completion(isNotNull));
      });

      test('should throw exception if user does not exist', () {
        final name = "TestUser 2";
        final id = 10;
        final updateUser = mockedUserRepository.updateUserName(id, name);
        expect(updateUser, throwsA(isA<StateError>()));
      });

      test('should throw exception if name does not exist', () {
        final name = "";
        final id = 10;
        final updateUser = mockedUserRepository.updateUserName(id, name);
        expect(updateUser, throwsA(isA<ArgumentError>()));
      });
    });
  });
}
