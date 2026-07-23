abstract class AppException implements Exception {
  const AppException({this.message});

  final String? message;

  @override
  String toString() => message ?? runtimeType.toString();
}

//
// Network
//

abstract class NetworkException extends AppException {
  const NetworkException({super.message});
}

class BadRequestException extends NetworkException {
  const BadRequestException({super.message});
}

class UnauthorizedException extends NetworkException {
  const UnauthorizedException({super.message});
}

class ForbiddenException extends NetworkException {
  const ForbiddenException({super.message});
}

class NotFoundException extends NetworkException {
  const NotFoundException({super.message});
}

class ConflictException extends NetworkException {
  const ConflictException({super.message});
}

class ValidationException extends NetworkException {
  const ValidationException({super.message});
}

class ServerException extends NetworkException {
  const ServerException({super.message});
}

class TimeoutException extends NetworkException {
  const TimeoutException({super.message});
}

class NoInternetException extends NetworkException {
  const NoInternetException({super.message});
}

class UnknownException extends NetworkException {
  const UnknownException({super.message});
}

//
// Cache
//

class CacheException extends AppException {
  const CacheException({super.message});
}

//
// Business
//

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException({super.message});
}

class SessionExpiredException extends AppException {
  const SessionExpiredException({super.message});
}

class EmailAlreadyExistsException extends AppException {
  const EmailAlreadyExistsException({super.message});
}

class UsernameAlreadyExistsException extends AppException {
  const UsernameAlreadyExistsException({super.message});
}
