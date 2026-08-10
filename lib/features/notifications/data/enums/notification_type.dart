import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'value')
enum NotificationType {
  message('message'),
  chatUpdated('chat_updated'),
  adminGranted('admin_granted'),
  adminRevoked('admin_revoked'),
  memberAdded('member_added'),
  memberRemoved('member_removed'),
  chatInvite('chat_invite'),
  ownerChanged('owner_changed'),
  reaction('reaction'),
  reply('reply');

  const NotificationType(this.value);

  final String value;
}
