import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/messages/domain/entity/message_reaction_summary_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_reply_entity.dart';

part 'message_entity.freezed.dart';
part 'message_entity.g.dart';

@freezed
abstract class MessageEntity with _$MessageEntity {
  const factory MessageEntity({
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
    @JsonKey(defaultValue: [])
    required List<MessageReactionSummaryEntity> reactions,
    ReactionType? currentUserReaction,
    MessageReplyEntity? reply,
  }) = _MessageEntity;

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);
}
