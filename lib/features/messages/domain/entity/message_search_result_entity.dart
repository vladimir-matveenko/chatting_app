import 'package:chatting_app/app/constants/app_enums.dart';
import 'package:chatting_app/features/messages/domain/entity/message_sender_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_search_result_entity.freezed.dart';
part 'message_search_result_entity.g.dart';

@freezed
abstract class MessageSearchResultEntity with _$MessageSearchResultEntity {
  const factory MessageSearchResultEntity({
    required int messageId,
    required String chatId,
    required MessageSenderEntity sender,
    required MessageType type,
    String? body,
    required DateTime createdAt,
  }) = _MessageSearchResultEntity;

  factory MessageSearchResultEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageSearchResultEntityFromJson(json);
}
