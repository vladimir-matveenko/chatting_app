import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/base_remote_data_source.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<bool> requestCode(String email);

  Future<String?> validateCode({required String email, required String code});

  Future<bool> resetPassword({
    required String resetToken,
    required String password,
  });
}

@LazySingleton(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ResetPasswordRemoteDataSource {
  ResetPasswordRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<bool> requestCode(String email) async {
    return makeRequest<bool>(() async {
      final response = await dio.post(
        '/auth/password-reset/request',
        data: {'email': email},
        options: Options(extra: {'skipAuth': true}),
      );
      return response.statusCode == 200;
    });
  }

  @override
  Future<String?> validateCode({
    required String email,
    required String code,
  }) async {
    return makeRequest<String?>(() async {
      final response = await dio.post(
        '/auth/password-reset/verify',
        data: {'email': email, 'code': code},
        options: Options(extra: {'skipAuth': true}),
      );
      if (response.statusCode == 200 && response.data != null) {
        return response.data['resetToken'];
      }
      return null;
    });
  }

  @override
  Future<bool> resetPassword({
    required String resetToken,
    required String password,
  }) async {
    return makeRequest<bool>(() async {
      final response = await dio.patch(
        '/auth/password-reset',
        data: {'resetToken': resetToken, 'password': password},
        options: Options(extra: {'skipAuth': true}),
      );
      return response.statusCode == 204;
    });
  }
}
