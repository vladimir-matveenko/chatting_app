import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/constants/asset_paths.dart';

class ProfileUtils {
  static Widget getLanguageIcon(String code) {
    var assetName = '';
    switch (code) {
      case 'en':
        assetName = AssetPaths.flagUs;
        break;
      case 'ru':
        assetName = AssetPaths.flagRu;
        break;
      default:
        assetName = '';
        break;
    }
    return SizedBox(
      width: 32.0,
      height: 24.0,
      child: SvgPicture.asset(
        assetName,
        errorBuilder: (_, e, s) => const SizedBox(),
      ),
    );
  }
}
