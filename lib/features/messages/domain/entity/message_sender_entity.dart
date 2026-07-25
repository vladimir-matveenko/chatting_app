import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_sender_entity.freezed.dart';
part 'message_sender_entity.g.dart';

@freezed
abstract class MessageSenderEntity with _$MessageSenderEntity {
  const factory MessageSenderEntity({
    required String id,
    required String userName,
    String? displayName,
    String? avatarUrl,
  }) = _MessageSenderEntity;

  factory MessageSenderEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageSenderEntityFromJson(json);
}
