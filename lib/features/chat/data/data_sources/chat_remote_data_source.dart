import 'package:chatting_app/core/network/base_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../models/chat_member_model.dart';
import '../models/chat_model.dart';

abstract class ChatRemoteDataSource {
  Future<ChatModel?> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  });

  Future<ChatModel?> getChatById(String chatId);

  Future<List<ChatMemberModel>> getChatMembers({required String chatId});
}

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ChatRemoteDataSource {
  ChatRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<ChatModel?> createChat({
    required ChatType type,
    String? title,
    String? avatarUrl,
    required List<String> memberIds,
  }) async {
    return makeRequest<ChatModel?>(() async {
      final data = {'type': type.name, 'memberIds': memberIds};
      if (title != null) {
        data.addAll({'title': title});
      }
      if (avatarUrl != null) {
        data.addAll({'avatarUrl': avatarUrl});
      }
      final response = await dio.post('chats', data: data);

      if (response.statusCode == 201 && response.data != null) {
        return ChatModel.fromJson(response.data);
      }
      return null;
    });
  }

  @override
  Future<ChatModel?> getChatById(String chatId) async {
    return makeRequest<ChatModel?>(() async {
      final response = await dio.get('chats/$chatId');
      if (response.statusCode == 200 && response.data != null) {
        return ChatModel.fromJson(response.data);
      }
      return null;
    });
  }

  @override
  Future<List<ChatMemberModel>> getChatMembers({required String chatId}) async {
    return makeRequest<List<ChatMemberModel>>(() async {
      final response = await dio.get('chats/$chatId/members');
      if (response.statusCode == 200 && response.data != null) {
        return ChatMemberModel.fromList(response.data);
      }
      return [];
    });
  }
}
