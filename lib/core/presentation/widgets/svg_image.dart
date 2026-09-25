import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({
    super.key,
    required this.asset,
    this.errorWidget,
    this.width,
    this.height,
  });

  final String asset;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      errorBuilder: (_, e, s) => errorWidget ?? const SizedBox(),
    );
  }
}
