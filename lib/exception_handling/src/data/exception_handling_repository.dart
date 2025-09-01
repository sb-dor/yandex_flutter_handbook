import 'package:yandex_flutter_handbook/exception_handling/src/data/exception_handling_datasource.dart';

abstract interface class IExceptionHandlingRepository {
  //
  Future<String> test();
}

final class ExceptionHandlingRepositoryImpl implements IExceptionHandlingRepository {
  ExceptionHandlingRepositoryImpl({
    required IExceptionHandlingDatasource iExceptionHandlingDatasource,
  }) : _iExceptionHandlingDatasource = iExceptionHandlingDatasource;

  final IExceptionHandlingDatasource _iExceptionHandlingDatasource;

  @override
  Future<String> test() => _iExceptionHandlingDatasource.test();
}
