import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exception.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel?> fetchProfile();

  Future<bool> updateProfile(UserModel profile);

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
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<bool> updateProfile(UserModel profile) async {
    try {
      final response = await dio.post('users/me');
      return response.statusCode == 200;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final serverMessage = e.response?.data?['error']?['message'] ?? '';
        throw UnknownException(message: serverMessage);
      } else if (e.response?.statusCode == 401) {
        throw InvalidCredentialsException();
      }
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
      final response = await dio.post(
        'users/me/password',
        data: {'currentPassword': currentPassword, 'newPassword': newPassword},
      );
      return response.statusCode == 204;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final serverMessage = e.response?.data?['error']?['message'] ?? '';
        throw UnknownException(message: serverMessage);
      } else if (e.response?.statusCode == 401) {
        throw InvalidCredentialsException();
      }
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return false;
  }
}
