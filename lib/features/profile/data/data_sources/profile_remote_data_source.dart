import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_parser.dart';
import '../../../../core/error/exception.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel?> fetchProfile();

  Future<bool> updateProfile({
    String? username,
    String? displayName,
    String? email,
    String? avatarUrl,
  });

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<UserModel?> fetchProfile() async {
    try {
      final response = await dio.get('users/me');
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<bool> updateProfile({
    String? username,
    String? displayName,
    String? email,
    String? avatarUrl,
  }) async {
    try {
      Map<String, dynamic> data = {};
      if (username?.isNotEmpty == true) {
        data.addAll({'username': username});
      }
      if (displayName?.isNotEmpty == true) {
        data.addAll({'displayName': displayName});
      }
      if (email?.isNotEmpty == true) {
        data.addAll({'email': email});
      }
      if (avatarUrl?.isNotEmpty == true) {
        data.addAll({'avatarUrl': avatarUrl});
      }
      final response = await dio.patch('users/me', data: data);
      return response.statusCode == 200;
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return false;
  }

  @override
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await dio.patch(
        'users/me/password',
        data: {'currentPassword': currentPassword, 'newPassword': newPassword},
      );
      return response.statusCode == 204;
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return false;
  }
}
