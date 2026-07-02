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

  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        cubit.checkAuth();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                mainAxisSize: .min,
                children: [
                  Image.asset(AssetPaths.splashLogo),
                  const WaveDotsLoader(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
