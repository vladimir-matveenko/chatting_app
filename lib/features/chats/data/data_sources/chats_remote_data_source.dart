import 'package:chatting_app/features/chats/data/models/chat_list_item_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_parser.dart';
import '../../../../core/error/exception.dart';

abstract class ChatsRemoteDataSource {
  Future<List<ChatListItemModel>> loadChats();
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
}
