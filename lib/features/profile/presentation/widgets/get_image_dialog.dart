import 'dart:typed_data';

import 'package:chatting_app/app/router/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../profile_cubit/cubit.dart';

class GetImageDialog extends StatelessWidget {
  const GetImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Padding(
      padding: const .all(24.0),
      child: Column(
        spacing: 16.0,
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          OutlinedButton(
            onPressed: () async {
              context.pop();
              final bytes = await context.push<Uint8List>(AppRoutes.camera);

              if (bytes != null) {
                cubit.updateUserAvatar(bytes: bytes);
              }
            },
            child: Row(
              spacing: 8.0,
              mainAxisAlignment: .center,
              children: [
                Text('profileScreen.imageSource.camera'.tr()),
                const Icon(
                  Icons.camera_alt_outlined,
                  size: 16.0,
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              context.pop();
              cubit.updateUserAvatar();
            },
            child: Row(
              spacing: 8.0,
              mainAxisAlignment: .center,
              children: [
                Text('profileScreen.imageSource.gallery'.tr()),
                const Icon(
                  Icons.image,
                  size: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
