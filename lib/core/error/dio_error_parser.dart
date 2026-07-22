import 'package:dio/dio.dart';

import 'exception.dart';

class ApiErrorHandler {
  static void onDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final serverMessage = e.response?.data?['error']?['message']?.toString();

    switch (statusCode) {
      case 400:
        throw UnknownException(message: serverMessage ?? 'Bad Request');
      case 401:
        throw InvalidCredentialsException();
      default:
        throw UnknownException(
          message: serverMessage ?? e.message ?? 'Network error + $statusCode',
        );
    }
  }

  static void onError(Object e) {
    if (e is DioException) {
      onDioError(e);
    } else {
      throw UnknownException(message: e.toString());
    }
  }
}
