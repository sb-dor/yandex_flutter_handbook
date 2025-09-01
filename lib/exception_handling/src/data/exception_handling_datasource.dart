import 'dart:io';

import 'package:yandex_flutter_handbook/exception_handling/common/exceptions/rest_client_exception.dart';
import 'package:yandex_flutter_handbook/exception_handling/common/http_client.dart';

abstract interface class IExceptionHandlingDatasource {
  //
  Future<String> test();
}

final class ExceptionHandlingDatasourceImpl implements IExceptionHandlingDatasource {
  ExceptionHandlingDatasourceImpl({required BaseHttpClient baseHttpClient})
    : _baseHttpClient = baseHttpClient;

  final BaseHttpClient _baseHttpClient;

  @override
  Future<String> test() async {
    try {
      return _baseHttpClient.patch();
    } on ServerErrorException catch (error, stackTrace) {
      if (error.statusCode == HttpStatus.unauthorized) {
        Error.throwWithStackTrace(UnAuthenticatedException(message: error.message), stackTrace);
      }
      rethrow;
    }
  }
}
