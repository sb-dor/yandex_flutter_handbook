import 'dart:io';

import 'package:yandex_flutter_handbook/exception_handling/common/exceptions/rest_client_exception.dart';

abstract interface class IExceptionHandlingDatasource {
  //
  Future<String> test();
}

final class ExceptionHandlingDatasourceImpl implements IExceptionHandlingDatasource {
  @override
  Future<String> test() async {
    try {
      throw ServerErrorException(
        message: "User is not authenticated",
        statusCode: HttpStatus.unauthorized,
      );
    } on ServerErrorException catch (error, stackTrace) {
      if (error.statusCode == HttpStatus.unauthorized) {
        Error.throwWithStackTrace(UnAuthenticatedException(message: error.message), stackTrace);
      }
      rethrow;
    }
  }
}
