import 'package:clock/clock.dart';

abstract interface class IUserProfileRepository {
  Future<double> getAccountBalance();
}

final class UserProfileRepositoryImpl implements IUserProfileRepository {
  UserProfileRepositoryImpl({required IUserProfileDatasource userProfileDatasource, Clock? clock})
    : _iUserProfileDatasource = userProfileDatasource,
      _clock = clock ?? Clock();

  final IUserProfileDatasource _iUserProfileDatasource;
  final Clock _clock;

  @override
  Future<double> getAccountBalance() {
    return _iUserProfileDatasource.getUserBalance(_clock.now());
  }
}

abstract interface class IUserProfileDatasource {
  Future<double> getUserBalance(DateTime datetime);
}

final class UserProfileDatasourceImpl implements IUserProfileDatasource {
  @override
  Future<double> getUserBalance(DateTime datetime) async {
    return 0.0;
  }
}
