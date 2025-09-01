sealed class RestClientException implements Exception {
  RestClientException(this.message, {this.statusCode});

  final String message;

  final int? statusCode;
}

final class UnAuthenticatedException extends RestClientException {
  UnAuthenticatedException({String? message})
    : super(message ?? "User is not authenticated", statusCode: 401);

  @override
  String toString() {
    return "Type: UnAuthenticatedException (Exception message: $message with statusCode: $statusCode)";
  }
}

final class ServerErrorException extends RestClientException {
  ServerErrorException({String? message, int? statusCode})
    : super(message ?? "Server error", statusCode: statusCode);

  @override
  String toString() {
    return "Type: ServerErrorException (Exception message: $message with statusCode: $statusCode)";
  }
}

final class ClientException extends RestClientException {
  ClientException({String? message})
    : super(message ?? "Something wrong happened in client side", statusCode: 400);

  @override
  String toString() {
    return "Type: ClientException (Exception message: $message with statusCode: $statusCode)";
  }
}
