import 'package:flutter/material.dart';

import '../../../app/utils/app_utils.dart';

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({
    super.key,
    this.size = 40.0,
    required this.firstName,
    required this.lastName,
    this.backgroundColor,
  });

  final double size;
  final String firstName;
  final String lastName;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(fontSize: size * 0.5);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Text(
            AppUtils.getFirstLetter(firstName).toUpperCase(),
            style: textStyle,
          ),
          Text(
            AppUtils.getFirstLetter(lastName).toUpperCase(),
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
