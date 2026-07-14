import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'message_reaction_entity.freezed.dart';
part 'message_reaction_entity.g.dart';

@freezed
abstract class MessageReactionEntity with _$MessageReactionEntity {
  const factory MessageReactionEntity({
    required String id,
    required String messageId,
    required ReactionType type,
    required DateTime createdAt,
  }) = _MessageReactionEntity;

  factory MessageReactionEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageReactionEntityFromJson(json);
}
