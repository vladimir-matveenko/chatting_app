import 'package:freezed_annotation/freezed_annotation.dart';

enum ChatType { private, group }

enum ChatMemberRole { owner, admin, member }

enum MessageType { text, image, video, audio, file, system }

enum ReactionType { like, dislike }

enum MessageDeliveryStatus { sending, sent, delivered, read, failed }

enum NotificationType {
  @JsonValue('message')
  message,
  @JsonValue('chat_updated')
  chatUpdated,
  @JsonValue('admin_granted')
  adminGranted,
  @JsonValue('admin_revoked')
  adminRevoked,
  @JsonValue('member_added')
  memberAdded,
  @JsonValue('member_removed')
  memberRemoved,
  @JsonValue('chat_invite')
  chatInvite,
  @JsonValue('owner_changed')
  ownerChanged,
  @JsonValue('reaction')
  reaction,
  @JsonValue('reply')
  reply,
}
