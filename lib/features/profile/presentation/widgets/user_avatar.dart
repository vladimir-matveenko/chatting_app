import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/avatar_placeholder.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.avatar,
    this.size = 40.0,
    this.firstName,
    this.lastName,
  });

  final String avatar;
  final String? firstName;
  final String? lastName;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final placeholder = AvatarPlaceholder(
      size: size,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      backgroundColor: theme.unselectedWidgetColor,
    );
    return avatar.isNotEmpty
        ? CircleAvatar(
            radius: size,
            backgroundImage: CachedNetworkImageProvider(avatar),
            backgroundColor: theme.cardColor,
            onBackgroundImageError: (o, s) => placeholder,
          )
        : placeholder;
  }
}
