// dart
import 'package:flutter_test/flutter_test.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_repository.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_model.dart';

class MockedUserRepository implements IUserRepository {
  final Map<int, UserModel> _users = {};
  int _nextId = 1;

  @override
  Future<UserModel> createUser(String name) async {
    if (name.isEmpty) throw ArgumentError('User name cannot be empty');
    final user = UserModel(id: _nextId++, name: name);
    _users[user.id] = user;
    return user;
  }

  @override
  Future<UserModel> getUserById(int id) async {
    final user = _users[id];
    if (user == null) throw StateError('User not found');
    return user;
  }

  @override
  Future<bool> removeUserById(int id) async {
    if (!_users.containsKey(id)) throw StateError('User not found');
    _users.remove(id);
    return true;
  }

  @override
  Future<UserModel> updateUserName(int id, String name) async {
    final user = _users[id];
    if (user == null) throw StateError('User not found');
    final updated = UserModel(id: id, name: name);
    _users[id] = updated;
    return updated;
  }
}

void main() {
  late MockedUserRepository repository;

  setUp(() {
    repository = MockedUserRepository();
  });

  group('UserRepositoryImpl', () {
    group('getUserById method', () {
      test('should return correct UserModel for existing user specified by Id', () async {
        final user = await repository.createUser('Alice');
        final fetched = await repository.getUserById(user.id);
        expect(fetched.id, user.id);
        expect(fetched.name, 'Alice');
      });

      test('should throw exception if user does not exist', () {
        expect(() => repository.getUserById(999), throwsA(isA<StateError>()));
      });
    });

    group('removeUserById method', () {
      test('should remove correctly an existing user specified by Id', () async {
        final user = await repository.createUser('Bob');
        repository.removeUserById(user.id);
        expect(() => repository.getUserById(user.id), throwsA(isA<StateError>()));
      });

      test('should throw exception if user does not exist', () {
        expect(() => repository.removeUserById(999), throwsA(isA<StateError>()));
      });
    });

    group('createUser method', () {
      test('should create new User if all conditions are correct', () async {
        final user = await repository.createUser('Charlie');
        expect(user.id, isNonZero);
        expect(user.name, 'Charlie');
      });

      test('should throw exception if user name is empty', () {
        expect(() => repository.createUser(''), throwsA(isA<ArgumentError>()));
      });
    });

    group('updateUserName method', () {
      test('should return updated User model', () async {
        final user = await repository.createUser('Dave');
        final updated = await repository.updateUserName(user.id, 'David');
        expect(updated.id, user.id);
        expect(updated.name, 'David');
      });

      test('should throw exception if user does not exist', () {
        expect(() => repository.updateUserName(999, 'Eve'), throwsA(isA<StateError>()));
      });
    });
  });
}
