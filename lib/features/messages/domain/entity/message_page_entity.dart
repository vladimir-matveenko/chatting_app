import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_page_entity.freezed.dart';
part 'message_page_entity.g.dart';

@freezed
abstract class MessagesPageEntity with _$MessagesPageEntity {
  const factory MessagesPageEntity({
    required bool hasPrevious,
    required bool hasNext,
    required List<MessageEntity> messages,
  }) = _MessagesPageEntity;

  factory MessagesPageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessagesPageEntityFromJson(json);
}
