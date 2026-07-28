import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'around_context_entity.freezed.dart';
part 'around_context_entity.g.dart';

@freezed
abstract class AroundContextEntity with _$AroundContextEntity {
  const factory AroundContextEntity({
    required String targetMessageId,
    required bool hasPrevious,
    required bool hasNext,
    required List<MessageEntity> messages,
  }) = _AroundContextEntity;

  factory AroundContextEntity.fromJson(Map<String, dynamic> json) =>
      _$AroundContextEntityFromJson(json);
}
