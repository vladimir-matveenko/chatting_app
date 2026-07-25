import 'package:flutter/material.dart';

import '../../../../app/theme/app_semantic_colors.dart';

class UserOnlineIndicator extends StatelessWidget {
  const UserOnlineIndicator({
    super.key,
    this.baseUserAvatarSize = 30.0,
    this.indicatorSize = 8.0,
  });

  final double baseUserAvatarSize;
  final double indicatorSize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppSemanticColors>()!;
    return Container(
      height: baseUserAvatarSize,
      alignment: Alignment.topCenter,
      child: Container(
        width: indicatorSize,
        height: indicatorSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.success,
        ),
      ),
    );
  }
}
