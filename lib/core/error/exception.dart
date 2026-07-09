/// App exception
abstract class AppException implements Exception {}

/// Network Exceptions
abstract class NetworkException extends AppException {}

class UnauthorizedException extends NetworkException {
  UnauthorizedException({this.message});

  final String? message;
}

class ServerException extends NetworkException {
  ServerException({this.message});

  final String? message;
}

class TimeoutException extends NetworkException {
  TimeoutException({this.message});

  final String? message;
}

class NoInternetException extends NetworkException {
  NoInternetException({this.message});

  final String? message;
}

class UnknownException extends NetworkException {
  UnknownException({this.message});

  final String? message;
}

/// CacheException
class CacheException extends AppException {}

/// Auth exceptions
class InvalidCredentialsException extends AppException {}
