import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/unread_count_entity.dart';

part 'unread_count_model.freezed.dart';
part 'unread_count_model.g.dart';

@freezed
abstract class UnreadCountModel with _$UnreadCountModel {
  const factory UnreadCountModel({required int unreadCount}) =
      _UnreadCountModel;

  factory UnreadCountModel.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountModelFromJson(json);
}

extension UnreadCountModelExt on UnreadCountModel {
  UnreadCountEntity toEntity() => UnreadCountEntity(unreadCount: unreadCount);
}
