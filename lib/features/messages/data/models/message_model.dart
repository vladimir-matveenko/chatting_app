import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../domain/entity/message_entity.dart';
import 'message_reply_model.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    required String id,
    required String chatId,
    required String senderId,
    required MessageType type,
    String? body,
    String? replyToId,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @JsonKey(defaultValue: false) required bool isDeleted,
    MessageReplyModel? reply,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  static List<MessageModel> fromList(List<dynamic> list) {
    return AppUtils.parseList<MessageModel>(list, MessageModel.fromJson);
  }
}

extension MessageModelExt on MessageModel {
  MessageEntity toEntity() => MessageEntity(
    id: id,
    chatId: chatId,
    senderId: senderId,
    type: type,
    body: body,
    replyToId: replyToId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
    isDeleted: isDeleted,
    reply: reply?.toEntity(),
  );
}
