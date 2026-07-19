import 'package:chatting_app/features/auth/data/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/base_remote_data_source.dart';
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
class AuthRemoteDataSourceImpl extends BaseRemoteDataSource
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<AuthTokenModel?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return makeRequest<AuthTokenModel?>(() async {
      final response = await dio.post(
        'auth/register',
        data: {'username': username, 'email': email, 'password': password},
        options: Options(extra: {'skipAuth': true}),
      );

      if (response.statusCode == 201 && response.data != null) {
        final authResult = AuthModel.fromJson(response.data);
        return authResult.tokens;
      }
      return null;
    });
  }

  @override
  Future<AuthTokenModel?> login({
    required String email,
    required String password,
  }) async {
    return makeRequest<AuthTokenModel?>(() async {
      final response = await dio.post(
        'auth/login',
        data: {'email': email, 'password': password},
        options: Options(extra: {'skipAuth': true}),
      );
      if (response.statusCode == 200 && response.data != null) {
        final authResult = AuthModel.fromJson(response.data);
        return authResult.tokens;
      }
      return null;
    });
  }

  @override
  Future<bool> logout() async {
    return makeRequest<bool>(() async {
      final response = await dio.post('auth/logout');
      return response.statusCode == 204;
    });
  }
}
