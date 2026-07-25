import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/messages/data/models/message_reaction_summary_model.dart';
import 'package:chatting_app/features/messages/data/models/message_sender_model.dart';
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
    required MessageSenderModel sender,
    required MessageType type,
    String? body,
    String? replyToId,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @JsonKey(defaultValue: false) required bool isDeleted,
    @JsonKey(defaultValue: [])
    required List<MessageReactionSummaryModel> reactions,
    MessageReplyModel? reply,
    ReactionType? currentUserReaction,
    required String readCount,
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
    sender: sender.toEntity(),
    type: type,
    body: body,
    replyToId: replyToId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
    isDeleted: isDeleted,
    reactions: reactions.map((e) => e.toEntity()).toList(),
    currentUserReaction: currentUserReaction,
    reply: reply?.toEntity(),
    readCount: int.tryParse(readCount) ?? 0,
  );
}
