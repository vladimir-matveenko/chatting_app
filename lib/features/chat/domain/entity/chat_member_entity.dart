import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'chat_member_entity.freezed.dart';
part 'chat_member_entity.g.dart';

@freezed
abstract class ChatMemberEntity with _$ChatMemberEntity {
  const factory ChatMemberEntity({
    required String chatId,
    required String userId,
    required ChatMemberRole role,
    required DateTime joinedAt,
    String? lastReadMessageId,
    required bool isMuted,
    required bool isArchived,
    String? displayName,
    required String userName,
    String? avatarUrl,
  }) = _ChatMemberEntity;

  factory ChatMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberEntityFromJson(json);
}
