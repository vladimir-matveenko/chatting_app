import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exception.dart';
import '../../../auth/data/models/auth_token_model.dart';

abstract class LoginRemoteDataSource {
  Future<AuthTokenModel?> login(String email, String password);
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<AuthTokenModel?> login(String email, String password) async {
    final response = await dio.post(
      'auth/login',
      queryParameters: {'email': email, 'password': password},
      options: Options(extra: {'skipAuth': true}),
    );
    if (response.data != null) {
      return AuthTokenModel.fromJson(response.data);
    } else {
      throw InvalidCredentialsException();
    }
  }
}
