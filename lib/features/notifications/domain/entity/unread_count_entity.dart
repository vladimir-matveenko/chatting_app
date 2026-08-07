import 'package:freezed_annotation/freezed_annotation.dart';

part 'unread_count_entity.freezed.dart';
part 'unread_count_entity.g.dart';

@freezed
abstract class UnreadCountEntity with _$UnreadCountEntity {
  const factory UnreadCountEntity({required int unreadCount}) =
      _UnreadCountEntity;

  factory UnreadCountEntity.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountEntityFromJson(json);
}
