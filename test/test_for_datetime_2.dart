import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_profile_repository.dart';
import 'package:yandex_flutter_handbook/unit_tests/user_repository.dart';

import 'test_for_datetime_2.mocks.dart';

@GenerateMocks([IUserProfileDatasource])
void main() {
  late final MockIUserProfileDatasource mockIUserProfileDatasource;

  final expectedCurrentDayDate = DateTime(2023, 12, 31, 23, 59);

  const expectedCurrentDayBalance = 1.0;

  final expectedNextDayDate = DateTime(2024, 01, 01, 00, 01);

  const expectedNextDayBalance = 2.0;

  setUpAll(() {
    mockIUserProfileDatasource = MockIUserProfileDatasource();
  });

  //
  group('UserProfileProvider', () {
    group('getAccountBalance method', () {
      //
      test('should return balance for current day correctly', () {
        //
        when(
          mockIUserProfileDatasource.getUserBalance(expectedCurrentDayDate),
        ).thenAnswer((_) async => expectedCurrentDayBalance);

        final userProfileRepository = UserProfileRepositoryImpl(
          userProfileDatasource: mockIUserProfileDatasource,
          clock: Clock.fixed(expectedCurrentDayDate),
        );

        final balance = userProfileRepository.getAccountBalance();

        expect(balance, completion(expectedCurrentDayBalance));
        verify(mockIUserProfileDatasource.getUserBalance(expectedCurrentDayDate)).called(1);
      });

      //
      test('should return balance for the next day depending savings account percents', () {
        //
        when(
          mockIUserProfileDatasource.getUserBalance(expectedNextDayDate),
        ).thenAnswer((_) async => expectedNextDayBalance);

        final userProfileRepository = UserProfileRepositoryImpl(
          userProfileDatasource: mockIUserProfileDatasource,
          clock: Clock.fixed(expectedNextDayDate),
        );

        final balance = userProfileRepository.getAccountBalance();

        expect(balance, completion(expectedNextDayBalance));
        verify(mockIUserProfileDatasource.getUserBalance(expectedNextDayDate)).called(1);
      });
    });
  });

  //
  group('onBalanceChanged stream', () {
    test('should emit balance for current day correctly', () {});

    test('should emit balance for the next day depending savings account percents', () {});
  });
}
