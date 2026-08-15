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
      backgroundColor: theme.cardTheme.color,
    );
    return avatar.isNotEmpty
        ? CircleAvatar(
            radius: size / 2,
            backgroundColor: theme.cardColor,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: avatar,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (ctx, st) => placeholder,
                errorWidget: (ctx, st, o) => placeholder,
              ),
            ),
          )
        : placeholder;
  }
}
