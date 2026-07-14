import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'message_reply_entity.freezed.dart';
part 'message_reply_entity.g.dart';

@freezed
abstract class MessageReplyEntity with _$MessageReplyEntity {
  const factory MessageReplyEntity({
    required String id,
    required String senderId,
    required MessageType type,
    String? body,
    DateTime? deletedAt,
  }) = _MessageReplyEntity;

  factory MessageReplyEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageReplyEntityFromJson(json);
}
