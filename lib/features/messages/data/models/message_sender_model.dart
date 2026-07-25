import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/message_sender_entity.dart';

part 'message_sender_model.freezed.dart';
part 'message_sender_model.g.dart';

@freezed
abstract class MessageSenderModel with _$MessageSenderModel {
  const factory MessageSenderModel({
    required String id,
    required String userName,
    String? displayName,
    String? avatarUrl,
  }) = _MessageSenderModel;

  factory MessageSenderModel.fromJson(Map<String, dynamic> json) =>
      _$MessageSenderModelFromJson(json);
}

extension MessageSenderModelExt on MessageSenderModel {
  MessageSenderEntity toEntity() => MessageSenderEntity(
    id: id,
    userName: userName,
    displayName: displayName,
    avatarUrl: avatarUrl,
  );
}
