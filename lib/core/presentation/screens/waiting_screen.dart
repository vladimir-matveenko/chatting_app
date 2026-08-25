import 'package:chatting_app/core/presentation/widgets/app_back_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/asset_paths.dart';
import '../../../app/utils/extensions.dart';
import '../widgets/countdown_timer.dart';
import '../widgets/custom_progress_indicator.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  final _timerController = CountdownController();

  @override
  void initState() {
    _timerController.start(12);
    super.initState();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton()),
      body: Center(
        child: CountdownTimer(
          controller: _timerController,
          timer: (sec) {
            return CustomProgressIndicator(
              initialValue: 12,
              currentValue: sec,
              activeColor: theme.unselectedWidgetColor,
              inactiveColor: theme.colorScheme.primary,
            );
          },
          onFinishedPlaceholder: Column(
            spacing: 8.0,
            crossAxisAlignment: .center,
            children: [
              Image.asset(
                height: context.isLandscape()
                    ? screenSize.height * 0.6
                    : screenSize.width * 0.6,
                AssetPaths.noConnectionServer,
              ),
              Text(
                'errors.noConnectionWithServer'.tr(),
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
