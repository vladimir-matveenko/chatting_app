import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_participant_entity.freezed.dart';
part 'chat_list_participant_entity.g.dart';

@freezed
abstract class ChatListParticipantEntity with _$ChatListParticipantEntity {
  const factory ChatListParticipantEntity({
    required String username,
    String? displayName,
    String? avatarUrl,
  }) = _ChatListParticipantEntity;

  factory ChatListParticipantEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatListParticipantEntityFromJson(json);
}
