import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/messages/data/models/message_sender_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../domain/entity/message_search_result_entity.dart';

part 'message_search_result_model.freezed.dart';
part 'message_search_result_model.g.dart';

@freezed
abstract class MessageSearchResultModel with _$MessageSearchResultModel {
  const MessageSearchResultModel._();

  const factory MessageSearchResultModel({
    required String messageId,
    required String chatId,
    required MessageSenderModel sender,
    required MessageType type,
    String? body,
    required DateTime createdAt,
  }) = _MessageSearchResultModel;

  factory MessageSearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$MessageSearchResultModelFromJson(json);

  static List<MessageSearchResultModel> fromList(List<dynamic> list) {
    return AppUtils.parseList<MessageSearchResultModel>(
      list,
      MessageSearchResultModel.fromJson,
    );
  }
}

extension MessageSearchResultModelExt on MessageSearchResultModel {
  MessageSearchResultEntity toEntity() => MessageSearchResultEntity(
    messageId: int.tryParse(messageId) ?? 0,
    chatId: chatId,
    sender: sender.toEntity(),
    type: type,
    body: body,
    createdAt: createdAt.toLocal(),
  );
}
