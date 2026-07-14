import 'package:dio/dio.dart';

import 'exception.dart';

class DioErrorHandler {
  static void onDioError(DioException e) {
    if (e.response?.statusCode == 400) {
      final serverMessage = e.response?.data?['error']?['message'] ?? '';
      throw UnknownException(message: serverMessage);
    } else if (e.response?.statusCode == 401) {
      throw InvalidCredentialsException();
    }
  }
}
