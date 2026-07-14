import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../domain/entity/message_reaction_entity.dart';

part 'message_reaction_model.freezed.dart';
part 'message_reaction_model.g.dart';

@freezed
abstract class MessageReactionModel with _$MessageReactionModel {
  const factory MessageReactionModel({
    required String id,
    required String messageId,
    required ReactionType type,
    required DateTime createdAt,
  }) = _MessageReactionModel;

  factory MessageReactionModel.fromJson(Map<String, dynamic> json) =>
      _$MessageReactionModelFromJson(json);
}

extension MessageReactionModelExt on MessageReactionModel {
  MessageReactionEntity toEntity() => MessageReactionEntity(
    id: id,
    messageId: messageId,
    type: type,
    createdAt: createdAt,
  );
}
