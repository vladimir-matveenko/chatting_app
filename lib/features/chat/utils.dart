import 'package:chatting_app/features/users/domain/entity/users_list_item_entity.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatUtils {
  static String buildGroupName(
    String currentUserName,
    List<UserListItemEntity> participants,
  ) {
    String result = '';
    final firstParticipant =
        participants.first.displayName ?? participants.first.userName;
    if (participants.length > 1) {
      result =
          '$currentUserName, $firstParticipant ${'and'.tr()} ${'other'.plural(participants.length - 1)}';
    } else {
      result = '$currentUserName ${'and'.tr()} $firstParticipant';
    }
    return result;
  }
}
