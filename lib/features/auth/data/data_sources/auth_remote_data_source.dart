import 'package:chatting_app/features/auth/data/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exception.dart';
import '../models/auth_token_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel?> register({
    required String username,
    required String email,
    required String password,
  });

  Future<AuthTokenModel?> login({
    required String email,
    required String password,
  });

  Future<bool> logout();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<AuthTokenModel?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth/register',
        queryParameters: {
          'username': username,
          'email': email,
          'password': password,
        },
        options: Options(extra: {'skipAuth': true}),
      );
      if (response.statusCode == 201 && response.data != null) {
        final authResult = AuthModel.fromJson(response.data);
        return authResult.tokens;
      }
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<AuthTokenModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        data: {'email': email, 'password': password},
        options: Options(extra: {'skipAuth': true}),
      );
      if (response.statusCode == 200 && response.data != null) {
        final authResult = AuthModel.fromJson(response.data);
        return authResult.tokens;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final serverMessage = e.response?.data?['error']?['message'] ?? '';
        throw UnknownException(message: serverMessage);
      } else if (e.response?.statusCode == 401) {
        throw InvalidCredentialsException();
      }
    } catch (e) {
      throw UnknownException();
    }

    return null;
  }

  @override
  Future<bool> logout() async {
    try {
      final response = await dio.post('auth/logout');
      return response.statusCode == 204;
    } catch (e) {
      throw InvalidCredentialsException();
    }
  }
}
