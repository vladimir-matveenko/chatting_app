import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/chats/domain/entity/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
abstract class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String id,
    required ChatType type,
    String? title,
    String? avatarUrl,
    String? ownerId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}

extension ChatModelExt on ChatModel {
  ChatEntity toEntity() => ChatEntity(
    id: id,
    type: type,
    title: title,
    avatarUrl: avatarUrl,
    ownerId: ownerId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
