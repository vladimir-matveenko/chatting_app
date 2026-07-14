import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/constants/app_enums.dart';
import '../../domain/entity/message_reaction_summary_entity.dart';

part 'message_reaction_summary_model.freezed.dart';
part 'message_reaction_summary_model.g.dart';

@freezed
abstract class MessageReactionSummaryModel with _$MessageReactionSummaryModel {
  const factory MessageReactionSummaryModel({
    required ReactionType type,
    required int count,
  }) = _MessageReactionSummaryModel;

  factory MessageReactionSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$MessageReactionSummaryModelFromJson(json);
}

extension MessageReactionSummaryModelExt on MessageReactionSummaryModel {
  MessageReactionSummaryEntity toEntity() =>
      MessageReactionSummaryEntity(type: type, count: count);
}
