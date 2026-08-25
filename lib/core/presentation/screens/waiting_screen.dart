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
  final _time = 60;
  final _timerController = CountdownController();

  @override
  void initState() {
    _timerController.start(_time);
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
      body: Center(
        child: CountdownTimer(
          controller: _timerController,
          timer: (sec) {
            return Column(
              spacing: 8.0,
              crossAxisAlignment: .center,
              mainAxisSize: .min,
              children: [
                CustomProgressIndicator(
                  initialValue: _time,
                  currentValue: sec,
                  activeColor: theme.unselectedWidgetColor,
                  inactiveColor: theme.colorScheme.primary,
                ),
                Text(
                  'waitingScreen.waitingForServer'.tr(),
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            );
          },
          onFinishedPlaceholder: Column(
            spacing: 8.0,
            crossAxisAlignment: .center,
            mainAxisSize: .min,
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
