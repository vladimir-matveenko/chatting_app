import 'package:flutter/material.dart';

import '../error/dio_error_parser.dart';
import '../error/exception.dart';

abstract class BaseRemoteDataSource {
  /// Is available only for Data Source children.
  @protected
  Future<T> makeRequest<T>(Future<T> Function() request) async {
    try {
      return await request();
    } catch (e) {
      ApiErrorHandler.onError(e);
      throw UnknownException(message: 'Unhandled error');
    }
  }
}
