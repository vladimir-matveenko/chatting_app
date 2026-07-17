import 'package:chatting_app/features/messages/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../widgets/chat_screen_body.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.id});

  final String id;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    context.read<ChatCubit>().disableNavigate();
    context.read<MessagesCubit>().loadMessages(chatId: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChatScreenBody(chatId: widget.id);
  }
}
