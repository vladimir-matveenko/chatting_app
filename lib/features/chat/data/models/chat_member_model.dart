import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../../../app/utils/app_utils.dart';
import '../../domain/entity/chat_member_entity.dart';

part 'chat_member_model.freezed.dart';
part 'chat_member_model.g.dart';

@freezed
abstract class ChatMemberModel with _$ChatMemberModel {
  const factory ChatMemberModel({
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
  }) = _ChatMemberModel;

  factory ChatMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMemberModelFromJson(json);

  static List<ChatMemberModel> fromList(List<dynamic> list) {
    return AppUtils.parseList<ChatMemberModel>(list, ChatMemberModel.fromJson);
  }
}

extension ChatMemberModelExt on ChatMemberModel {
  ChatMemberEntity toEntity() => ChatMemberEntity(
    chatId: chatId,
    userId: userId,
    role: role,
    joinedAt: joinedAt,
    lastReadMessageId: lastReadMessageId,
    isMuted: isMuted,
    isArchived: isArchived,
    displayName: displayName,
    userName: userName,
    avatarUrl: avatarUrl,
  );
}
