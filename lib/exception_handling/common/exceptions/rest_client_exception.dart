sealed class RestClientException implements Exception {
  RestClientException(this.message, {this.statusCode});

  final String message;

  final int? statusCode;
}

final class UnAuthenticatedException extends RestClientException {
  UnAuthenticatedException({String? message})
    : super(message ?? "User is not authenticated", statusCode: 401);
}

final class ServerErrorException extends RestClientException {
  ServerErrorException({String? message, int? statusCode})
    : super(message ?? "Server error", statusCode: statusCode);
}
