import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_model.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_repository.dart';

import 'yandex_unit_test_3.mocks.dart';

// Mocking repositories is not good idea, intead you have to have datasources (services)
// and then you have tom mock them
// in this example I know what to do, but for learning purpose I did in this way: without datasources
@GenerateMocks([IUserRepository])
void main() {
  late final MockIUserRepository mockIUserRepository;
  final UserModel testUserModel = UserModel(id: 1, name: "Test user");

  setUpAll(() {
    mockIUserRepository = MockIUserRepository();
  });

  group("User repository test", () {
    //
    group('getUserById method', () {
      //
      test('function should return user', () {
        //
        when(mockIUserRepository.getUserById(any)).thenAnswer((_) async => testUserModel);

        final user = mockIUserRepository.getUserById(1);

        expect(user, completion(isNotNull));
        verify(mockIUserRepository.getUserById(1)).called(1);
      });

      test('function should throw exception', () {
        //
        when(mockIUserRepository.getUserById(any)).thenThrow(StateError("User was not found"));

        expect(() => mockIUserRepository.getUserById(1), throwsA(isA<StateError>()));
      });
    });

    //
    group('removeUserById method ', () {
      //
      test('removeUserById should successfully remove user and return true', () {
        //
        when(mockIUserRepository.removeUserById(any)).thenAnswer((_) async => true);

        final removeUser = mockIUserRepository.removeUserById(1);

        expect(removeUser, completion(isTrue));
        verify(mockIUserRepository.removeUserById(1)).called(1);
      });
      //

      test('removeUserById should throw an exception', () {
        //
        when(mockIUserRepository.removeUserById(any)).thenThrow(StateError("User was not found"));

        expect(() => mockIUserRepository.removeUserById(1), throwsA(isA<StateError>()));
      });
    });

    //
    group('createUser method', () {
      //
      test('function should successfully create user', () {
        //
        when(mockIUserRepository.createUser(any)).thenAnswer((_) async => testUserModel);

        final createUser = mockIUserRepository.createUser("test");

        expect(createUser, completion(isNotNull));
        verify(mockIUserRepository.createUser(any)).called(1);
      });

      //
      test('function should throw an Argument error', () {
        //
        when(
          mockIUserRepository.createUser(any),
        ).thenThrow(ArgumentError("Parameter name should not be empty"));

        expect(() => mockIUserRepository.createUser(""), throwsA(isA<ArgumentError>()));
      });
    });
  });
}
