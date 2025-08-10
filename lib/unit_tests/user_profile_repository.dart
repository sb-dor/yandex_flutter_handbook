import 'dart:async';

import 'package:clock/clock.dart';

abstract interface class IUserProfileRepository {
  //
  Stream<double> get onBalanceChanges;

  Future<double> getAccountBalance();
}

final class UserProfileRepositoryImpl implements IUserProfileRepository {
  UserProfileRepositoryImpl({required IUserProfileDatasource userProfileDatasource, Clock? clock})
    : _iUserProfileDatasource = userProfileDatasource,
      _clock = clock ?? Clock() {
    Timer.periodic(
      Duration(hours: 1),
      (_) async => _streamController.sink.add(await getAccountBalance()),
    );
  }

  final IUserProfileDatasource _iUserProfileDatasource;
  final Clock _clock;

  @override
  Stream<double> get onBalanceChanges => _streamController.stream;

  final StreamController<double> _streamController = StreamController<double>.broadcast();

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
