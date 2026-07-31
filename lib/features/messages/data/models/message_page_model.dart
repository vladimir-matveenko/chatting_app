import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:chatting_app/features/messages/data/models/message_model.dart';
import 'package:chatting_app/features/messages/domain/entity/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/message_page_entity.dart';

part 'message_page_model.freezed.dart';
part 'message_page_model.g.dart';

@freezed
abstract class MessagesPageModel with _$MessagesPageModel {
  const factory MessagesPageModel({
    required bool hasPrevious,
    required bool hasNext,
    required List<MessageModel> messages,
  }) = _MessagesPageModel;

  factory MessagesPageModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesPageModelFromJson(json);
}

extension MessagesPageModelExt on MessagesPageModel {
  MessagesPageEntity toEntity() => MessagesPageEntity(
    hasPrevious: hasPrevious,
    hasNext: hasNext,
    messages: AppUtils.listModelToListEntity<MessageModel, MessageEntity>(
      messages,
      (item) => item.toEntity(),
    ),
  );
}
