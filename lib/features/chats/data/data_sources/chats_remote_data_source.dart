import 'package:chatting_app/core/network/base_remote_data_source.dart';
import 'package:chatting_app/features/chats/data/models/chat_list_item_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatListItemModel>> loadChats();
}

@LazySingleton(as: ChatsRemoteDataSource)
class ChatsRemoteDataSourceImpl extends BaseRemoteDataSource
    implements ChatsRemoteDataSource {
  ChatsRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<ChatListItemModel>> loadChats() async {
    return makeRequest<List<ChatListItemModel>>(() async {
      final response = await dio.get('chats');
      if (response.statusCode == 200 && response.data != null) {
        return ChatListItemModel.fromList(response.data);
      }
      return [];
    });
  }
}
