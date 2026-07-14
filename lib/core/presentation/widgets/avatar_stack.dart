import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatting_app/core/presentation/widgets/avatar_placeholder.dart';
import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.imageUrls,
    required this.names,
    this.avatarSize = 40.0,
    this.overlapFraction = 0.35,
  });

  final List<String> imageUrls;
  final List<String> names;
  final double avatarSize;
  final double overlapFraction;

  @override
  Widget build(BuildContext context) {
    final double offsetAmount = avatarSize * (1 - overlapFraction);

    return SizedBox(
      height: avatarSize + 6,
      width: imageUrls.isEmpty
          ? 0
          : avatarSize + (imageUrls.length - 1) * offsetAmount + 6,
      child: Stack(
        children: List.generate(imageUrls.length, (index) {
          return Positioned(
            left: index * offsetAmount,
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
                errorWidget: (context, s, o) => AvatarPlaceholder(
                  size: avatarSize,
                  firstName: names[index],
                  lastName: '',
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
