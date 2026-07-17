import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';
part 'chat_entity.g.dart';

@freezed
abstract class ChatEntity with _$ChatEntity {
  const factory ChatEntity({
    required String id,
    required ChatType type,
    String? title,
    String? avatarUrl,
    String? ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChatEntity;

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
}
