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

  Future<ChatModel?> updateChat({
    required String chatId,
    String? title,
    String? avatarUrl,
  });

  Future<List<ChatMemberModel>> getChatMembers({
    required String chatId,
    String? query,
    int? limit,
    int? offset,
  });

  Future<bool> deleteChatMember({
    required String chatId,
    required String userId,
  });

  Future<bool> addChatMember({
    required String chatId,
    required List<String> memberIds,
  });

  Future<bool> muteChat({required String chatId, required bool isMuted});

  Future<bool> changeOwner({required String chatId, required String userId});

  Future<bool> changeMemberRole({
    required String chatId,
    required String userId,
    required ChatMemberRole role,
  });

  Future<bool> leaveChat(String chatId);

  Future<ChatMemberModel?> getChatMember({
    required String chatId,
    required String userId,
  });

  Future<ChatMemberModel?> getMeFromChat(String chatId);
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
  Future<ChatModel?> updateChat({
    required String chatId,
    String? title,
    String? avatarUrl,
  }) async {
    return makeRequest<ChatModel?>(() async {
      final Map<String, dynamic> data = {};
      if (title != null) {
        data.addAll({'title': title});
      }
      if (avatarUrl != null) {
        data.addAll({'avatarUrl': avatarUrl});
      }
      if (title?.isNotEmpty == true || avatarUrl?.isNotEmpty == true) {
        final response = await dio.patch('chats/$chatId', data: data);
        if (response.statusCode == 200 && response.data != null) {
          return ChatModel.fromJson(response.data);
        }
      }
      return null;
    });
  }

  @override
  Future<List<ChatMemberModel>> getChatMembers({
    required String chatId,
    String? query,
    int? limit,
    int? offset,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (query?.isNotEmpty == true) {
      queryParameters.addAll({'query': query});
    }
    if (limit != null) {
      queryParameters.addAll({'limit': limit});
    }
    if (offset != null) {
      queryParameters.addAll({'offset': offset});
    }
    return makeRequest<List<ChatMemberModel>>(() async {
      final response = await dio.get(
        'chats/$chatId/members',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 && response.data != null) {
        return ChatMemberModel.fromList(response.data);
      }
      return [];
    });
  }

  @override
  Future<bool> deleteChatMember({
    required String chatId,
    required String userId,
  }) async {
    return makeRequest<bool>(() async {
      final response = await dio.delete('chats/$chatId/members/$userId');
      return response.statusCode == 204;
    });
  }

  @override
  Future<bool> addChatMember({
    required String chatId,
    required List<String> memberIds,
  }) {
    return makeRequest<bool>(() async {
      final response = await dio.post(
        'chats/$chatId/members',
        data: {'memberIds': memberIds},
      );
      return response.statusCode == 204;
    });
  }

  @override
  Future<bool> changeOwner({
    required String chatId,
    required String userId,
  }) async {
    return makeRequest<bool>(() async {
      final response = await dio.patch(
        'chats/$chatId/owner',
        data: {'userId': userId},
      );
      return response.statusCode == 204;
    });
  }

  @override
  Future<bool> changeMemberRole({
    required String chatId,
    required String userId,
    required ChatMemberRole role,
  }) async {
    return makeRequest<bool>(() async {
      final response = await dio.patch(
        'chats/$chatId/members/$userId/role',
        data: {'role': role.name},
      );
      return response.statusCode == 204;
    });
  }

  @override
  Future<bool> muteChat({required String chatId, required bool isMuted}) async {
    return makeRequest<bool>(() async {
      final response = await dio.patch(
        'chats/$chatId/mute',
        data: {'isMuted': isMuted},
      );
      return response.statusCode == 204;
    });
  }

  @override
  Future<bool> leaveChat(String chatId) async {
    return makeRequest<bool>(() async {
      final response = await dio.delete('chats/$chatId/members/me');
      return response.statusCode == 204;
    });
  }

  @override
  Future<ChatMemberModel?> getChatMember({
    required String chatId,
    required String userId,
  }) async {
    return makeRequest<ChatMemberModel?>(() async {
      final response = await dio.get('chats/$chatId/members/$userId');
      if (response.statusCode == 200 && response.data != null) {
        return ChatMemberModel.fromJson(response.data);
      }
      return null;
    });
  }

  @override
  Future<ChatMemberModel?> getMeFromChat(String chatId) async {
    return makeRequest<ChatMemberModel?>(() async {
      final response = await dio.get('chats/$chatId/members/me');
      if (response.statusCode == 200 && response.data != null) {
        return ChatMemberModel.fromJson(response.data);
      }
      return null;
    });
  }
}
