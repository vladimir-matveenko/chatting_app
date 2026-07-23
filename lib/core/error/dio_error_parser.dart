import 'package:dio/dio.dart';

import 'api_error_codes.dart';
import 'exception.dart';

class DioErrorParser {
  static AppException parse(Object error) {
    if (error is! DioException) {
      return UnknownException(message: error.toString());
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NoInternetException();

      case DioExceptionType.cancel:
        return const UnknownException(message: 'Request cancelled');

      default:
        break;
    }

    final response = error.response;
    final data = response?.data;

    String? code;
    String? message;

    if (data is Map<String, dynamic>) {
      final apiError = data['error'];

      if (apiError is Map<String, dynamic>) {
        code = apiError['code']?.toString();
        message = apiError['message']?.toString();
      }

      message ??= data['message']?.toString();
    }

    switch (code) {
      case ApiErrorCodes.invalidCredentials:
        return InvalidCredentialsException(message: message);

      case ApiErrorCodes.sessionExpired:
        return SessionExpiredException(message: message);

      case ApiErrorCodes.emailAlreadyExists:
        return EmailAlreadyExistsException(message: message);

      case ApiErrorCodes.usernameAlreadyExists:
        return UsernameAlreadyExistsException(message: message);

      case ApiErrorCodes.validationFailed:
        return ValidationException(message: message);

      case ApiErrorCodes.forbidden:
        return ForbiddenException(message: message);

      case ApiErrorCodes.notFound:
      case ApiErrorCodes.userNotFound:
      case ApiErrorCodes.chatNotFound:
      case ApiErrorCodes.messageNotFound:
        return NotFoundException(message: message);

      case ApiErrorCodes.conflict:
        return ConflictException(message: message);

      case ApiErrorCodes.internalServerError:
        return ServerException(message: message);
    }

    switch (response?.statusCode) {
      case 400:
        return BadRequestException(message: message);

      case 401:
        return UnauthorizedException(message: message);

      case 403:
        return ForbiddenException(message: message);

      case 404:
        return NotFoundException(message: message);

      case 409:
        return ConflictException(message: message);

      case 422:
        return ValidationException(message: message);

      case 500:
      case 502:
      case 503:
        return ServerException(message: message);

      default:
        return UnknownException(message: message ?? error.message);
    }
  }
}
