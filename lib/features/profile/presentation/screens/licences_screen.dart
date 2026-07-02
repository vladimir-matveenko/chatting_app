import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/presentation/widgets/app_loader.dart';

class LicensesScreen extends StatefulWidget {
  const LicensesScreen({super.key});

  @override
  State<LicensesScreen> createState() => _LicensesScreenState();
}

class _LicensesScreenState extends State<LicensesScreen> {
  late Future<PackageInfo> _future;

  @override
  void initState() {
    _future = PackageInfo.fromPlatform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const AppLoader();
        }

        final info = snapshot.data!;

        return LicensePage(
          applicationName: info.appName,
          applicationVersion: '${info.version} (${info.buildNumber})',
        );
      },
    );
  }
}
