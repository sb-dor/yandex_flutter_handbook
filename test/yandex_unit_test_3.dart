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
    group('User repository getUserById test', () {
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
  });
}
