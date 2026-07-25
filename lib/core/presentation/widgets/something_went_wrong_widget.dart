import 'package:chatting_app/app/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/asset_paths.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: const .symmetric(vertical: 16.0),
      child: Column(
        spacing: 16.0,
        mainAxisAlignment: .center,
        children: [
          Image.asset(
            height: context.isLandscape()
                ? screenSize.height * 0.6
                : screenSize.width * 0.6,
            AssetPaths.somethingWentWrong,
          ),
          Text(
            'errors.somethingWentWrong'.tr(),
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
