import 'dart:io';

import 'exceptions/rest_client_exception.dart';

abstract class BaseHttpClient {
  Future<String> get();

  Future<String> post();

  Future<String> patch();

  Future<String> successPost();
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
    throw ClientException(
      message: "Client didn't save some things locally before request",
      statusCode: HttpStatus.badRequest,
    );
  }

  @override
  Future<String> successPost() => Future.value("Done!");
}
