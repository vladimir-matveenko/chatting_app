import 'package:chatting_app/core/network/base_remote_data_source.dart';
import 'package:chatting_app/features/chats/data/models/chat_list_item_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatListItemModel>> loadChats({
    String? query,
    int? limit,
    int? offset,
  });

  Future<List<ChatListItemModel>> loadArchivedChats({
    String? query,
    int? limit,
    int? offset,
  });

  Future<bool> archive(String chatId);

  Future<bool> returnFromArchive(String chatId);
}

@LazySingleton(as: ChatsRemoteDataSource)
class ChatsRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ChatsRemoteDataSource {
  ChatsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<ChatListItemModel>> loadChats({
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
    return makeRequest<List<ChatListItemModel>>(() async {
      final response = await dio.get('chats', queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data != null) {
        return ChatListItemModel.fromList(response.data);
      }
      return [];
    });
  }

  @override
  Future<List<ChatListItemModel>> loadArchivedChats({
    String? query,
    int? limit,
    int? offset,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (query != null) {
      queryParameters.addAll({'query': query});
    }
    if (limit != null) {
      queryParameters.addAll({'limit': limit});
    }
    if (offset != null) {
      queryParameters.addAll({'offset': offset});
    }
    return makeRequest<List<ChatListItemModel>>(() async {
      final response = await dio.get(
        'chats/archive',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 && response.data != null) {
        return ChatListItemModel.fromList(response.data);
      }
      return [];
    });
  }

  @override
  Future<bool> archive(String chatId) async {
    return makeRequest<bool>(() async {
      final response = await dio.patch(
        'chats/$chatId/archive',
        data: {'isArchived': true},
      );
      return response.statusCode == 204;
    });
  }

  @override
  Future<bool> returnFromArchive(String chatId) async {
    return makeRequest<bool>(() async {
      final response = await dio.patch(
        'chats/$chatId/archive',
        data: {'isArchived': false},
      );
      return response.statusCode == 204;
    });
  }
}
