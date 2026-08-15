import 'package:chatting_app/core/presentation/widgets/app_loader.dart';
import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.onTap,
    this.showLoader = false,
    required this.onDeleteTap,
  });

  final String avatarUrl;
  final String userName;
  final VoidCallback onTap;
  final VoidCallback onDeleteTap;
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: .center,
        children: [
          UserAvatar(
            size: 120.0,
            avatar: avatarUrl,
            firstName: userName,
            lastName: '',
          ),
          if (showLoader) const AppLoader(),
          if (avatarUrl.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                behavior: .translucent,
                onTap: onDeleteTap,
                child: Icon(
                  Icons.close,
                  color: theme.colorScheme.error,
                  size: 20.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
