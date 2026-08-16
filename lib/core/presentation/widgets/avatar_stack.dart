import 'package:chatting_app/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.imageUrls,
    required this.names,
    this.avatarSize = 40.0,
    this.overlapFraction = 0.35,
    this.borderWidth = 2.0,
    this.placeholderBackgroundColor,
    this.borderColor,
  });

  final List<String> imageUrls;
  final List<String> names;
  final double avatarSize;
  final double overlapFraction;
  final double borderWidth;
  final Color? placeholderBackgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final double offsetAmount = avatarSize * (1 - overlapFraction);

    return SizedBox(
      height: avatarSize,
      width: imageUrls.isEmpty
          ? avatarSize
          : avatarSize + (imageUrls.length - 1) * offsetAmount,
      child: Stack(
        alignment: .center,
        children: List.generate(imageUrls.length, (index) {
          return Positioned(
            left: index * offsetAmount,
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor ?? Colors.white,
                  width: borderWidth,
                ),
              ),
              child: UserAvatar(
                size: avatarSize - 2 * borderWidth,
                avatar: imageUrls[index],
                firstName: names[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
