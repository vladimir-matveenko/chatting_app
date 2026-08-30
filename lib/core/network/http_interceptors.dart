import 'dart:async';
import 'dart:developer';

import 'package:chatting_app/features/auth/data/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../../features/auth/data/models/auth_token_model.dart';
import '../error/exception.dart';
import '../services/auth_session_manager.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  AuthInterceptor(
    this.localDataSource,
    this.sessionManager,
    @Named('refresh_dio') this.refreshDio,
  );

  static const _loginPath = 'auth/login';
  static const _refreshPath = 'auth/refresh';

  final AuthLocalDataSource localDataSource;
  final AuthSessionManager sessionManager;
  final Dio refreshDio;

  Future<String>? _refreshFuture;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final skipAuth = options.extra['skipAuth'] == true;

    if (!skipAuth) {
      final token = await localDataSource.getCachedToken();

      final accessToken = token?.accessToken;

      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    if (kDebugMode) {
      log(
        'HTTP ERROR: '
        '$statusCode '
        '${err.requestOptions.method} '
        '${err.requestOptions.uri}',
      );
    }

    final isUnauthorized = statusCode == 401;
    final isLoginCall = err.requestOptions.path.endsWith(_loginPath);
    final isRefreshCall = err.requestOptions.path.endsWith(_refreshPath);
    final alreadyRetried = err.requestOptions.extra['retried'] == true;

    if (!isUnauthorized) {
      return handler.next(err);
    }

    // Refresh itself failed.
    if (isRefreshCall) {
      sessionManager.notifySessionExpired();
      return handler.reject(err);
    }

    // Login must not trigger refresh.
    if (isLoginCall) {
      return handler.next(err);
    }

    // Do not retry the same request twice.
    if (alreadyRetried) {
      return handler.next(err);
    }

    try {
      final refreshFuture = _refreshFuture ??= _refreshToken();
      final newAccessToken = await refreshFuture;

      final request = err.requestOptions.copyWith(
        headers: {
          ...err.requestOptions.headers,
          'Authorization': 'Bearer $newAccessToken',
        },
        extra: {...err.requestOptions.extra, 'retried': true},
      );

      final response = await refreshDio.fetch(request);

      return handler.resolve(response);
    } catch (e) {
      if (e is DioException) {
        return handler.reject(e);
      }

      return handler.reject(
        DioException(requestOptions: err.requestOptions, error: e),
      );
    }
  }

  Future<String> _refreshToken() async {
    try {
      final token = await localDataSource.getCachedToken();

      final refreshToken = token?.refreshToken;

      if (refreshToken == null) {
        throw const InvalidCredentialsException();
      }

      if (kDebugMode) {
        log(
          'REFRESH START: '
          '${refreshToken.substring(0, 8)}...',
        );
      }

      final response = await refreshDio.post(
        _refreshPath,
        data: {'refreshToken': refreshToken},
        options: Options(extra: {'skipAuth': true}),
      );

      final authData = AuthModel.fromJson(response.data);

      final accessToken = authData.tokens.accessToken;
      final newRefreshToken = authData.tokens.refreshToken;

      await localDataSource.cacheToken(
        AuthTokenModel(accessToken: accessToken, refreshToken: newRefreshToken),
      );

      if (kDebugMode) {
        log(
          'REFRESH SUCCESS: '
          '${newRefreshToken.substring(0, 8)}...',
        );
      }

      return accessToken;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        sessionManager.notifySessionExpired();
      } else if (e is InvalidCredentialsException) {
        sessionManager.notifySessionExpired();
      }

      rethrow;
    } finally {
      _refreshFuture = null;
    }
  }
}
