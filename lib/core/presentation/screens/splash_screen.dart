import 'package:chatting_app/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants/asset_paths.dart';
import '../../../features/auth/presentation/cubit/cubit.dart';
import '../widgets/disable_back_navigation.dart';
import '../widgets/wave_dots_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthCubit cubit;

  bool _imagesReady = false;

  @override
  void initState() {
    super.initState();

    cubit = context.read<AuthCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppUtils.precacheImages(
        context,
        images: [AssetPaths.splashBackground, AssetPaths.splashLogo],
        onDone: () {
          setState(() {
            _imagesReady = true;
          });
        },
      );
      Future.delayed(const Duration(seconds: 1), cubit.checkAuth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DisableBackNavigation(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AssetPaths.splashBackground, fit: BoxFit.fill),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  spacing: 24.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_imagesReady) Image.asset(AssetPaths.splashLogo),

                    if (_imagesReady) const WaveDotsLoader(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
