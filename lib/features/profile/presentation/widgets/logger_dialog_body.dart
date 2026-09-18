import 'package:chatting_app/features/profile/presentation/profile_cubit/cubit.dart';
import 'package:chatting_app/features/profile/presentation/profile_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggerDialogBody extends StatelessWidget {
  const LoggerDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final children = state.log.map(Text.new).toList();

        return state.log.isNotEmpty
            ? SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const .all(24.0),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: children,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
