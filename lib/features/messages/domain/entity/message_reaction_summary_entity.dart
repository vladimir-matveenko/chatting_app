import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';

part 'message_reaction_summary_entity.freezed.dart';
part 'message_reaction_summary_entity.g.dart';

@freezed
abstract class MessageReactionSummaryEntity
    with _$MessageReactionSummaryEntity {
  const factory MessageReactionSummaryEntity({
    required ReactionType type,
    required int count,
  }) = _MessageReactionSummaryEntity;

  factory MessageReactionSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageReactionSummaryEntityFromJson(json);
}
