import 'package:chatting_app/features/chat/presentation/cubit/cubit.dart';
import 'package:chatting_app/features/chat/presentation/cubit/state.dart';
import 'package:chatting_app/features/chat/presentation/widgets/set_group_name_block.dart';
import 'package:chatting_app/features/chats/presentation/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/presentation/widgets/app_back_button.dart';
import '../../../../core/presentation/widgets/app_message.dart';
import '../widgets/add_participants_block.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  late ChatCubit chatCubit;
  final _groupNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatCubit = context.read<ChatCubit>();
  }

  @override
  void deactivate() {
    chatCubit.setInitialStatus();
    super.deactivate();
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('createGroupScreen.screenName'.tr()),
            centerTitle: true,
            leading: const AppBackButton(),
          ),
          body: SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            minimum: const .only(left: 16.0, right: 16.0),
            child: state.status == CreateGroupStatus.initial
                ? const AddParticipantsBlock()
                : SetGroupNameBlock(controller: _groupNameController),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (state.status == CreateGroupStatus.initial) {
                if (state.selectedParticipants.isNotEmpty) {
                  chatCubit.setGroupNameStatus();
                } else {
                  AppMessage.error(
                    context,
                    message: 'errors.chatsErrors.addParticipants'.tr(),
                    onClose: () {
                      chatCubit.disableError();
                    },
                  );
                }
              } else {
                chatCubit.createGroup(_groupNameController.text);
              }
            },
            child: Icon(
              state.status == CreateGroupStatus.setName
                  ? Icons.check
                  : Icons.arrow_forward_outlined,
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == CreateGroupStatus.created) {
          context.read<ChatsCubit>().loadChats();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('${AppRoutes.chats}/${state.chat?.id}');
          });
        }
        if (state.error?.isNotEmpty == true) {
          AppMessage.error(
            context,
            message: state.error!,
            onClose: () {
              chatCubit.disableError();
            },
          );
        }
      },
    );
  }
}
