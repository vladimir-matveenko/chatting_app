import 'package:chatting_app/features/messages/data/models/message_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../core/error/dio_error_parser.dart';
import '../../../../core/error/exception.dart';

abstract class MessagesRemoteDataSource {
  Future<List<MessageModel>> loadMessages(String chatId);

  Future<MessageModel?> sendMessage({
    required String chatId,
    String? replyToId,
    required MessageType type,
    String? body,
  });

  Future<MessageModel?> getMessageById(String messageId);

  Future<MessageModel?> updateMessage({
    required String messageId,
    required String body,
  });

  Future<bool> deleteMessage(String messageId);

  Future<bool> addReaction(String messageId, {required ReactionType type});

  Future<bool> deleteReaction(String messageId);

  Future<MessageModel?> pinMessage(String messageId);

  Future<MessageModel?> unPinMessage(String messageId);

  Future<List<MessageModel>> getPinnedMessages({required String chatId});
}

@LazySingleton(as: MessagesRemoteDataSource)
class MessagesRemoteDataSourceImpl implements MessagesRemoteDataSource {
  MessagesRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<List<MessageModel>> loadMessages(String chatId) async {
    try {
      final response = await dio.get('messages/chat/$chatId');
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromList(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return [];
  }

  @override
  Future<MessageModel?> sendMessage({
    required String chatId,
    String? replyToId,
    required MessageType type,
    String? body,
  }) async {
    try {
      final data = {'type': type.name, 'replyToId': replyToId};
      if (body != null) {
        data.addAll({'body': body});
      }
      final response = await dio.post('messages/chat/$chatId', data: data);

      if (response.statusCode == 201 && response.data != null) {
        return MessageModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return null;
  }

  @override
  Future<MessageModel?> getMessageById(String messageId) async {
    try {
      final response = await dio.get('messages/$messageId');
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }

  @override
  Future<MessageModel?> updateMessage({
    required String messageId,
    required String body,
  }) async {
    try {
      final response = await dio.patch(
        'messages/$messageId',
        data: {'body': body},
      );
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromJson(response.data);
      }
    } on TypeError catch (e) {
      throw UnknownException(message: e.toString());
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }

  @override
  Future<bool> deleteMessage(String messageId) async {
    try {
      final response = await dio.delete('messages/$messageId');
      return response.statusCode == 204;
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return false;
  }

  @override
  Future<bool> addReaction(
    String messageId, {
    required ReactionType type,
  }) async {
    try {
      final response = await dio.post(
        'messages/$messageId/reactions',
        data: {'type': type.name},
      );
      return response.statusCode == 201;
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return false;
  }

  @override
  Future<bool> deleteReaction(String messageId) async {
    try {
      final response = await dio.delete('messages/$messageId/reactions');
      return response.statusCode == 204;
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return false;
  }

  @override
  Future<List<MessageModel>> getPinnedMessages({required String chatId}) async {
    try {
      final response = await dio.get('messages/chat/$chatId/pinned');
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromList(response.data);
      }
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw InvalidCredentialsException();
    }
    return [];
  }

  @override
  Future<MessageModel?> pinMessage(String messageId) async {
    try {
      final response = await dio.put('messages/$messageId/pin');
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromJson(response.data);
      }
    } on TypeError catch (e) {
      throw UnknownException(message: e.toString());
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }

  @override
  Future<MessageModel?> unPinMessage(String messageId) async {
    try {
      final response = await dio.delete('messages/$messageId/unpin');
      if (response.statusCode == 200 && response.data != null) {
        return MessageModel.fromJson(response.data);
      }
    } on TypeError catch (e) {
      throw UnknownException(message: e.toString());
    } on DioException catch (e) {
      DioErrorHandler.onDioError(e);
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
    return null;
  }
}
