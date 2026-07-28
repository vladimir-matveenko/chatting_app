import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/messages/data/models/message_model.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/around_context_entity.dart';

part 'around_context_model.freezed.dart';
part 'around_context_model.g.dart';

@freezed
abstract class AroundContextModel with _$AroundContextModel {
  const factory AroundContextModel({
    required String targetMessageId,
    required bool hasPrevious,
    required bool hasNext,
    required List<MessageModel> messages,
  }) = _AroundContextModel;

  factory AroundContextModel.fromJson(Map<String, dynamic> json) =>
      _$AroundContextModelFromJson(json);
}

extension AroundContextModelExt on AroundContextModel {
  AroundContextEntity toEntity() => AroundContextEntity(
    targetMessageId: targetMessageId,
    hasPrevious: hasPrevious,
    hasNext: hasNext,
    messages: AppUtils.listModelToListEntity<MessageModel, MessageEntity>(
      messages,
      (item) => item.toEntity(),
    ),
  );
}
