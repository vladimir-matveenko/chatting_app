import 'package:chatting_app/features/chats/data/chats_enums.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_parser.dart';
import '../../../../core/error/exception.dart';
import '../../../auth/data/models/user_model.dart';

abstract class ChatsRemoteDataSource {
  Future<UserModel?> loadChats();

  Future<UserModel?> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  });

  Future<UserModel?> getChatById(String chatId);

  Future<UserModel?> getChatMembers({required String chatId});
}

@LazySingleton(as: ChatsRemoteDataSource)
class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  ChatsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<UserModel?> loadChats() async {
    try {
      final response = await dio.get('chats');
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<UserModel?> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  }) async {
    try {
      final response = await dio.post(
        'chats',
        data: {
          'type': type,
          'title': title,
          'avatarUrl': avatarUrl,
          'memberIds': memberIds,
        },
      );

      if (response.statusCode == 201 && response.data != null) {
        return UserModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 409) {
        final serverMessage = e.response?.data?['error']?['message'] ?? '';
        throw UnknownException(message: serverMessage);
      } else if (e.response?.statusCode == 401) {
        throw InvalidCredentialsException();
      }
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<UserModel?> getChatById(String chatId) async {
    try {
      final response = await dio.get('chats/$chatId');
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }

  @override
  Future<UserModel?> getChatMembers({required String chatId}) async {
    try {
      final response = await dio.get('chats/$chatId/members');
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }
}
