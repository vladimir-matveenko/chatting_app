import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants/asset_paths.dart';
import '../../../features/auth/presentation/cubit/cubit.dart';
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
      _initializeSplash();
      Future.delayed(const Duration(seconds: 1), cubit.checkAuth);
    });
  }

  Future<void> _initializeSplash() async {
    try {
      await Future.wait([
        precacheImage(const AssetImage(AssetPaths.splashBackground), context),
        precacheImage(const AssetImage(AssetPaths.splashLogo), context),
      ]);

      if (!mounted) return;
    } catch (e) {
      log(e.toString());
    } finally {
      setState(() {
        _imagesReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
