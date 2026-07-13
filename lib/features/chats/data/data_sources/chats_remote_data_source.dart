import 'package:chatting_app/features/chats/data/models/chat_list_item_model.dart';
import 'package:chatting_app/features/chats/data/models/chat_member_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/dio_error_parser.dart';
import '../../../../core/error/exception.dart';
import '../models/chat_model.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatListItemModel>> loadChats();

  Future<ChatModel?> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  });

  Future<ChatModel?> getChatById(String chatId);

  Future<List<ChatMemberModel>> getChatMembers({required String chatId});
}

@LazySingleton(as: ChatsRemoteDataSource)
class ChatsRemoteDataSourceImpl implements ChatsRemoteDataSource {
  ChatsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<ChatListItemModel>> loadChats() async {
    try {
      final response = await dio.get('chats');
      if (response.statusCode == 200 && response.data != null) {
        return ChatListItemModel.fromList(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return [];
  }

  @override
  Future<ChatModel?> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  }) async {
    try {
      final response = await dio.post(
        'chats',
        data: {
          'type': type.name,
          'title': title,
          'avatarUrl': avatarUrl,
          'memberIds': memberIds,
        },
      );

      if (response.statusCode == 201 && response.data != null) {
        return ChatModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<ChatModel?> getChatById(String chatId) async {
    try {
      final response = await dio.get('chats/$chatId');
      if (response.statusCode == 200 && response.data != null) {
        return ChatModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }

  @override
  Future<List<ChatMemberModel>> getChatMembers({required String chatId}) async {
    try {
      final response = await dio.get('chats/$chatId/members');
      if (response.statusCode == 200 && response.data != null) {
        return ChatMemberModel.fromList(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return [];
  }
}
