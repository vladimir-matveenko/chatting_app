import 'package:chatting_app/features/messages/domain/entity/message_reply_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'message_reply_model.freezed.dart';
part 'message_reply_model.g.dart';

@freezed
abstract class MessageReplyModel with _$MessageReplyModel {
  const factory MessageReplyModel({
    required String id,
    required String senderId,
    required MessageType type,
    String? body,
    DateTime? deletedAt,
  }) = _MessageReplyModel;

  factory MessageReplyModel.fromJson(Map<String, dynamic> json) =>
      _$MessageReplyModelFromJson(json);
}

extension MessageReplyModelExt on MessageReplyModel {
  MessageReplyEntity toEntity() => MessageReplyEntity(
    id: id,
    senderId: senderId,
    type: type,
    body: body,
    deletedAt: deletedAt,
  );
}
