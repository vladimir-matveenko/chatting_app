import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/chat_list_participant_entity.dart';

part 'chat_list_participant_model.freezed.dart';
part 'chat_list_participant_model.g.dart';

@freezed
abstract class ChatListParticipantModel with _$ChatListParticipantModel {
  const ChatListParticipantModel._();

  const factory ChatListParticipantModel({
    required String userName,
    String? displayName,
    String? avatarUrl,
  }) = _ChatListParticipantModel;

  factory ChatListParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListParticipantModelFromJson(json);
}

extension ChatListParticipantModelExt on ChatListParticipantModel {
  ChatListParticipantEntity toEntity() => ChatListParticipantEntity(
    userName: userName,
    displayName: displayName,
    avatarUrl: avatarUrl,
  );
}
