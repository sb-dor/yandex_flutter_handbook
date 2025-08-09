import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserRepository', () {
    group('getUserById method', () {
      test('should return correct UserModel for existing user specified by Id', () {});
      test('should throw exception if user does not exist', () {});
    });

    group('removeUserById method', () {
      test('should remove correctly an existing user specified by Id', () {});
      test('should throw exception if user does not exist', () {});
    });

    group('createUser method', () {
      test('should create new User if all conditions are correct', () {});
      test('should throw exception if user name is empty', () {});
    });

    group('updateUserName method', () {
      test('should return updated User model', () {});
      test('should throw exception if user does not exist', () {});
    });
  });
}
