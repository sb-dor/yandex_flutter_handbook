import 'dart:io';

import 'exceptions/rest_client_exception.dart';

abstract class BaseHttpClient {
  Future<String> get();

  Future<String> post();

  Future<String> patch();
}

class HttpClient extends BaseHttpClient {
  // test
  @override
  Future<String> get() {
    throw ServerErrorException(
      message: "User is not authenticated",
      statusCode: HttpStatus.unauthorized,
    );
  }

  @override
  Future<String> post() {
    throw ServerErrorException(
      message: "User is not authenticated",
      statusCode: HttpStatus.internalServerError,
    );
  }

  @override
  Future<String> patch() {
    // test
    throw ClientException(message: "Client didnt save some things locally before request");
  }
}
